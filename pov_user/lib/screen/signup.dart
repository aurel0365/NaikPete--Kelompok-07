import 'package:flutter/material.dart';
import 'login.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String? selectedRole;

  bool validateForm() {
    if (firstNameController.text.isEmpty) {
      showError("Nama depan wajib diisi");
      return false;
    }
    if (lastNameController.text.isEmpty) {
      showError("Nama belakang wajib diisi");
      return false;
    }
    if (emailController.text.isEmpty || !emailController.text.contains('@')) {
      showError("Masukkan email yang valid");
      return false;
    }
    if (phoneController.text.isEmpty || !isNumeric(phoneController.text)) {
      showError("Nomor telepon hanya boleh berisi angka");
      return false;
    }
    if (cityController.text.isEmpty) {
      showError("Kota wajib diisi");
      return false;
    }
    if (passwordController.text.isEmpty || passwordController.text.length < 6) {
      showError("Password harus minimal 6 karakter");
      return false;
    }
    if (selectedRole == null) {
      showError("Silakan pilih peran Anda");
      return false;
    }
    return true;
  }

  bool isNumeric(String value) {
    return RegExp(r'^[0-9]+$').hasMatch(value);
  }

  void showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  void register() {
    if (!validateForm()) {
      return;
    }

    print("Registrasi data dikirim ke backend");
    print("Nama depan: ${firstNameController.text}");
    print("Nama belakang: ${lastNameController.text}");
    print("Email: ${emailController.text}");
    print("Nomor telepon: ${phoneController.text}");
    print("Kota: ${cityController.text}");
    print("Password: ${passwordController.text}");
    print("Peran: $selectedRole");

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>  LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan[700],
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Daftar',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              'Isi Data',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.cyan,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Daftar menjadi mitra NaikPete',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 20),

            _buildTextField(firstNameController, 'Nama depan', Icons.person),
            _buildTextField(lastNameController, 'Nama belakang', Icons.person_outline),
            _buildTextField(emailController, 'Email', Icons.email, keyboardType: TextInputType.emailAddress),
            _buildTextField(passwordController, 'Password', Icons.lock, obscureText: true),
            _buildTextField(phoneController, 'Nomor telepon', Icons.phone, keyboardType: TextInputType.number),
            _buildTextField(cityController, 'Kota', Icons.location_city),

            const SizedBox(height: 20),

            // Pilih Peran (Radio Button)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildRadioButton('User', 'User'),
                _buildRadioButton('Driver', 'Driver'),
              ],
            ),

            const SizedBox(height: 20),

            // Tombol Selanjutnya
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.cyan[600],
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onPressed: register,
              child: const Text('Selanjutnya', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  // Fungsi untuk membuat text field dengan styling konsisten
  Widget _buildTextField(TextEditingController controller, String hintText, IconData icon, {TextInputType keyboardType = TextInputType.text, bool obscureText = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: Icon(icon, color: Colors.cyan),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.cyan, width: 2.0),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
        ),
      ),
    );
  }

  // Fungsi untuk membuat radio button dengan styling konsisten
  Widget _buildRadioButton(String title, String value) {
    return Expanded(
      child: RadioListTile<String>(
        title: Text(title),
        value: value,
        groupValue: selectedRole,
        onChanged: (value) {
          setState(() {
            selectedRole = value;
          });
        },
        activeColor: Colors.cyan,
        contentPadding: const EdgeInsets.all(0),
      ),
    );
  }
}
