import socket
import chess
import chess.engine

RUTA_STOCKFISH = r"stockfish.exe"
tablero = chess.Board()

HOST = '127.0.0.1'   # simulador: 127.0.0.1 | robot real: IP del controlador
PORT = 5050

with chess.engine.SimpleEngine.popen_uci(RUTA_STOCKFISH) as motor:
    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
        print(f"Conectando al robot en {HOST}:{PORT}...")
        s.connect((HOST, PORT))
        print("¡Conectado al robot EPSON!")

        while True:
            data = s.recv(1024)
            if not data:
                break

            movimiento_humano = data.decode('utf-8').strip().lower()
            print(f"Humano juega: {movimiento_humano}")

            try:
                movimiento = chess.Move.from_uci(movimiento_humano)
                if movimiento in tablero.legal_moves:
                    tablero.push(movimiento)
                    resultado = motor.play(tablero, chess.engine.Limit(time=1.0))
                    jugada_robot = resultado.move
                    es_captura = tablero.is_capture(jugada_robot)
                    tablero.push(jugada_robot)

                    respuesta = ("X" if es_captura else "N") + str(jugada_robot).upper()
                    print(f"Stockfish responde: {respuesta}")
                    s.sendall(respuesta.encode('utf-8') + b'\r\n')
                else:
                    print("Movimiento ilegal.")
                    s.sendall(b"ERROR\r\n")
            except ValueError:
                print("Formato incorrecto.")
                s.sendall(b"ERROR\r\n")