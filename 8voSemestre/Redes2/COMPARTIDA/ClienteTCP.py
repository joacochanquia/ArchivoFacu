import socket
import time  # Importar el módulo time para usar sleep

def tcp_client(host, port, message):
    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as client_socket:
        client_socket.connect((host, port))
        print(f"Conectado a {host}:{port}")
        client_socket.sendall(message.encode())
        if port == 7:  # Solo esperar respuesta si el servicio es echo
            response = client_socket.recv(1024)
            print(f"Respuesta: {response.decode()}")
        print("Conexión cerrada")

# Configuración del cliente
HOST = "140.222.20.2"  # Cambiar por la IP del nodo n9
PORT_DISCARD = 9
PORT_ECHO = 7

# Enviar datos al servicio discard
tcp_client(HOST, PORT_DISCARD, "Prueba discard")

# Esperar un segundo antes de enviar el mensaje al servicio echo
time.sleep(1)  # Pausa la ejecución durante 1 segundo

# Enviar datos al servicio echo
tcp_client(HOST, PORT_ECHO, "Prueba echo")