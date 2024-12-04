import 'package:flutter/material.dart';
import 'package:latihan_ukl_2024/homepage.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text(
              'Register',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Nama',
             
              ),
            ),
       
            const SizedBox(height: 10),
         TextField(
           keyboardType: TextInputType.phone,
           decoration: const InputDecoration(
             labelText: 'Nomor Telepon',
             prefixText: '+62 ',
        
           ),
         ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 15, 1, 105),
                minimumSize: const Size(double.infinity, 50),
              ),
              onPressed: () {
                // Handle register button press
              },
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        },
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: const Text(
            'Daftar Tix ID',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
            ),
          ],
        ),
      ), 
    );

      
  }
}