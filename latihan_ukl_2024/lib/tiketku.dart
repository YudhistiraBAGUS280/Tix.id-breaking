import 'package:flutter/material.dart';
import 'package:latihan_ukl_2024/daftarbioskop.dart';
import 'package:latihan_ukl_2024/homepage.dart';
import 'package:latihan_ukl_2024/tket.dart';

class Tiketku extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tiketku')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Container(
              height: 40,
              margin: const EdgeInsets.only(bottom: 16),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        hintText: 'Cari bioskop',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.account_circle),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.notifications),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 8),
              child: Row(
                children: [
                  Icon(Icons.location_on, size: 16),
                  Text(' Jakarta'),
                ],
              ),
            ),
            SizedBox(height: 20,),
            // Daftar Tiket
            Expanded(
              child: ListView(
                children: [
                  _buildTicketItem(
                    context,
                    'assets/garfiled.jpg',
                    'Gar ',
                    'Genre: Action',
                    'Umur: 17+',
                    'Rating: 8.5',
                  ),
                  SizedBox(height: 10),
                  _buildTicketItem(
                    context,
                    'assets/gladiator2.jpg',
                    'Gladiator 2 2024',
                    'Genre: Drama',
                    'Umur: 16+',
                    'Rating: 7.0',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.movie),
            label: 'Bioskop',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.people),
            label: 'T.ket',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            label: 'Tiketku',
          ),
        ],
        currentIndex: 3, // Index halaman aktif (Tiketku)
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
              break;
            case 1:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Daftarbioskop()),
              );
              break;
            case 2:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Tket()),
              );
              break;
            case 3:
              // Tetap di halaman Tiketku
              break;
          }
        },
        selectedItemColor: const Color.fromARGB(255, 25, 0, 164),
       
      ),
    );
  }

  // Widget untuk Item Tiket
  Widget _buildTicketItem(BuildContext context, String imagePath, String title,
      String genre, String age, String rating) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey), // Warna border
        borderRadius: BorderRadius.circular(8.0), // Sudut border
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              imagePath,
              width: 80, // Lebar gambar
              height: 120, // Tinggi gambar
              fit: BoxFit.cover, // Mengatur cara gambar ditampilkan
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(height: 4),
                  Text(genre),
                  Text(age),
                  Text(rating),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
