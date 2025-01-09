import 'package:flutter/material.dart';
import 'package:flutter_pete/screens/forgotpassword.dart';
import 'package:flutter_pete/screens/home_screen.dart';
import '../widgets/custom_textfield.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Controller untuk input data
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Fungsi untuk mengirim data ke backend
  void login() async {
  final name = nameController.text;
  final password = passwordController.text;

  // TODO: Lakukan koneksi ke backend PHP untuk verifikasi login

  // Simulasi login berhasil
  if (name.isNotEmpty && password.isNotEmpty) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen(username: name)),
    );
  } else {
    // Tampilkan error jika input kosong
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Nama atau kata sandi tidak boleh kosong')),
    );
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.directions_bus, size: 80, color: Colors.cyan),
            const SizedBox(height: 20),
            const Text(
              'Halo, mitra NaikPete\'',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Yuk, masuk untuk mulai perjalanan',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 20),
            CustomTextField(
              hintText: 'Nama',
              controller: nameController,
            ),
            CustomTextField(
              hintText: 'Kata sandi',
              isPassword: true,
              controller: passwordController,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.cyan,
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              onPressed: login,
              child: const Text('Masuk', style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ForgotPasswordScreen()),
                );
              },
              child: const Text('Lupa kata sandi?', style: TextStyle(color: Colors.cyan)),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                // Pindah ke halaman registrasi
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RegisterScreen()),
                );
              },
              child: const Text(
                'Belum memiliki akun? Daftar',
                style: TextStyle(color: Colors.cyan),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
