import time
import os
import chess
import chess.engine
# (Asegúrate de configurar la ruta de tu stockfish.exe aquí arriba)

archivo = r"C:\Ajedrez\datos.txt"
print(f"Modo Archivos activado. Monitoreando: {archivo}")

while True:
    if os.path.exists(archivo):
        try:
            # Leer el estado actual del archivo
            with open(archivo, 'r', encoding='utf-8') as f:
                lineas = f.read().splitlines()
            
            # Si el archivo tiene datos y es el turno del humano
            if len(lineas) >= 2 and lineas[0] == "HUMANO":
                jugada_humano = lineas[1].strip().upper()
                print(f"El humano jugó: {jugada_humano}")
                
                # --- TU LÓGICA DE STOCKFISH AQUÍ ---
                # Ej: board.push_uci(jugada_humano.lower())
                # Ej: result = engine.play(board, chess.engine.Limit(time=0.5))
                # Ej: respuesta_robot = result.move.uci().upper()
                
                # JUGADA DE PRUEBA (Borra esto al integrar tu Stockfish real):
                respuesta_robot = "E7E5" 
                # -----------------------------------
                
                print(f"Stockfish responde: {respuesta_robot}")
                
                # Sobrescribir el archivo pasando el turno al ROBOT
                with open(archivo, 'w', encoding='utf-8') as f:
                    f.write("ROBOT\n")
                    f.write(respuesta_robot + "\n")
                    
        except Exception:
            # Si EPSON RC+ está escribiendo en este exacto milisegundo, 
            # ignoramos el error de lectura y probamos en el siguiente ciclo.
            pass
            
    # Pausa para no saturar el disco duro
    time.sleep(0.5)