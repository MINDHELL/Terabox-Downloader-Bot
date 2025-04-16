import socket
import threading
import os

HOST = "0.0.0.0"
PORT = int(os.environ.get("PORT", 8080))  # Koyeb sets this

def start_health_check():
    """Start a TCP-based HTTP health check server for Koyeb."""
    def run_server():
        with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as server:
            server.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
            server.bind((HOST, PORT))
            server.listen(5)
            print(f"✅ Health check running on port {PORT}")

            while True:
                conn, _ = server.accept()
                conn.sendall(b"HTTP/1.1 200 OK\r\nContent-Type: text/plain\r\n\r\nBot is running")
                conn.close()

    thread = threading.Thread(target=run_server, daemon=True)
    thread.start()
