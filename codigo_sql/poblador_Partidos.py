import fileinput

# Muestra por la salida estandar la sentencia:
# INSERT INTO n_tabla(lp) VALUES lproc
def sentenciar(n_tabla: str, lp: list, lproc: list):
	print("INSERT INTO ", n_tabla, "(",",".join(lp),") VALUES ( '",("' , '".join(lproc)),"' );")



if __name__ == "__main__":
	nombre_tabla = "Partido" 	# A completar
	lista_param = [ "otroNombre", "nombreOficial"] 	# A completar
	for line in fileinput.input():
		l_proc = line[:len(line)-1].split(",")
		#l_proc es la linea sin ;
		sentenciar(nombre_tabla, lista_param, l_proc)
		
