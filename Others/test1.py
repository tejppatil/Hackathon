import mysql.connector

mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    password="pavan1",
    database="medify"
)

class Patient:
    def __init__(self):
        self.patient_index = 0

    def patient_start(self):
        self.patient_homemenu()

    def patient_homemenu(self):
        while True:
            print("\n-----------")
            print("| Hello!    |")
            print("| 1. Login  |")
            print("| 2. Signup |")
            print("| 3. Exit   |")
            print("-----------")
            print("> ", end="")

            choice = input()

            if choice == "1":
                self.patient_login()
            elif choice == "2":
                self.patient_signup()
            elif choice == "3":
                print("\nExiting!\nExited Successfully!\n")
                exit(1)
            else:
                print("\nInvalid Choice!\n")

    def patient_menu(self):
        while True:
            print("\n----------------------------")
            print("| 1. View your Profile       |")
            print("| 2. View Nearby Hospitals.  |")
            print("| 3. View Nearby Pharmacies. |")
            print("| 4. Medicine Search.        |")
            print("| 5. Exit                    |")
            print("----------------------------")
            print("> ", end="")

            choice = input()

            if choice == "1":
                self.patient_viewyourprofile()
            elif choice == "2":
                self.patient_viewnearbyhospitals()
            elif choice == "3":
                # self.patient_viewnearbypharmacies()
                pass
            elif choice == "4":
                self.patient_medicinesearch()
            elif choice == "5":
                print("\nExiting!\nExited Successfully!\n")
                exit(1)
            else:
                print("\nInvalid Choice!\n")

    def patient_login(self):
        print("\nEnter Username: ", end="")
        patient_username = input()
        print("Enter Password: ", end="")
        patient_password = input()

        a1 = mydb.cursor()
        a1.execute("SELECT USERNAME, PASSWORD FROM patient")
        patients = a1.fetchall()

        for patient in patients:
            if patient_username == patient[0] and patient_password == patient[1]:
                print("\nLogin Successful!\n")
                self.patient_index = patient[0]
                self.patient_menu()
                return

        print("\nInvalid Credentials!\n")
        self.patient_homemenu()

    def patient_signup(self):
        print("\nEnter your Name: ", end="")
        patient_name = input()
        print("Enter your phone number: ", end="")
        
        while True:
            try:
                patient_phone = int(input())
                break
            except ValueError:
                print("Please enter a valid mobile number: ", end="")

        print("Enter your alternate [Emergency] phone number: ", end="")
        patient_emergency_phone = input()

        print("Enter your mail Id: ", end="")
        patient_mail = input()
        print("Address: ", end="")
        patient_address = input()
        print("Enter blood group: ", end="")
        patient_bloodgroup = input()
        print("Enter citizenship ID: ", end="")
        patient_citizenid = input()
        print("Enter a Username: ", end="")
        patient_username = input()
        print("Enter password: ", end="")
        patient_password = input()

        a3 = mydb.cursor()
        query = ("INSERT INTO patient "
                 "(NAME, USERNAME, PASSWORD, PHONE, EMERGENCY_PHONE, EMAIL, ADDRESS, BLOOD_GROUP, CITIZEN_ID) "
                 "VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)")
        values = (patient_name, patient_username, patient_password, patient_phone, patient_emergency_phone, patient_mail, patient_address, patient_bloodgroup, patient_citizenid)
        a3.execute(query, values)
        mydb.commit()

        print("\nSign Up Successful!\nVisit the nearest hospital to complete KYC to access all features of the app!\n")
        self.patient_homemenu()

    def patient_viewyourprofile(self):
        a4 = mydb.cursor()
        a4.execute(f"SELECT * FROM PATIENT WHERE USERNAME = '{self.patient_index}'")
        profile = a4.fetchall()
        
        for data in profile:
            print(data)

    def patient_medicinesearch(self):
        hiarr = [["Fever", "Paracetamol"], ["Cold", "Ceterizine"], ["Stomach ache", "Cyclopam"], ["Headache", "Aspirin"], ["Back pain", "Hydrocodone"], ["Nausea", "Domperidone"]]

        print("\nWhich Symptom do you have:", end="")
        for i in range(6):
            print(f"\n{i + 1}. {hiarr[i][0]}")
        print("\nEnter your choice: ", end="")

        try:
            choice = int(input())
            if choice > 6:
                print("\nInvalid Choice!\n")
                self.patient_menu()
                return
            print("\nYou can take the following tablet for temporary relief. Consult a Doctor if symptoms persist.\n")
            print(hiarr[choice - 1][1], "\n")
        except ValueError:
            print("\nInvalid Choice!\n")
            self.patient_menu()
            return

    def patient_viewnearbyhospitals(self):
        print("\nWhere do you live?")
        while True:
            print("\n----------------")
            print("| 1. Dahegam     |")
            print("| 2. Gandhinagar |")
            print("| 3. Ahmedabad   |")
            print("| 4. Surat       |")
            print("| 5. Vadodara    |")
            print("| 6. Exit        |")
            print("----------------")
            print("> ", end="")

            try:
                choice = int(input())
                if choice == 1:
                    print("\nLife Care Hospital: \"16 Shreenath Arcade Dehgam, Dahegam, Gujarat 382305\"\n")
                    return
                elif choice == 2:
                    print("\nApollo Hospital: \"Plot no. 1555, GH Rd, near GH 2 Circle, Sector 6, Gandhinagar, Gujarat 382006\"\n")
                    return
                elif choice == 3:
                    print("\nSterling Hospital: \"Shop No 12 & 13, Ground Floor, Kanam 2, near Reliance Chowkdi, Kudasan, Ahmedabad, Gujarat 382421\"\n")
                    return
                elif choice == 4:
                    print("\nSurat General Hospital: \"Mann Complex, 6, Anand Mahal Rd, Opposite Shree Ram Petrol Pump, Adajan, Surat, Gujarat 395009\"\n")
                    return
                elif choice == 5:
                    print("\nSunshine Global Hospital: \"Shop No 7, Om Complex, Vasna Rd, near Taksh Complex, Shivashraya Society, Tandalja, Vadodara, Gujarat 390015\"\n")
                    return
                elif choice == 6:
                    self.patient_menu()
                else:
                    print("\nInvalid choice or few places are still left to update. Sorry for the inconvenience!\n")
                    return
            except ValueError:
                print("\nInvalid choice!\n")

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
            p1.patient_start()
        # elif choice == "2":
        #     d1 = Doctor()
        #     d1.doctor_homemenu()
        # elif choice == "3":
        #     a1 = Admin()
        #     a1.admin_homemenu()
        elif choice == "4":
            print("\nExiting!\nExited Successfully!\n")
            break
        else:
            print("\nInvalid Choice!")

if __name__ == "_main_":
    main()