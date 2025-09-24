#!/usr/bin/env python3
# inspect_subclasses.py
# Script de ayuda para explorar __subclasses__() con índices.

import sys

def get_subclasses():
    try:
        subs = ().__class__.__base__.__subclasses__()
    except Exception as e:
        print("Error accediendo a subclasses:", e)
        return []
    return list(subs)

def print_indexed(subs, start=0, stop=None):
    stop = stop or len(subs)
    for i, c in enumerate(subs[start:stop], start=start):
        try:
            mod = c.__module__
        except:
            mod = "<unknown>"
        try:
            name = c.__name__
        except:
            name = str(c)
        print(f"{i:4d}  {name:40s}  module={mod}")

def inspect_at_index(subs, idx):
    c = subs[idx]
    print("="*60)
    print("Class:", c)
    print("repr:", repr(c))
    print("module:", getattr(c, "__module__", None))
    print("name:", getattr(c, "__name__", None))
    print("\n__mro__:")
    for m in getattr(c, "__mro__", ()):
        print("   ", m)
    print("\n__doc__ (first 400 chars):")
    doc = getattr(c, "__doc__", "")
    if doc:
        print(doc[:400].replace("\n", " ") + ("..." if len(doc) > 400 else ""))
    else:
        print("<no docstring>")
    print("\ndir() sample (first 200 chars):")
    try:
        d = dir(c)
        print(", ".join(d[:80]))
    except Exception as e:
        print("dir error:", e)
    print("="*60)

def main():
    subs = get_subclasses()
    if not subs:
        print("No subclasses found or error.")
        return

    print("Found", len(subs), "subclasses of base type.\n")
    print("First 120 entries (index, name, module):")
    print_indexed(subs, 0, min(120, len(subs)))
    print("\nCommands:")
    print("  idx            -> Inspect class at index idx (number).")
    print("  list a b       -> print index list from a to b (inclusive).")
    print("  quit / exit    -> Exit.")
    print("")
    while True:
        try:
            cmd = input("helper> ").strip()
        except EOFError:
            break
        if not cmd:
            continue
        if cmd in ("quit","exit"):
            break
        parts = cmd.split()
        if parts[0] == "list" and len(parts) >= 3:
            try:
                a = int(parts[1])
                b = int(parts[2])
                print_indexed(subs, a, b+1)
            except Exception as e:
                print("Error parsing list arguments:", e)
            continue
        try:
            idx = int(parts[0])
            if idx < 0 or idx >= len(subs):
                print("Índice fuera de rango 0..", len(subs)-1)
                continue
            inspect_at_index(subs, idx)
        except ValueError:
            print("Comando no reconocido. Usa un índice numérico o 'list a b'.")
        except Exception as e:
            print("Error:", e)

if __name__ == "__main__":
    main()
