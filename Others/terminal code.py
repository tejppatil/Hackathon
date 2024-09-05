import random
import mysql.connector
mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    password="pavan1",
    database="medify"
)

class Patient:
    def start(self):
        self.home_menu()

    def home_menu(self):
        while True:
            print("\n ----------- ")
            print("| Hello!    |")
            print("| 1. Login  |")
            print("| 2. Signup |")
            print("| 3. Exit   |")
            print(" ----------- ")
            choice = input("> ")

            if choice == "1":
                self.login()
            elif choice == "2":
                self.signup()
            elif choice == "3":
                print("\nExiting!\nExited Successfully!\n")
                break
            else:
                print("\nInvalid Choice!")

    def menu(self):
        while True:
            print("\n ---------------------------- ")
            print("| 1. View your Profile       |")
            print("| 2. View Nearby Hospitals.  |")
            print("| 3. View Nearby Pharmacies. |")
            print("| 4. Medicine Search.        |")
            print("| 5. Exit                    |")
            print(" ---------------------------- ")
            choice = input("> ")

            if choice == "1":
                self.view_profile()
            elif choice == "2":
                self.view_nearby_hospitals()
            elif choice == "3":
                self.view_nearby_pharmacies()
            elif choice == "4":
                self.medicine_search()
            elif choice == "5":
                print("\nExiting!\nExited Successfully!\n")
                break
            else:
                print("\nInvalid Choice!")

    def login(self):
        username = input("\nEnter Username: ")
        password = input("Enter Password: ")

        a1 = mydb.cursor()
        a1.execute("SELECT USERNAME, PASSWORD FROM patient")
        patients = a1.fetchall()
        
        for patient in patients:
            if username == patient[0] and password == patient[1]:
                print("\nLogin Successful!\n")
                self.patient_index = patient[0]
                print("\nLogin Successful!")
                self.patient_index = patient[0]
                self.menu()
                return
        
        print("\nInvalid Credentials!")
        self.home_menu()

    def signup(self):
        name = input("\nEnter your Name: ")
        phone1 = int(input("Enter your phone number: "))
        mail = input("Enter your mail Id: ")
        address = input("Address: ")
        bloodgroup = input("Enter blood group: ")
        citizenid = input("Enter citizenship ID: ")
        username = input("Enter a Username: ")
        password = input("Enter password: ")

        a3 = mydb.cursor()
        query = ("INSERT INTO patient "
                 "(PATIENT_NAME, USERNAME, PASSWORD, PHONE_NO, UNIQUE_ID, MAIL, ADDRESS, BLOOD_GROUP, CITIZEN_ID) "
                 "VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)")
        values = (name, username, password, phone1, random.randint(0, 100), mail, address, bloodgroup, citizenid)
        a3.execute(query, values)
        mydb.commit()

        print("\nSign Up Successful!\nVisit nearest hospital to complete KYC to access all features of the app!")
        self.patient_index = username 

        self.home_menu()

    def view_profile(self):
        a4 = mydb.cursor()
        a4.execute(f"SELECT * FROM PATIENT WHERE USERNAME = '{self.patient_index}'")
        profile = a4.fetchall()
        
        for data in profile:
            print(data)

    def medicine_search(self):
        
        a2 = mydb.cursor()
        a2.execute("SELECT SYMPTOM FROM MEDICINE")
        symptom = a2.fetchall()
        
        print("\nWhich Symptom do you have:")
        for x in symptom:
            print(x)

        choice = input("Enter your Symptom: ")
        a3 = mydb.cursor()
        a3.execute("SELECT MEDICINE FROM MEDICINE WHERE SYMPTOM = 'choice'")
        medicine = a3.fetchall()
        if choice in symptom:
            print(f"\nYou can take the following tablet for temporary relief. Consult a Doctor if symptoms persist.")
            print(medicine)
        else:
            print("\nInvalid Choice!")
        self.menu()

    def view_nearby_hospitals(self):
        print("\nWhere do you live?")
        options = [
            ("Dahegam", "Life Care Hospital: \"16 Shreenath Arcade Dehgam, Dahegam, Gujarat 382305\""),
            ("Gandhinagar", "Apollo Hospital: \"Plot no. 1555, GH Rd, near GH 2 Circle, Sector 6, Gandhinagar, Gujarat 382006\""),
            ("Ahmedabad", "Sterling Hospital: \"Shop No 12 & 13, Ground Floor, Kanam 2, near Reliance Chowkdi, Kudasan, Ahmedabad, Gujarat 382421\""),
            ("Surat", "Surat General Hospital: \"Mann Complex, 6, Anand Mahal Rd, Opposite Shree Ram Petrol Pump, Adajan, Surat, Gujarat 395009\""),
            ("Vadodara", "Sunshine Global Hospital: \"Shop No 7, Om Complex, Vasna Rd, near Taksh Complex, Shivashraya Society, Tandalja, Vadodara, Gujarat 390015\"")
        ]
        
        for i, (place, _) in enumerate(options):
            print(f"{i + 1}. {place}")
        
        choice = int(input("> ")) - 1
        if 0 <= choice < len(options):
            print(f"\n{options[choice][1]}")
        else:
            print("\nInvalid choice or few places are still left to update. Sorry for the inconvenience!")
        self.menu()

    def view_nearby_pharmacies(self):
        print("\nWhere do you live?")
        options = [
            ("Dahegam", "PharmEasy Medicine Point: \"16 Shreenath Arcade Dehgam, Dahegam, Gujarat 382305\""),
            ("Gandhinagar", "Apollo Pharmacy: \"Plot no. 1555, GH Rd, near GH 2 Circle, Sector 6, Gandhinagar, Gujarat 382006\""),
            ("Ahmedabad", "Apollo Pharmacy: \"Shop No 12 & 13, Ground Floor, Kanam 2, near Reliance Chowkdi, Kudasan, Ahmedabad, Gujarat 382421\""),
            ("Surat", "Apollo Pharmacy: \"Mann Complex, 6, Anand Mahal Rd, Opposite Shree Ram Petrol Pump, Adajan, Surat, Gujarat 395009\""),
            ("Vadodara", "Medkart Pharmacy: \"Shop No 7, Om Complex, Vasna Rd, near Taksh Complex, Shivashraya Society, Tandalja, Vadodara, Gujarat 390015\"")
        ]

        for i, (place, _) in enumerate(options):
            print(f"{i + 1}. {place}")

        choice = int(input("> ")) - 1
        if 0 <= choice < len(options):
            print(f"\n{options[choice][1]}")
        else:
            print("\nInvalid choice or few places are still left to update. Sorry for the inconvenience!")
        self.menu()

