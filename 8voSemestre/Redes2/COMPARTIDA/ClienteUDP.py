import socket

def udp_echo_client(server_ip, server_port):
    # Crear un socket UDP
    sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)

    # Enviar mensaje al servidor
    message = "Hola, servidor UDP Echo"
    print(f"Enviando: {message}")
    sock.sendto(message.encode(), (server_ip, server_port))

    # Recibir respuesta del servidor
    response, server = sock.recvfrom(1024)
    print(f"Recibido: {response.decode()}")

    sock.close()

# Configurar dirección y puerto del servidor
server_ip = "140.222.20.2"  # Cambiar por la IP del servidor
server_port = 7                # Puerto estándar UDP Echo

udp_echo_client(server_ip, server_port)
