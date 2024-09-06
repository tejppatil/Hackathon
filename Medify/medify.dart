import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MedifyApp());
}

class MedifyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medify - Keeps Every Record',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
        ),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medify - Keeps Every Record'),
        backgroundColor: Colors.teal, // Customize AppBar color
        elevation: 4, // Add elevation for a shadow effect
        foregroundColor: Colors.black,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.teal[200]!, Colors.teal[400]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Container(
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 4,
                  blurRadius: 10,
                  offset: Offset(0, 3), // Changes position of shadow
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Select a Role',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.teal[700], // Customize text color
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PatientLogin()),
                    );
                  },
                  icon: Icon(Icons.person, size: 18),
                  label: Text('Patient'),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DoctorLoginPage()),
                    );
                  },
                  icon: Icon(Icons.medical_services, size: 18),
                  label: Text('Doctor'),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HospitalAdminLogin()),
                    );
                  },
                  icon: Icon(Icons.local_hospital, size: 18),
                  label: Text('Hospital'),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PatientLogin extends StatelessWidget {
  final TextEditingController patientIdController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Patient Login'),
        backgroundColor: Colors.teal, // Customize AppBar color
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.teal[200]!, Colors.teal[400]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextField(
                style: TextStyle(color: Colors.black),
                controller: patientIdController,
                decoration: InputDecoration(
                  labelText: 'User ID',
                  border: OutlineInputBorder(),
                  fillColor: Colors.white, // Set input box background color

                  filled: true, // Enable background color

                ),
              ),
              SizedBox(height: 16), // Add space between text fields
              TextField(
                style: TextStyle(color: Colors.black),
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(), // Added border for consistency
                  fillColor: Colors.white, // Set input box background color
                  filled: true, // Enable background color
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PatientHomePage()));
                },
                child: Text('Login'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  // Customize button color
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignupPage(userType: '',)));
                },
                child: Text('Don\'t have an account? Sign up'),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white, // Customize text color
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class PatientHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Patient Home Page'),
        backgroundColor: Colors.teal[800], // Darker shade for the AppBar
        elevation: 4, // Add elevation for a shadow effect
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.teal[50]!, Colors.teal[300]!], // Adjusted gradient
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            ListTile(
              leading: Icon(Icons.person, color: Colors.teal[700]), // Customize icon color
              title: Text('My Profile', style: TextStyle(color: Colors.teal[900])), // Customize text color
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PatientProfile()));
                // Navigate to patient details page or perform patient profile logic
              },
            ),
            ListTile(
              leading: Icon(Icons.local_hospital, color: Colors.teal[700]), // Customize icon color
              title: Text('Nearby Hospital', style: TextStyle(color: Colors.teal[900])), // Customize text color
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NearbyHospital()));
                // Navigate to patient details page or perform patient profile logic
              },
            ),
            ListTile(
              leading: Icon(Icons.local_pharmacy, color: Colors.teal[700]), // Customize icon color
              title: Text('Nearby Pharmacy', style: TextStyle(color: Colors.teal[900])), // Customize text color
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NearbyPharmacy()));
                // Navigate to patient details page or perform patient profile logic
              },
            ),
            ListTile(
              leading: Icon(Icons.medical_services, color: Colors.teal[700]), // Customize icon color
              title: Text('Medicine', style: TextStyle(color: Colors.teal[900])), // Customize text color
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NearbyMedicines()));
                // Navigate to patient details page or perform patient profile logic
              },
            ),
          ],
        ),
      ),
    );
  }
}


class PatientProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.teal[50]!, Colors.teal[300]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: <Widget>[
            ProfileItem(title: 'Name', value: 'John Doe'),
            SizedBox(height: 10),
            ProfileItem(title: 'Gender', value: 'Male'),
            SizedBox(height: 10),
            ProfileItem(title: 'Date of Birth', value: '01/01/1980'),
            SizedBox(height: 10),
            ProfileItem(title: 'Phone Number', value: '1234567890'),
            SizedBox(height: 10),
            ProfileItem(title: 'Email', value: 'john@gmail.com'),
            SizedBox(height: 10),
            ProfileItem(title: 'Address', value: '123 Street Name, City'),
            SizedBox(height: 10),
            ProfileItem(title: 'Marital Status', value: 'Married'),
            SizedBox(height: 10),
            ProfileItem(title: 'Is patient younger than 18?', value: 'No'),
            SizedBox(height: 10),
            ProfileItem(title: 'Emergency Contact Name', value: 'Jane Doe'),
            SizedBox(height: 10),
            ProfileItem(title: 'Emergency Contact Number', value: '0987654321'),
            SizedBox(height: 10),
            ProfileItem(title: 'Family Doctor Name', value: 'Dr. Smith'),
            SizedBox(height: 10),
            ProfileItem(title: 'Family Doctor Phone', value: '1234567890'),
            SizedBox(height: 10),
            ProfileItem(title: 'Preferred Pharmacy', value: 'ABC Pharmacy'),
            SizedBox(height: 10),
            ProfileItem(title: 'Preferred Pharmacy Phone', value: '0987654321'),
            SizedBox(height: 10),
            ProfileItem(title: 'Currently Taking Medication', value: 'No'),
            SizedBox(height: 10),
            ProfileItem(title: 'Allergic to Any Medicine', value: 'No'),
          ],
        ),
      ),
    );
  }
}

class NearbyHospital extends StatefulWidget {
  @override
  _NearbyHospitalState createState() => _NearbyHospitalState();
}

class _NearbyHospitalState extends State<NearbyHospital> {
  final List<String> _allHospitals = [
    'Mishika Multispeciality Hospital: 4th Floor, BALMUKUND SQUARE, Nehru Chokdi, Dahegam, Gujarat 382305',
    'Pratham Hospital: Third floor, Balmukund Complex, opp. Amin Society, near Nehru Chokdi, Darshan Society, GIDC, Dahegam, Gujarat 382305',
    'Mamta Multispeciality Hospital: 1st Floor Shiv Shakti Complex Opp Pashu Dawa Khana, below Matru Hospital, Dehgam-Rakhiyal, Road, Dahegam, Gujarat 382305',
    'Apollo Hospital International Limited Ahmedabad: Plot No, 1A, Gandhinagar - Ahmedabad Rd, GIDC Bhat, Estate, Ahmedabad, Gujarat 382428',
    'Sterling Hospitals - Gurukul Ahmedabad: Sterling Hospital Rd, near Maharaja Agrasen Vidhyalaya, nr. Nilmani Society, L.K Society, Nilmani Society, Memnagar, Ahmedabad, Gujarat 380052',
    'KD Hospital: Vaishnodevi Circle, Sarkhej - Gandhinagar Hwy, Ahmedabad, Gujarat 382421',
    'Aashka Multispeciality Hospital: Gandhinagar Bypass Rd, Sargasan, Gandhinagar, Gujarat 382421',
    'SMVS Swaminarayan Hospital: Gandhinagar - Ahmedabad Rd, beside Swaminarayan Dham, Randesan, Gandhinagar, Gujarat 382007',
    'SCAI Superspeciality Hospitals: 001/002 Ground Floor, Corporate Unit, Siddhraj Z2, near SCAI Hospitals Circle, Kudasan, Gandhinagar, Gujarat 382421',
    'Shalby Multi-Specialty Hospitals, Surat: Nr. Navyug College, Rander Rd, Adajan, Surat, Gujarat 395009',
    'Sunshine Global Hospital: Dumas Rd, beside Big Bazar, Piplod, Surat, Gujarat 395007',
    'Bombay Multi Speciality Hospital: 4th Floor Atlanta Mall, Bhimrad-Althan Rd, Apcha Nagar, Bhimrad, Surat, Gujarat 395017',
    'Unity Multispeciality Hospital: Unity Hospital, Rajesh Tower Rd, near Hari Nagar Cross Road, opp. Suner Complex, Gotri, Vadodara, Gujarat 390021',
    'Venus Super Speciality Hospital: Off OP Road Opp. Akota Ward Office No 6, Vadodara, Gujarat 390020',
    'Vraj Hospital Pvt. Ltd.: First Floor, Yaksha Shree Complex, Guru Gobindsinhji Marg, opp. Mahakali Temple, near Kumkum Party Plot, TP 13, Chhani Jakatnaka, Vadodara, Gujarat 390002',
  ];

