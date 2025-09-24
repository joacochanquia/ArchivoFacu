# Script to perform "common modulus" attack on two RSA public keys and two ciphertexts.
# It tries to extract modulus and exponent using openssl, reads the ciphertext files,
# and attempts to recover the plaintext using the extended Euclidean trick.
#
# Usage: run in the directory that contains key1.pub, key2.pub, flag1.enc, flag2.enc
# This cell will run here and print the results.
import subprocess, sys, os, base64, math

FILES = {
    "key1": "key1.pub",
    "key2": "key2.pub",
    "c1": "flag1.enc",
    "c2": "flag2.enc"
}

def run_openssl_pubinfo(path):
    # Run `openssl rsa -pubin -in <path> -text -noout` and parse Modulus and Exponent
    try:
        out = subprocess.check_output(["openssl", "rsa", "-pubin", "-in", path, "-text", "-noout"], stderr=subprocess.STDOUT)
        out = out.decode()
    except subprocess.CalledProcessError as e:
        # If openssl complains, return None
        return None, None, str(e.output.decode() if e.output else e)
    # parse Modulus (hex lines) and Exponent
    mod_lines = []
    expo = None
    capture = False
    for line in out.splitlines():
        if line.strip().startswith("Modulus:"):
            capture = True
            continue
        if capture:
            if line.strip().startswith("Exponent:"):
                capture = False
            else:
                # strip spaces and colons
                mod_lines.append(line.strip().replace(":", "").replace(" ", ""))
        if line.strip().startswith("Exponent:"):
            # example: Exponent: 65537 (0x10001)
            parts = line.strip().split()
            try:
                expo = int(parts[1])
            except:
                # try to find hex value in parentheses
                if "(" in line and ")" in line:
                    hexpart = line[line.find("(")+1:line.find(")")]
                    if hexpart.startswith("0x"):
                        expo = int(hexpart, 16)
    if mod_lines:
        mod_hex = "".join(mod_lines)
        try:
            n = int(mod_hex, 16)
        except Exception as e:
            return None, None, f"Failed parse modulus hex: {e}"
        return n, expo, None
    return None, None, "Could not parse openssl output"

def try_base64_or_bin(path):
    data = open(path, "rb").read()
    # Heuristic: if file is ascii-like and decodes as base64 -> return base64-decoded bytes
    try:
        # Check ascii
        s = data.decode('ascii').strip()
        # Remove whitespace and newlines for base64 check
        sb = "".join(s.split())
        # Base64 chars check (very permissive)
        import re
        if re.fullmatch(r"[A-Za-z0-9+/=]+", sb) and len(sb) % 4 == 0:
            try:
                dec = base64.b64decode(sb)
                # small sanity: decoded length > 0
                if len(dec) > 0:
                    return dec
            except Exception:
                pass
    except Exception:
        pass
    # fallback: return raw bytes
    return data

def int_from_bytes_be(b):
    return int.from_bytes(b, byteorder='big')

def egcd(a, b):
    if b == 0:
        return (a, 1, 0)
    else:
        g, x, y = egcd(b, a % b)
        return (g, y, x - (a // b) * y)

def modinv(a, m):
    g, x, y = egcd(a, m)
    if g != 1:
        raise ValueError("modular inverse does not exist (gcd != 1)")
    return x % m

def recover_message_from_common_modulus(n, e1, e2, c1, c2):
    # Extended gcd to find s,t so that s*e1 + t*e2 = gcd
    g, s, t = egcd(e1, e2)
    if g != 1:
        raise ValueError(f"gcd(e1,e2) = {g} != 1; standard common-modulus trick requires gcd=1")
    # handle negative s/t by using modular inverses
    if s < 0:
        c1_part = pow(modinv(c1, n), -s, n)
    else:
        c1_part = pow(c1, s, n)
    if t < 0:
        c2_part = pow(modinv(c2, n), -t, n)
    else:
        c2_part = pow(c2, t, n)
    m = (c1_part * c2_part) % n
    return m

# --- Main run ---
print("Looking up key info with openssl...")
n1, e1, err1 = run_openssl_pubinfo(FILES["key1"])
n2, e2, err2 = run_openssl_pubinfo(FILES["key2"])
if n1 is None:
    print("Key1 parsing failed:", err1)
if n2 is None:
    print("Key2 parsing failed:", err2)

print("\nKey1: n1 =", "present" if n1 else "None", ", e1 =", e1)
print("Key2: n2 =", "present" if n2 else "None", ", e2 =", e2)

if n1 and n2:
    # quick compare
    if n1 == n2:
        print("\nBoth keys share the SAME modulus n (common modulus). Good candidate for attack.")
    else:
        # compute gcd of moduli
        g = math.gcd(n1, n2)
        print("\nModuli are different. gcd(n1,n2) =", g)
        if g != 1:
            print("They share a prime factor! This allows factorization and recovery of private keys.")
        else:
            print("No common factor detected. Common-modulus attack not applicable unless same n.")

# Read ciphertexts
print("\nReading ciphertext files and trying heuristics...")
c1_bytes = try_base64_or_bin(FILES["c1"])
c2_bytes = try_base64_or_bin(FILES["c2"])
print("flag1.enc size:", len(c1_bytes), "bytes; flag2.enc size:", len(c2_bytes), "bytes")

c1 = int_from_bytes_be(c1_bytes)
c2 = int_from_bytes_be(c2_bytes)
print("Interpreted ciphertexts as big-endian integers.")

# Try common modulus attack if n1==n2
if n1 and n2 and n1 == n2 and e1 and e2:
    print("\nAttempting classic common-modulus attack (requires gcd(e1,e2)=1)...")
    try:
        m = recover_message_from_common_modulus(n1, e1, e2, c1, c2)
        # convert m to bytes
        m_len = (m.bit_length() + 7) // 8
        m_bytes = m.to_bytes(m_len, byteorder='big')
        print("\nRecovered message bytes (raw):\n", m_bytes[:200])
        try:
            txt = m_bytes.decode('utf-8', errors='ignore')
            print("\nRecovered plaintext (utf-8, errors ignored):\n", txt)
        except Exception as e:
            print("Could not decode bytes to utf-8:", e)
    except Exception as e:
        print("Common-modulus attack failed:", e)
else:
    # If they have common factor, try reconstruct private key for one
    if n1 and n2 and math.gcd(n1, n2) != 1:
        g = math.gcd(n1, n2)
        print("\nThey share factor g =", g)
        # Factor n1 or n2 using g
        if n1 % g == 0:
            p = g
            q = n1 // p
            phi = (p-1)*(q-1)
            # try to compute d for e1
            try:
                d1 = modinv(e1, phi)
                print("Computed d1 for key1. Attempting RSA decryption of flag1...")
                # decrypt using pow(c1,d,n1)
                m1 = pow(c1, d1, n1)
                m1_bytes = m1.to_bytes((m1.bit_length()+7)//8, byteorder='big')
                print("flag1 plaintext:", m1_bytes.decode('utf-8', errors='ignore'))
            except Exception as e:
                print("Failed to compute d1 or decrypt flag1:", e)
        else:
            print("Unexpected: n1 not divisible by gcd")

print("\nDone. If output above contains FortID{...} that's the flag.")

# Also save this script for convenience
script_text = r'''# common_modulus_attack.py
# Run in directory with key1.pub, key2.pub, flag1.enc, flag2.enc
# ... (script content omitted here in saved file) ...
'''
open("/mnt/data/common_modulus_attack_saved.py", "w").write(script_text)
print("Saved helper script to /mnt/data/common_modulus_attack_saved.py")
