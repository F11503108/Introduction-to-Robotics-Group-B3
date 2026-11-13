# Vitácora ala fecha 13 Noviembre
* Resulta que RC+5.0 (a.k.a el unico que funciona con el controlador de mi robot) no admite conexiones socket algo, reales TCP/IP con el controlador virtual con el cual se usa el simulador, solo "simula" conectarse (es esquizofrenico???)
* Para probar con el simulador se necesita migrar el proyecto a la versión RC+7.0 que si ya crea la conexión, existe una forma de importar y migrar la compatibilidad solo que queda pendiente saber si no hay problema haciendo a la inversa
* Actualmente las funciones "Move piece" solo lleva la punta del gripper hasta las coordenadas pero no activa su puerto I/O
* Hay que revisar si el tamaño del tablero (200 x 200 mm)
*   entran bien