class Doctor(Patient):
    def __init__(self):
        self.doctor_name = ""
        self.doctor_username = ""
        self.doctor_password = ""
        self.doctor_phone1 = 0
        self.doctor_phone2 = 0  # phone2 or emergency home contact number
        self.doctor_mail = ""
        self.doctor_address = ""
        self.doctor_citizenid = ""
        self.doctor_nmcid = ""
        self.doctor_bloodgroup = ""
        self.doctor_uniquecode = 0

        self.doctor_names = ["Prasann Barot", "Rabel Guharoy"]
        self.doctor_usernames = ["prasann", "rabel"]
        self.doctor_passwords = ["prasann1", "rabel1"]
        self.doctor_phone1s = [9924492472, 7980262223]
        self.doctor_phone2s = [0, 0]  # 0 represents phone number not provided
        self.doctor_mails = ["prasann.barot@rru.ac.in", "rabel.guharoy@rru.ac.in"]
        self.doctor_addresses = [
            "Rashtriya Raksha University, Lavad, Gandhinagar, Gujarat. - 382305",
            "Rashtriya Raksha University, Lavad, Gandhinagar, Gujarat. - 382305"
        ]
        self.doctor_bloodgroups = ["B+", "O+"]
        self.doctor_citizenids = ["678677863561", "897765453442"]
        self.doctor_nmcids = ["2343er", "4534ty"]
        self.doctor_uniquecodes = [33069, 33088]

        self.doctor_index = 0

    def doctor_start(self):
        self.doctor_homemenu()

    def doctor_homemenu(self):
        while True:
            print("\n ----------- ")
            print("| Hello!    |")
            print("| 1. Login  |")
            print("| 2. Signup |")
            print("| 3. Exit   |")
            print(" -----------")
            choice = input("> ")

            if choice == "1":
                self.doctor_login()
            elif choice == "2":
                self.doctor_signup()
            elif choice == "3":
                print("\nExiting!\nExited Successfully!\n")
                break
            else:
                print("\nInvalid Choice!")

    def doctor_menu(self):
        while True:
            print("\n ----------------------------------- ")
            print("| 1. View your Profile              |")
            print("| 2. View your Patient's Profiles.  |")
            print("| 3. Exit                           |")
            print(" ----------------------------------- ")
            choice = input("> ")

            if choice == "1":
                self.doctor_viewprofile()
            elif choice == "2":
                self.doctor_viewpatientsprofile()
            elif choice == "3":
                print("\nExiting!\nExited Successfully!\n")
                break
            else:
                print("\nInvalid Choice!")

    def doctor_login(self):
        self.doctor_username = input("\nEnter Username: ")
        self.doctor_password = input("Enter Password: ")
        flag = False

        for i in range(len(self.doctor_usernames)):
            if self.doctor_username == self.doctor_usernames[i] and self.doctor_password == self.doctor_passwords[i]:
                print("\nLogin Successful!")
                self.doctor_index = i
                flag = True
                self.doctor_menu()
                break

        if not flag:
            print("\nInvalid Credentials!")
            self.doctor_homemenu()

    def doctor_signup(self):
        self.doctor_name = input("\nEnter your Name: ")
        while True:
            try:
                self.doctor_phone1 = int(input("Enter your phone number: "))
                break
            except ValueError:
                print("Please enter a valid mobile number.")

        while True:
            try:
                self.doctor_phone2 = int(input("Enter your alternate [Emergency] phone number: "))
                break
            except ValueError:
                print("Please enter a valid mobile number.")

        self.doctor_mail = input("Enter your mail Id: ")
        self.doctor_address = input("Address: ")
        self.doctor_bloodgroup = input("Enter blood group: ")
        self.doctor_citizenid = input("Enter citizenship ID: ")
        self.doctor_nmcid = input("Enter NMC ID: ")
        self.doctor_username = input("Enter a Username: ")
        self.doctor_password = input("Enter password: ")

        self.doctor_names.append(self.doctor_name)
        self.doctor_phone1s.append(self.doctor_phone1)
        self.doctor_phone2s.append(self.doctor_phone2)
        self.doctor_mails.append(self.doctor_mail)
        self.doctor_addresses.append(self.doctor_address)
        self.doctor_bloodgroups.append(self.doctor_bloodgroup)
        self.doctor_citizenids.append(self.doctor_citizenid)
        self.doctor_nmcids.append(self.doctor_nmcid)
        self.doctor_usernames.append(self.doctor_username)
        self.doctor_passwords.append(self.doctor_password)
        self.doctor_uniquecodes.append(random.randint(1, 100))

        print("\nSign Up Successful!\nVisit your hospital to complete KYC to access all features of the app!")
        self.doctor_index = len(self.doctor_usernames) - 1

        self.doctor_homemenu()

    def doctor_viewprofile(self):
        print(f"\nName: {self.doctor_names[self.doctor_index]}")
        print(f"Phone Number: {self.doctor_phone1s[self.doctor_index]}")
        print(f"Alternate Phone Number: {self.doctor_phone2s[self.doctor_index]}")
        print(f"Mail: {self.doctor_mails[self.doctor_index]}")
        print(f"Address: {self.doctor_addresses[self.doctor_index]}")
        print(f"Blood Group: {self.doctor_bloodgroups[self.doctor_index]}")
        print(f"Citizen ID: {self.doctor_citizenids[self.doctor_index]}")
        print(f"NMC ID: {self.doctor_nmcids[self.doctor_index]}")
        print(f"Username: {self.doctor_usernames[self.doctor_index]}\n")

    def doctor_viewpatientsprofile(self):
        while True:
            print("\nSelect a patient: ")
            for i in range(len(self.patient_names)):
                print(f"{i + 1}. {self.patient_names[i]}")
            print(f"{len(self.patient_names) + 1}. Exit")
            choice = int(input("> "))

            if choice == len(self.patient_names) + 1:
                self.doctor_menu()
            else:
                unique_code = int(input("\nEnter Patient's Unique Code to view profile: "))
                if unique_code == self.patient_uniquecodes[choice - 1]:
                    print(f"\nName: {self.patient_names[choice - 1]}")
                    print(f"Phone Number: {self.patient_phone1s[choice - 1]}")
                    print(f"Alternate Phone Number: {self.patient_phone2s[choice - 1]}")
                    print(f"Mail: {self.patient_mails[choice - 1]}")
                    print(f"Address: {self.patient_addresses[choice - 1]}")
                    print(f"Blood Group: {self.patient_bloodgroups[choice - 1]}")
                    print(f"Citizen ID: {self.patient_citizenids[choice - 1]}")
                    print(f"Past Medical History: {self.patient_pastmedicalhistories[choice - 1]}\n")
                else:
                    print("\nYou cannot view this profile.")

