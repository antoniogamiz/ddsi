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

        # to organize window elements
        index = 0

        self.query_button = Button(window, text="Add product")
        self.query_button.configure(command=self.insert_product)
        self.query_button.grid(row=index, column=0, columnspan=5)
        index += 1

        self.query_button = Button(window, text="Add employee")
        self.query_button.configure(command=self.insert_employee)
        self.query_button.grid(row=index, column=0, columnspan=5)
        index += 1

        self.query_button = Button(window, text="Add plate")
        self.query_button.configure(command=self.insert_plate)
        self.query_button.grid(row=index, column=0, columnspan=5)
        index += 1

        self.query_button = Button(window, text="Add reservation")
        self.query_button.configure(command=self.insert_reservation)
        self.query_button.grid(row=index, column=0, columnspan=5)

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

    def query_employees(self):
        self.query_msg = "SELECT * FROM Empleado"
        self.query()
        rows = self.cursor.fetchall()
        print(rows)

    def query_plates(self):
        self.query_msg = "SELECT * FROM Plato"
        self.query()
        rows = self.cursor.fetchall()
        print(rows)

    def query_reservation(self):
        self.query_msg = "SELECT * FROM Reserva"
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

    def insert_employee(self):
        self.employee_window = Tk()
        self.employee_window.wm_title("Employee Management")

        self.employee_name = self.new_entry(self.employee_window, "Name: ", 0)
        self.employee_id = self.new_entry(self.employee_window, "Id: ", 1)
        self.employee_paysheet = self.new_entry(
            self.employee_window, "Paysheet: ", 2)
        self.employee_job = self.new_entry(
            self.employee_window, "Job: ", 3)

        add_button = Button(self.employee_window, text="Add")
        add_button.configure(command=self.add_employee)
        add_button.grid(row=5, column=0, columnspan=4)

    def add_employee(self):
        name = self.employee_name.get()
        id = int(self.employee_id.get())
        paysheet = int(self.employee_paysheet.get())
        job = self.employee_job.get()
        self.query_msg = 'INSERT INTO Empleado VALUES ("{}", "{}", {}, "{}")'.format(
            id, name, paysheet, job)
        self.query()

    def insert_plate(self):
        self.plate_window = Tk()
        self.plate_window.wm_title("Menu Management")

        self.plate_name = self.new_entry(self.plate_window, "Name: ", 0)
        self.plate_price = self.new_entry(self.plate_window, "Price: ", 1)
        self.plate_ingredient = self.new_entry(
            self.plate_window, "Ingrediente principal: ", 2)
        self.plate_ingredient2 = self.new_entry(
            self.plate_window, "Ingrediente secundario: ", 3)
        self.plate_ingredient3 = self.new_entry(
            self.plate_window, "Ingrediente terciario: ", 4)

        add_button = Button(self.plate_window, text="Add")
        add_button.configure(command=self.add_plate)
        add_button.grid(row=7, column=0, columnspan=4)

    def add_plate(self):
        name = self.plate_name.get()
        price = int(self.plate_price.get())
        ingredient = self.plate_ingredient.get()
        ingredient2 = self.plate_ingredient2.get()
        ingredient3 = self.plate_ingredient3.get()
       
        self.query_msg = 'INSERT INTO Plato VALUES ("{}", {})'.format( name, price)
        self.query()
        
        self.query_msg = 'INSERT INTO Ingrediente VALUES ("{}", "{}")'.format(
            ingredient, name)
        self.query()
        self.query_msg = 'INSERT INTO Ingrediente VALUES ("{}", "{}")'.format(
            ingredient2, name)
        self.query()
        self.query_msg = 'INSERT INTO Ingrediente VALUES ("{}", "{}")'.format(
            ingredient3, name)
        self.query()

	

    def insert_reservation(self):
        self.reservation_window = Tk()
        self.reservation_window.wm_title("Client Management")

        self.reservation_name = self.new_entry(
            self.reservation_window, "Name: ", 0)
        self.reservation_DNI = self.new_entry(
            self.reservation_window, "DNI: ", 1)
        self.reservation_date = self.new_entry(
            self.reservation_window, "Date: ", 2)
        self.reservation_time = self.new_entry(
            self.reservation_window, "Time: ", 3)

        add_button = Button(self.reservation_window, text="Add")
        add_button.configure(command=self.add_reservation)
        add_button.grid(row=7, column=0, columnspan=4)

    def add_reservation(self):
        name = self.reservation_name.get()
        dni = self.reservation_DNI.get()
        date = self.reservation_date.get()
        time = self.reservation_time.get()
        idReservation = date.replace("/", "")+dni

        self.query_msg = 'INSERT INTO Reserva VALUES("{}","{}",\'{}\',\'{}\',"{}")'.format(
            idReservation, name, date, time, dni)
        self.query()


def main(argv):
    user = argv[1]
    pswd = argv[2]

    window = Tk()
    App(window, user, pswd)
    window.mainloop()


if __name__ == "__main__":
    main(sys.argv)
