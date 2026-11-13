# Vitácora a la fecha 13 Noviembre
* Resulta que RC+5.0 (a.k.a el unico que funciona con el controlador de mi robot) no admite conexiones socket algo, reales TCP/IP con el controlador virtual con el cual se usa el simulador, solo "simula" conectarse (es esquizofrenico???)
* Para probar con el simulador se necesita migrar el proyecto a la versión RC+7.0 que si ya crea la conexión, existe una forma de importar y migrar la compatibilidad solo que queda pendiente saber si no hay problema haciendo a la inversa
* Actualmente las funciones "Move piece" solo lleva la punta del gripper hasta las coordenadas pero no activa su puerto I/O
* Hay que revisar si el tamaño del tablero (200 x 200 mm), Entran bien las piezas con espacio para que el gripper entre sin problemas y no choque con otras cosas y si se puede imprimir todo de una o hay que trozar (problema del T.A que imprime?)
* Las piezas de ajedrez estan hechas pero varian mucho el diametro con la altura. Hay que encontrar un diseño que iguale por lo menos x mm del mismo cross-section, no tan alto (por estetica y que tosquea el gripper), ah y que sea lindo
* hacer el gripper