class Admin(Doctor):
    def __init__(self):
        self.admin_hospitalname = ""
        self.admin_username = ""
        self.admin_password = ""
        self.admin_phone1 = 0
        self.admin_phone2 = 0  # Emergency home contact number
        self.admin_mail = ""
        self.admin_address = ""
        self.admin_hospitalid = ""
        self.admin_uniquecode = 0

        self.admin_names = ["Apollo"]
        self.admin_usernames = ["apollo"]
        self.admin_passwords = ["apollo1"]
        self.admin_phone1s = [9924492472]
        self.admin_phone2s = [0]  # 0 represents phone number not provided.
        self.admin_mails = ["apollo.lavad@gmail.com"]
        self.admin_addresses = ["Near Rashtriya Raksha University, Lavad, Gandhinagar, Gujarat. - 382305"]
        self.admin_hospitalids = ["2343er", "4534ty"]
        self.admin_uniquecodes = [33069, 33088]

        self.admin_index = -1

    def admin_start(self):
        self.admin_homemenu()

    def admin_homemenu(self):
        while True:
            print("\n ----------- ")
            print("| Hello!    |")
            print("| 1. Login  |")
            print("| 2. Signup |")
            print("| 3. Exit   |")
            print(" -----------")
            a = input("> ")

            if a == "1":
                self.admin_login()
            elif a == "2":
                self.admin_signup()
            elif a == "3":
                print("\nExiting!\nExited Successfully!\n")
                break
            else:
                print("\nInvalid Choice!")

    def admin_menu(self):
        while True:
            print("\n ----------------------------------- ")
            print("| 1. View your Profile              |")
            print("| 2. View your Patient's Profiles.  |")
            print("| 3. View your Doctor's Profiles.   |")
            print("| 4. View stock.                    |")
            print("| 5. Exit                           |")
            print(" ----------------------------------- ")
            a = input("> ")

            if a == "1":
                self.admin_viewprofile()
            elif a == "2":
                self.admin_viewpatientsprofile()
            elif a == "3":
                self.admin_viewdoctorsprofile()
            elif a == "4":
                self.admin_viewstock()
            elif a == "5":
                print("\nExiting!\nExited Successfully!\n")
                break
            else:
                print("\nInvalid Choice!")

    def admin_login(self):
        self.admin_username = input("\nEnter Username: ")
        self.admin_password = input("Enter Password: ")
        flag = False

        for i in range(len(self.admin_usernames)):
            if self.admin_username == self.admin_usernames[i] and self.admin_password == self.admin_passwords[i]:
                print("\nLogin Successful!")
                self.admin_index = i
                flag = True
                self.admin_menu()

        if not flag:
            print("\nInvalid Credentials!")
            self.admin_homemenu()

    def admin_signup(self):
        self.admin_hospitalname = input("\nEnter your Hospital Name: ")
        self.admin_phone1 = self.get_valid_input("Enter your phone number: ")
        self.admin_phone2 = self.get_valid_input("Enter your alternate [Emergency] phone number: ")
        self.admin_mail = input("Enter your mail Id: ")
        self.admin_address = input("Address: ")
        self.admin_hospitalid = input("Enter Hospital ID: ")
        self.admin_username = input("Enter a Username: ")
        self.admin_password = input("Enter password: ")

        print("\nSign Up Successful!\nWe will contact you soon to verify your hospital!")
        self.admin_index = len(self.admin_usernames)

        self.admin_homemenu()

    def get_valid_input(self, prompt):
        while True:
            try:
                value = int(input(prompt))
                return value
            except ValueError:
                print("Please enter a valid mobile number.")

    def admin_viewprofile(self):
        print("\nName:", self.admin_names[self.admin_index])
        print("Phone Number:", self.admin_phone1s[self.admin_index])
        print("Alternate Phone Number:", self.admin_phone2s[self.admin_index])
        print("Mail:", self.admin_mails[self.admin_index])
        print("Address:", self.admin_addresses[self.admin_index])
        print("NMC ID:", self.admin_hospitalids[self.admin_index])
        print("Username:", self.admin_usernames[self.admin_index])

    def admin_viewpatientsprofile(self):
        while True:
            print("\nSelect a patient:")
            for i, name in enumerate(self.patient_names):
                print(f"{i + 1}. {name}")
            print(f"{len(self.patient_names) + 1}. Exit")
            choice = int(input("> "))

            if choice == len(self.patient_names) + 1:
                self.admin_menu()
            elif 1 <= choice <= len(self.patient_names):
                index = choice - 1
                print(f"\nName: {self.patient_names[index]}")
                print(f"Phone Number: {self.patient_phone1s[index]}")
                print(f"Alternate Phone Number: {self.patient_phone2s[index]}")
                print(f"Mail: {self.patient_mails[index]}")
                print(f"Address: {self.patient_addresses[index]}")
                print(f"Blood Group: {self.patient_bloodgroups[index]}")
                print(f"Citizen ID: {self.patient_citizenids[index]}")
                print(f"Unique Code: {self.patient_uniquecodes[index]}")
            else:
                self.admin_menu()

    def admin_viewdoctorsprofile(self):
        while True:
            print("\nSelect a doctor:")
            for i, name in enumerate(self.doctor_names):
                print(f"{i + 1}. {name}")
            print(f"{len(self.doctor_names) + 1}. Exit")
            choice = int(input("> "))

            if choice == len(self.doctor_names) + 1:
                self.admin_menu()
            elif 1 <= choice <= len(self.doctor_names):
                index = choice - 1
                print(f"\nName: {self.doctor_names[index]}")
                print(f"Phone Number: {self.doctor_phone1s[index]}")
                print(f"Alternate Phone Number: {self.doctor_phone2s[index]}")
                print(f"Mail: {self.doctor_mails[index]}")
                print(f"Address: {self.doctor_addresses[index]}")
                print(f"Blood Group: {self.doctor_bloodgroups[index]}")
                print(f"Citizen ID: {self.doctor_citizenids[index]}")
                print(f"NMC ID: {self.doctor_nmcids[index]}")
            else:
                self.admin_menu()

    def admin_viewstock(self):
        stock_items = [
            "Blood", "Bandages", "Gauze", "Saline Solution",
            "Pain Medication", "Sutures", "IV Catheters",
            "Antiseptics", "Syringes", "Cotton Swabs"
        ]
        print("\nHospital Stock Items:")
        for item in stock_items:
            print(f"- {item}")

def main():
    while True:
        print("\n ---------------- ")
        print("|  Who are you?  |")
        print("|  1. Patient    |")
        print("|  2. Doctor     |")
        print("|  3. Admin      |")
        print("|  4. Exit       |")
        print(" ---------------- ")
        choice = input("> ")

        if choice == "1":
            p1 = Patient()
            p1.home_menu()
        elif choice == "2":
            d1 = Doctor()
            d1.doctor_homemenu()
        elif choice == "3":
            a1 = Admin()
            a1.admin_homemenu()
        elif choice == "4":
            print("\nExiting!\nExited Successfully!\n")
            break
        else:
            print("\nInvalid Choice!")

if __name__ == "__main__":
    main()
