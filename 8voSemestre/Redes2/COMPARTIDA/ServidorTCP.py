import socket

def tcp_server(host, port):
    # Crear un socket TCP
    server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    server_socket.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
    
    # Asociar el socket a la direccion y puerto
    server_socket.bind((host, port))
    server_socket.listen(5)
    print(f"Servidor TCP escuchando en {host}:{port}")

    while True:
        # Aceptar conexion entrante
        client_socket, client_address = server_socket.accept()
        print(f"Conexion recibida de {client_address}")

        # Recibir y descartar datos
        while True:
            data = client_socket.recv(1024)  # Recibir hasta 1024 bytes
            if not data:  # Si no hay datos, el cliente cerro la conexion
                break
        print(f"Conexion cerrada por {client_address}")
        client_socket.close()

# Configuracion del servidor
HOST = "0.0.0.0"  # Escuchar en todas las interfaces
PORT = 9000

tcp_server(HOST, PORT)
