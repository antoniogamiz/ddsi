from tkinter import *
import pymysql as mdb
from tkinter import messagebox
import re
import os

# Definimos una clase para la interfaz


class Aplicacion(object):
    def __init__(self, ventana, user, pswd):

        # Datos para conectarse a la base de datos
        self.user = user
        self.pswd = pswd

        self.peticion_realizada = False

        conexion = mdb.connect('localhost', self.user, self.pswd, 'ddsi')
        self.cursor = conexion.cursor()

        # Ponemos el título a la ventana
        ventana.wm_title("3.14-zita")


def main(argv):
    user = argv[1]
    pswd = argv[2]

    ventana = Tk()
    Aplicacion(ventana, user, pswd)
    ventana.mainloop()


if __name__ == "__main__":
    main(sys.argv)