  List<String> _filteredHospitals = [];

  @override
  void initState() {
    super.initState();
    _filteredHospitals = _allHospitals;
  }

  void _filterHospitals(String query) {
    setState(() {
      _filteredHospitals = _allHospitals
          .where((hospital) => hospital.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nearby Hospitals'),
        backgroundColor: Colors.teal, // Teal background color for the AppBar
      ),
      body: Container(
        color: Colors.teal, // Background color
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: _filterHospitals,
                style: TextStyle(color: Colors.black), // Black text color
                decoration: InputDecoration(
                  labelText: 'Search',
                  labelStyle: TextStyle(color: Colors.black), // Black label color
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white, // White background for the search bar
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _filteredHospitals.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(8.0),
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.white, // White box color
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Text(
                      _filteredHospitals[index],
                      style: TextStyle(color: Colors.black), // Black text color
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class NearbyPharmacy extends StatefulWidget {
  @override
  _NearbyPharmacyState createState() => _NearbyPharmacyState();
}

class _NearbyPharmacyState extends State<NearbyPharmacy> {
  final List<String> _allPharmacies = [
    'PharmEasy Medicine Point: 16 Shreenath Arcade Dehgam, Dahegam, Gujarat 382305',
    'Apollo Pharmacy: Plot no. 1555, GH Rd, near GH 2 Circle, Sector 6, Gandhinagar, Gujarat 382006',
    'Apollo Pharmacy: Shop No 12 & 13, Ground Floor, Kanam 2, near Reliance Chowkdi, Kudasan, Ahmedabad, Gujarat 382421',
    'Apollo Pharmacy: Mann Complex, 6, Anand Mahal Rd, Opposite Shree Ram Petrol Pump, Adajan, Surat, Gujarat 395009',
    'Medkart Pharmacy: Shop No 7, Om Complex, Vasna Rd, near Taksh Complex, Shivashraya Society, Tandalja, Vadodara, Gujarat 390015',
  ];

  List<String> _filteredPharmacies = [];

  @override
  void initState() {
    super.initState();
    _filteredPharmacies = _allPharmacies;
  }

  void _filterPharmacies(String query) {
    setState(() {
      _filteredPharmacies = _allPharmacies
          .where((pharmacy) => pharmacy.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nearby Pharmacies'),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        color: Colors.teal, // Background color
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: _filterPharmacies,
                style: TextStyle(color: Colors.black), // Black text color in the search box
                decoration: InputDecoration(
                  labelText: 'Search',
                  labelStyle: TextStyle(color: Colors.black), // Black label color
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white, // White background for the search box
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _filteredPharmacies.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(8.0),
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.white, // White box color
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Text(
                      _filteredPharmacies[index],
                      style: TextStyle(color: Colors.black), // Black text color
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class ProfileItem extends StatelessWidget {
  final String title;
  final String value;

  ProfileItem({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white, // White background for each card
      elevation: 2, // Slight elevation for the card shadow
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black, // Black color for the title text
              ),
            ),
            Text(
              value,
              style: TextStyle(color: Colors.black), // Black color for the value text
            ),
          ],
        ),
      ),
    );
  }
}

class NearbyMedicines extends StatefulWidget {
  @override
  _NearbyMedicinesState createState() => _NearbyMedicinesState();
}

class _NearbyMedicinesState extends State<NearbyMedicines> {
  final List<String> _allMedicines = [
    'Headache: Paracetamol',
    'Fever: Ibuprofen',
    'Cough: Dextromethorphan',
    'Runny Nose: Cetirizine',
    'Vomiting: Domperidone',
    'Diarrhea: ORS',
    'Acidity: Pantoprazole',
    'Allergic Reaction: Levocetirizine',
    'Pain: Paracetamol',
    'Insomnia: Alprazolam',
    'Constipation: Lactulose',
    'Sore Throat: Chlorhexidine',
    'Cold/Congestion: Leco-m',
    'Asthma: Salbutamol',
    'Skin Allergies: Calamine Lotion',
    'Eye Allergies: Olopatadine',
    'Ear Pain: Ofloxacin',
    'Urinary Tract Infection: Ciprofloxacin',
    'Menstrual Cramps: Mefenamic Acid',
  ];

  List<String> _filteredMedicines = [];

  @override
  void initState() {
    super.initState();
    _filteredMedicines = _allMedicines;
  }

  void _filterMedicines(String query) {
    setState(() {
      _filteredMedicines = _allMedicines
          .where((medicine) => medicine.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medicines List'),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        color: Colors.teal, // Background color
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: _filterMedicines,
                style: TextStyle(color: Colors.black), // Black text color in the search box
                decoration: InputDecoration(
                  labelText: 'Search',
                  labelStyle: TextStyle(color: Colors.black), // Black label color
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white, // White background for the search box
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _filteredMedicines.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(8.0),
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.white, // White box color
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Text(
                      _filteredMedicines[index],
                      style: TextStyle(color: Colors.black), // Black text color
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SignupPage extends StatefulWidget {
  final String userType;
  SignupPage({required this.userType});

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController LastNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emergencyContactController = TextEditingController();
  final TextEditingController medicineController = TextEditingController();
  final TextEditingController allergyController = TextEditingController();

  String? selectedGender;
  DateTime? selectedDateOfBirth;
  bool isTakingMedicine = false;
  bool isMarried = false;
  late String uniqueCode;

  @override
  void initState() {
    super.initState();
    uniqueCode = _generateUniqueCode();
  }

  String _generateUniqueCode() {
    final random = Random();
    final code = List<int>.generate(6, (_) => random.nextInt(10));
    return code.join();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDateOfBirth)
      setState(() {
        selectedDateOfBirth = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.userType} Sign Up'),
        backgroundColor: Colors.teal[700],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            colors: [Colors.teal[100]!, Colors.teal[300]!],
            end: Alignment.bottomRight,
          ),
        ),
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: firstNameController,
                  decoration: InputDecoration(
                    labelText: 'First Name *',
                    labelStyle: TextStyle(color: Colors.teal[800]),
                    filled: true,
                    fillColor: Colors.white, // Set input box background color
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal[800]!),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal[300]!),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'First name is required';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: LastNameController,
                  decoration: InputDecoration(
                    labelText: 'Last Name *',
                    labelStyle: TextStyle(color: Colors.teal[800]),
                    filled: true,
                    fillColor: Colors.white, // Set input box background color
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal[800]!),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal[300]!),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Last name is required';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  value: selectedGender,
                  items: ['Male', 'Female', 'Do Not Prefer to Say']
                      .map((gender) => DropdownMenuItem(
                    value: gender,
                    child: Text(gender),
                  ))
                      .toList(),
                  onChanged: (newValue) {
                    setState(() {
                      selectedGender = newValue!;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Gender *',
                    labelStyle: TextStyle(color: Colors.teal[800]),
                    filled: true,
                    fillColor: Colors.white, // Set input box background color
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null) {
                      return 'Gender is required';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () => _selectDate(context),
                  child: AbsorbPointer(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: selectedDateOfBirth == null
                            ? 'Date of Birth *'
                            : '${selectedDateOfBirth!.toLocal()}'.split(' ')[0],
                        labelStyle: TextStyle(color: Colors.teal[800]),
                        filled: true,
                        fillColor: Colors.white, // Set input box background color
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal[800]!),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal[300]!),
                        ),
                      ),
                      validator: (value) {
                        if (selectedDateOfBirth == null) {
                          return 'Date of Birth is required';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: phoneNumberController,
                  keyboardType: TextInputType.phone,
                  maxLength: 10,
                  decoration: InputDecoration(
                    labelText: 'Phone Number *',
                    labelStyle: TextStyle(color: Colors.teal[800]),
                    filled: true,
                    fillColor: Colors.white, // Set input box background color
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal[800]!),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal[300]!),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty || value.length != 10) {
                      return 'Phone number must be 10 digits';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email * (@gmail.com)',
                    labelStyle: TextStyle(color: Colors.teal[800]),
                    filled: true,
                    fillColor: Colors.white, // Set input box background color
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal[800]!),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal[300]!),
                    ),
                  ),
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return 'Valid email is required';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: addressController,
                  decoration: InputDecoration(
                    labelText: 'Address *',
                    labelStyle: TextStyle(color: Colors.teal[800]),
                    filled: true,
                    fillColor: Colors.white, // Set input box background color
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal[800]!),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal[300]!),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Address is required';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                SwitchListTile(
                  title: Text('Marital Status *'),
                  subtitle: Text(isMarried ? 'Yes' : 'No'),
                  value: isMarried,
                  onChanged: (bool value) {
                    setState(() {
                      isMarried = value;
                    });
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: usernameController,
                  decoration: InputDecoration(
                    labelText: 'Username *',
                    labelStyle: TextStyle(color: Colors.teal[800]),
                    filled: true,
                    fillColor: Colors.white, // Set input box background color
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal[800]!),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal[300]!),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Username is required';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password *',
                    labelStyle: TextStyle(color: Colors.teal[800]),
                    filled: true,
                    fillColor: Colors.white, // Set input box background color
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal[800]!),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal[300]!),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password is required';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: emergencyContactController,
                  keyboardType: TextInputType.phone,
                  maxLength: 10,
                  decoration: InputDecoration(
                    labelText: 'Emergency Contact *',
                    labelStyle: TextStyle(color: Colors.teal[800]),
                    filled: true,
                    fillColor: Colors.white, // Set input box background color
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal[800]!),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal[300]!),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty || value.length != 10) {
                      return 'Emergency contact must be 10 digits';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                SwitchListTile(
                  title: Text('Currently taking any medicine? *'),
                  value: isTakingMedicine,
                  onChanged: (bool value) {
                    setState(() {
                      isTakingMedicine = value;
                    });
                  },
                ),
                if (isTakingMedicine)
                  TextFormField(
                    style: TextStyle(color: Colors.black),
                    controller: medicineController,
                    maxLength: 500,
                    decoration: InputDecoration(
                      labelText: 'Medicine details (max 500 words)',
                      labelStyle: TextStyle(color: Colors.teal[800]),
                      filled: true,
                      fillColor: Colors.white, // Set input box background color
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal[800]!),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal[300]!),
                      ),
                    ),
                    validator: (value) {
                      if (isTakingMedicine && (value == null || value.isEmpty)) {
                        return 'Medicine details are required';
                      }
                      return null;
                    },
                  ),
                SizedBox(height: 10),
                TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: allergyController,
                  decoration: InputDecoration(
                    labelText: 'Any allergy *',
                    labelStyle: TextStyle(color: Colors.teal[800]),
                    filled: true,
                    fillColor: Colors.white, // Set input box background color
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal[800]!),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal[300]!),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please specify if you have any allergies';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Text(
                  'Your unique code: $uniqueCode',
                  style: TextStyle(color: Colors.teal[800]),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // All fields are valid
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Verification Needed'),
                          content: Text(
                              'Please visit a nearby hospital to verify your identity and complete the signup process.'),
                          actions: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                Navigator.of(context).pop(); // Navigate back to the previous screen
                              },
                              child: Text('OK'),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                  child: Text('Sign Up'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.teal[600],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DoctorLoginPage extends StatefulWidget {
  @override
  _DoctorLoginPageState createState() => _DoctorLoginPageState();
}

class _DoctorLoginPageState extends State<DoctorLoginPage> {
  final TextEditingController doctorIdController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctor Login'),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.teal[200]!, Colors.teal[400]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextField(
                style: TextStyle(color: Colors.black),
                controller: doctorIdController,
                decoration: InputDecoration(
                  labelText: 'Doctor ID',
                  filled: true,
                  fillColor: Colors.white, // Set the background color of the input box to white
                ),
              ),
              TextField(
                style: TextStyle(color: Colors.black),
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  filled: true,
                  fillColor: Colors.white, // Set the background color of the input box to white
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DoctorDashboardPage(),
                    ),
                  );
                },
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DoctorDashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctor Dashboard'),
        backgroundColor: Colors.teal, // Set the AppBar color to teal
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.teal[200]!, Colors.teal[400]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text('My Details', style: TextStyle(color: Colors.black)),
              tileColor: Colors.white, // Set background color of the tile to white
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyDetailsPage()),
                );
              },
            ),
            ListTile(
              title: Text('Patient Profile Visit', style: TextStyle(color: Colors.black)), // Set text color to white
              tileColor: Colors.white, // Set background color of the tile to white
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PatientProfileVisitPage()),
                );
              },
            ),
            ListTile(
              title: Text('Share Experience', style: TextStyle(color: Colors.black)), // Set text color to white
              tileColor: Colors.white, // Set background color of the tile to white
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ShareExperiencePage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MyDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Details'),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        // Ensure the Container takes up the full available space
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.teal[200]!, Colors.teal[400]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Name: Dr. John Doe', style: TextStyle(fontSize: 18, color: Colors.black)),
                Text('Username: johndoe', style: TextStyle(fontSize: 18, color: Colors.black)),
                Text('Phone No: +1234567890', style: TextStyle(fontSize: 18, color: Colors.black)),
                Text('Email: johndoe@example.com', style: TextStyle(fontSize: 18, color: Colors.black)),
                Text('Address: 123 Main St', style: TextStyle(fontSize: 18, color: Colors.black)),
                Text('Citizen ID: C123456', style: TextStyle(fontSize: 18, color: Colors.black)),
                Text('NMC ID: NMC123456', style: TextStyle(fontSize: 18, color: Colors.black)),
                Text('Blood Group: O+', style: TextStyle(fontSize: 18, color: Colors.black)),
                Text('Unique ID: U123456', style: TextStyle(fontSize: 18, color: Colors.black)),
                Text('Degree: MD', style: TextStyle(fontSize: 18, color: Colors.black)),
                Text('Specialization: Cardiology', style: TextStyle(fontSize: 18, color: Colors.black)),
                Text('Hospital: General Hospital', style: TextStyle(fontSize: 18, color: Colors.black)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



class PatientProfileVisitPage extends StatefulWidget {
  @override
  _PatientProfileVisitPageState createState() => _PatientProfileVisitPageState();
}

class _PatientProfileVisitPageState extends State<PatientProfileVisitPage> {
  final _citizenIdController = TextEditingController();

  void _retrievePatientInfo() {
    // Normally, you would retrieve patient info from a backend
    final patientName = 'Jane Doe';
    final doctorName = 'Dr. John Doe';
    final doctorAddress = '123 Main St';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmation'),
          content: Text('$doctorName has accessed $patientName at $doctorAddress. Do you wish to continue?',
          style: TextStyle(color: Colors.black)),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Continue'),
              onPressed: () {
                Navigator.of(context).pop();
                // Navigate to medical history page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PatientMedicalHistoryPage(patientName: patientName),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Patient Profile Visit'),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.teal[200]!, Colors.teal[400]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              style: TextStyle(color: Colors.black),
              controller: _citizenIdController,
              decoration: InputDecoration(
                labelText: 'Enter Patient Citizen ID',
                filled: true,
                fillColor: Colors.white, // Set the background color of the input box to white
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _retrievePatientInfo,
              child: Text('Retrieve Patient Info'),
            ),
          ],
        ),
      ),
    );
  }
}

