from tkinter import *
import pymysql
from tkinter import messagebox
from pypika import Table, AliasedQuery, Query


class App(object):
    def __init__(self, window, user, pswd):

        # db connection
        self.user = user
        self.pswd = pswd

        self.connection = pymysql.connect(
            'localhost', self.user, self.pswd, 'ddsi')
        self.cursor = self.connection.cursor()

        window.wm_title("3.14-zita")

        # to organize window elements
        index = 0

        self.query_button = Button(window, text="Add product")
        self.query_button.configure(command=self.insert_product)
        self.query_button.grid(row=index, column=0, columnspan=5)
        index += 1

    def query(self):
        print()
        print(self.query_msg)
        print()
        self.cursor.execute(self.query_msg)
        self.connection.commit()

    def query_products(self):
        self.query_msg = "SELECT * FROM Producto"
        self.query()
        rows = self.cursor.fetchall()
        print(rows)

    # auxiliar function
    def new_entry(self, window, text, row):
        label = Label(window, text=text)
        label.grid(row=row, column=0, columnspan=1)
        entry = Entry(window)
        entry.grid(row=row, column=1, columnspan=3)
        return entry

    def insert_product(self):
        self.product_window = Tk()
        self.product_window.wm_title("Product Management")

        self.product_name = self.new_entry(self.product_window, "Name: ", 0)
        self.product_stock = self.new_entry(self.product_window, "Stock: ", 1)
        self.product_exp_date = self.new_entry(
            self.product_window, "Exp. Date: ", 2)
        self.product_provider = self.new_entry(
            self.product_window, "Provider: ", 3)
        self.product_limit = self.new_entry(self.product_window, "Limit: ", 4)

        add_button = Button(self.product_window, text="Add")
        add_button.configure(command=self.add_product)
        add_button.grid(row=5, column=0, columnspan=4)

    def add_product(self):
        name = self.product_name.get()
        stock = int(self.product_stock.get())
        expdate = self.product_exp_date.get()
        provider = self.product_provider.get()
        limit = int(self.product_limit.get())
        self.query_msg = 'INSERT INTO Producto VALUES ("{}", {}, "{}", "{}", {})'.format(
            name, stock, expdate, provider, limit)
        self.query()


def main(argv):
    user = argv[1]
    pswd = argv[2]

    window = Tk()
    App(window, user, pswd)
    window.mainloop()


if __name__ == "__main__":
    main(sys.argv)
