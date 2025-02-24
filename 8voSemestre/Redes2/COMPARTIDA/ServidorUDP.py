import socket

def udp_echo_server(host, port):
    # Crear socket UDP
    sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    sock.bind((host, port))

    print(f"Servidor UDP Echo escuchando en {host}:{port}")

    while True:
        # Recibir datos
        data, addr = sock.recvfrom(1024)
        print(f"Mensaje recibido de {addr}: {data.decode()}")

        # Enviar respuesta
        sock.sendto(data, addr)

# Configura la IP del servidor y el puerto (puedes usar 7)
server_ip = "0.0.0.0"  # Escucha en todas las interfaces
server_port = 7         # Puerto estándar UDP Echo

udp_echo_server(server_ip, server_port)