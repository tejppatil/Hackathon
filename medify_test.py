import random
import string

class Patient:
    """
    Represents a patient in the healthcare system.
    """

    def __init__(self, name, phone1, phone2=None, email="", address="", blood_group="", citizen_id=""):
        self.name = name
        self.phone1 = phone1
        self.phone2 = phone2
        self.email = email
        self.address = address
        self.blood_group = blood_group
        self.citizen_id = citizen_id
        self.unique_code = random.randint(1000, 9999)  # Generate unique code (4 digits)
        self.past_medical_history = ""  # Placeholder for future implementation

    def view_profile(self):
        """
        Displays the patient's profile information.
        """
        print(f"Name: {self.name}")
        print(f"Phone Number: {self.phone1}")
        if self.phone2:
            print(f"Alternate Phone Number: {self.phone2}")
        print(f"Email: {self.email}")
        print(f"Address: {self.address}")
        print(f"Blood Group: {self.blood_group}")
        print(f"Citizen ID: {self.citizen_id}")
        print(f"Unique Code: {self.unique_code}")
        print(f"Username: {self.username}")  # Assuming username is set elsewhere

    def search_medicines(self, symptoms):
        """
        Provides basic suggestions for over-the-counter medications based on symptoms.
        (Disclaimer: Consult a doctor for proper diagnosis and treatment.)
        """
        medicine_map = {
            "Fever": "Paracetamol",
            "Cold": "Cetirizine",
            "Stomach Ache": "Cyclopam",
            "Headache": "Aspirin",
            "Back Pain": "Hydrocodone",
            "Nausea": "Domperidone"
        }

        if symptoms in medicine_map:
            print(f"You can take {medicine_map[symptoms]} for temporary relief.")
            print("Consult a doctor if symptoms persist.")
        else:
            print("Medicine not found for the given symptom. Please consult a doctor.")

    def view_nearby_hospitals(self, location):
        """
        Provides a list of hospitals in the specified location.
        (Placeholder for future integration with real-time hospital data.)
        """
        hospital_locations = {
            "Dahegam": "Life Care Hospital: 16 Shreenath Arcade Dehgam, Dahegam, Gujarat 382305",
            "Gandhinagar": "Apollo Hospital: Plot no. 1555, GH Rd, near GH 2 Circle, Sector 6, Gandhinagar, Gujarat 382006",
            "Ahmedabad": "Sterling Hospital: Shop No 12 & 13, Ground Floor, Kanam 2, near Reliance Chowkdi, Kudasan, Ahmedabad, Gujarat 382421",
            "Surat": "Surat General Hospital: Mann Complex, 6, Anand Mahal Rd, Opposite Shree Ram Petrol Pump, Adajan, Surat, Gujarat 395009",
            "Vadodara": "Sunshine Global Hospital: Shop No 7, Om Complex, Vasna Rd, near Taksh Complex, Shivashraya Society, Tandalja, Vadodara, Gujarat 390015"
        }

        if location in hospital_locations:
            print(hospital_locations[location])
        else:
            print("Hospital information not available for the chosen location.")

    def view_nearby_pharmacies(self, location):
        """
        Provides a list of pharmacies in the specified location.
        (Placeholder for future integration with real-time pharmacy data.)
        """
        pharmacy_locations = {
            "Dahegam": "PharmEasy Medicine Point: 16 Shreenath Arcade Dehgam, Dahegam, Gujarat 382305",
            "Gandhinagar": "Apollo Pharmacy: Plot no. 1555, GH Rd, near GH 2 Circle, Sector 6, Gandhinagar, Gujarat 382006",
            "Ahmedabad": "Apollo Pharmacy: Shop No 12 & 13, Ground Floor, Kanam 2, near Reliance Chowkdi, Kudasan, Ahmedabad, Gujarat 382421",
            "Surat": "Apollo Pharmacy: Mann Complex, 6, Anand Mahal Rd, Opposite Shree Ram Petrol Pump, Adajan, Surat, Gujarat 395009",
            "Vadodara": "Medkart Pharmacy: Shop No 7, Om Complex, Vasna Rd, near Taksh Complex, Shivashraya Society, Tandalja, Vadodara, Gujarat 390015"
        }

        if location in pharmacy_locations:
            print(pharmacy_locations[location])
        else:
            print("Pharmacy information not available for the chosen location.")

    def login(self, username, password):
        """
        Authenticates the patient's login credentials.
        (Placeholder for future integration with a proper authentication mechanism.)
        """
        # Implement authentication logic here
        if username == self.username and password == self.password:
            print("Login successful!")
            # Redirect to patient's menu
        else:
            print("Invalid credentials.")

    def signup(self, username, password):
        """
        Creates a new patient account.
        (Placeholder for future integration with a proper registration mechanism.)
        """
        # Implement registration logic here
        self.username = username
        self.password = password
        print("Sign up successful!")
        # Redirect to patient's menu

# Example usage:
patient1 = Patient("Tejas Prakash Patil", 7720841778, 9825818717, "tppatil397@gmail.com", "Home World Hostel, Bhaijipura, Gandhinagar, Gujarat. - 382421", "B+", "230031101611052")

patient1.view_profile()
patient1.search_medicines("Fever")
patient1.view_nearby_hospitals("Gandhinagar")
patient1.view_nearby_pharmacies("Ahmedabad")
