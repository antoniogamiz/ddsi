from tkinter import *
import pymysql
from tkinter import messagebox


class App(object):
    def __init__(self, window, user, pswd):

        # db connection
        self.user = user
        self.pswd = pswd

        self.connection = pymysql.connect(
            'localhost', self.user, self.pswd, 'ddsi')
        self.cursor = self.connection.cursor()

        window.wm_title("3.14-zita")


def main(argv):
    user = argv[1]
    pswd = argv[2]

    window = Tk()
    App(window, user, pswd)
    window.mainloop()


if __name__ == "__main__":
    main(sys.argv)