class PatientMedicalHistoryPage extends StatelessWidget {
  final String patientName;

  PatientMedicalHistoryPage({required this.patientName});

  @override
  Widget build(BuildContext context) {
    // Simulated medical history data
    final List<Map<String, String>> medicalHistory = [
      {'Date': '2023-01-15', 'Diagnosis': 'Hypertension', 'Prescription': 'Lisinopril'},
      {'Date': '2022-11-05', 'Diagnosis': 'Diabetes Type 2', 'Prescription': 'Metformin'},
      {'Date': '2022-09-20', 'Diagnosis': 'Flu', 'Prescription': 'Oseltamivir'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('$patientName\'s Medical History'),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            colors: [Colors.teal[100]!, Colors.teal[300]!],
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView.builder(
          itemCount: medicalHistory.length,
          itemBuilder: (context, index) {
            final record = medicalHistory[index];
            return Card(
              margin: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Text('Date: ${record['Date']}'),
                subtitle: Text(
                  'Diagnosis: ${record['Diagnosis']}\nPrescription: ${record['Prescription']}',
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ShareExperiencePage extends StatefulWidget {
  @override
  _ShareExperiencePageState createState() => _ShareExperiencePageState();
}

class _ShareExperiencePageState extends State<ShareExperiencePage> {
  final TextEditingController _experienceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Share Experience'),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            colors: [Colors.teal[100]!, Colors.teal[300]!],
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'If you have encountered any new kind of disease, you can share your experience to inform all doctors connected with us.',
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(height: 20),
            TextField(
              style: TextStyle(color: Colors.black),
              controller: _experienceController,
              decoration: InputDecoration(
                labelText: 'Share your experience',
                filled: true,
                fillColor: Colors.white, // Set the background color of the input box to white
              ),
              maxLines: 5,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle submission logic here
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Experience Shared'),
                      content: Text('Thank you for sharing your experience.'),
                      actions: <Widget>[
                        TextButton(
                          child: Text('OK'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}

class HospitalAdminLogin extends StatelessWidget {
  final TextEditingController userIdController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hospital Admin Login'),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            colors: [Colors.teal[100]!, Colors.teal[300]!],
            end: Alignment.bottomRight,
          ),
        ),
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              style: TextStyle(color: Colors.black),
              controller: userIdController,
              decoration: InputDecoration(
                labelText: 'User ID',
                filled: true,
                fillColor: Colors.white, // Set the background color of the input box to white
              ),
            ),
            SizedBox(height: 16.0), // Added spacing between fields
            TextField(
              style: TextStyle(color: Colors.black),
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                filled: true,
                fillColor: Colors.white, // Set the background color of the input box to white
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HospitalAdminDashboard()),
                );
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}


class CreateDoctorAccount extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController citizenIdController = TextEditingController();
  final TextEditingController nmcIdController = TextEditingController();
  final TextEditingController bloodGroupController = TextEditingController();
  final TextEditingController uniqueIdController = TextEditingController();
  final TextEditingController degreeController = TextEditingController();
  final TextEditingController specializationController = TextEditingController();
  final TextEditingController hospitalController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Doctor Account'),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            colors: [Colors.teal[100]!, Colors.teal[300]!],
            end: Alignment.bottomRight,
          ),
        ),
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextField(style: TextStyle(color: Colors.black),
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(height: 10), // Space between input fields
                TextField(
                  style: TextStyle(color: Colors.black),
                  controller: usernameController,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  style: TextStyle(color: Colors.black),
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 10),
                TextField(
                  style: TextStyle(color: Colors.black),
                  controller: phoneController,
                  decoration: InputDecoration(
                    labelText: 'Phone No.',
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  style: TextStyle(color: Colors.black),
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  style: TextStyle(color: Colors.black),
                  controller: addressController,
                  decoration: InputDecoration(
                    labelText: 'Address',
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  style: TextStyle(color: Colors.black),
                  controller: citizenIdController,
                  decoration: InputDecoration(
                    labelText: 'Citizen ID',
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  style: TextStyle(color: Colors.black),
                  controller: nmcIdController,
                  decoration: InputDecoration(
                    labelText: 'NMC ID',
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  style: TextStyle(color: Colors.black),
                  controller: bloodGroupController,
                  decoration: InputDecoration(
                    labelText: 'Blood Group',
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  style: TextStyle(color: Colors.black),
                  controller: uniqueIdController,
                  decoration: InputDecoration(
                    labelText: 'Unique ID',
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  style: TextStyle(color: Colors.black),
                  controller: degreeController,
                  decoration: InputDecoration(
                    labelText: 'Degree',
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  style: TextStyle(color: Colors.black),
                  controller: specializationController,
                  decoration: InputDecoration(
                    labelText: 'Specialization',
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  style: TextStyle(color: Colors.black),
                  controller: hospitalController,
                  decoration: InputDecoration(
                    labelText: 'Hospital',
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(height: 20), // Space before the button
                ElevatedButton(
                  onPressed: () {
                    // Handle create doctor account logic
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Doctor account created successfully!')),
                    );
                  },
                  child: Text('Create Account'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class HospitalAdminDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hospital Admin Dashboard'),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            colors: [Colors.teal[100]!, Colors.teal[300]!],
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            ListTile(
              title: Text('Hospital Details', style: TextStyle(color: Colors.black)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HospitalDetails()),
                );
              },
            ),
            ListTile(
              title: Text('Create Doctor Account', style: TextStyle(color: Colors.black)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreateDoctorAccount()),
                );
              },
            ),
            ListTile(
              title: Text('Patient Verification', style: TextStyle(color: Colors.black)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PatientVerification()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class HospitalDetails extends StatelessWidget {
  final TextEditingController hospitalNameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController branchController = TextEditingController();
  final TextEditingController staffCountController = TextEditingController();
  final TextEditingController timingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hospital Details'),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            colors: [Colors.teal[100]!, Colors.teal[300]!],
            end: Alignment.bottomRight,
          ),
        ),
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              style: TextStyle(color: Colors.black),
              controller: hospitalNameController,
              decoration: InputDecoration(
                labelText: 'Hospital Name',
                filled: true,
                fillColor: Colors.white, // Set the background color of the input box to white
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              style: TextStyle(color: Colors.black),
              controller: addressController,
              decoration: InputDecoration(
                labelText: 'Address',
                filled: true,
                fillColor: Colors.white, // Set the background color of the input box to white
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              style: TextStyle(color: Colors.black),
              controller: branchController,
              decoration: InputDecoration(
                labelText: 'Branch',
                filled: true,
                fillColor: Colors.white, // Set the background color of the input box to white
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              style: TextStyle(color: Colors.black),
              controller: staffCountController,
              decoration: InputDecoration(
                labelText: 'Number of People Working',
                filled: true,
                fillColor: Colors.white, // Set the background color of the input box to white
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              style: TextStyle(color: Colors.black),
              controller: timingController,
              decoration: InputDecoration(
                labelText: 'Timing',
                filled: true,
                fillColor: Colors.white, // Set the background color of the input box to white
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle save hospital details
              },
              child: Text('Save Details'),
            ),
          ],
        ),
      ),
    );
  }
}


// Patient Verification
class PatientVerification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Patient Verification'),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            colors: [Colors.teal[100]!, Colors.teal[300]!],
            end: Alignment.bottomRight,
          ),
        ),
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  // Add fingerprint logic
                },
                child: Text('Add Fingerprint'),
              ),
              SizedBox(height: 16.0), // Spacing between buttons
              ElevatedButton(
                onPressed: () {
                  // Add Face ID logic
                },
                child: Text('Add Face ID'),
              ),
              SizedBox(height: 16.0), // Spacing between buttons
              ElevatedButton(
                onPressed: () {
                  // Verify Aadhaar card logic
                },
                child: Text('Verify Aadhaar Card'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
