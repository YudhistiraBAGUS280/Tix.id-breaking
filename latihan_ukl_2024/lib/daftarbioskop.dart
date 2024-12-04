import 'package:flutter/material.dart';
import 'package:latihan_ukl_2024/homepage.dart';
import 'package:latihan_ukl_2024/tiketku.dart';
import 'package:latihan_ukl_2024/tket.dart';
import 'package:latihan_ukl_2024/widget/cinemadart.dart';

class Daftarbioskop extends StatefulWidget {
  const Daftarbioskop({Key? key}) : super(key: key);

  @override
  State<Daftarbioskop> createState() => _BioskopScreenState();
}

class _BioskopScreenState extends State<Daftarbioskop> {
  void _addToFavorites(String name) {
    final snackBar =
        SnackBar(content: Text('$name telah ditambahkan ke bioskop favorit'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bioskop'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
     
      ),
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

            // Title Section
           Row(
             children: [
               Image.asset('assets/bioskoppage.png', width: 60, height: 60), // ganti dengan gambar yang ingin Anda tampilkan
               SizedBox(width: 8), // tambahkan jarak antara gambar dan teks
               const Text(
                 'Tandai bioskop favoritmu!',
                 style: TextStyle(
                   fontSize: 18,
                   fontWeight: FontWeight.bold,
                 ),
               ),
             ],
           ),
            const SizedBox(height: 8.0),
            const Text(
              'Bioskop favoritmu akan berada paling atas pada daftar ini dan pada jadwal film.',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 16.0),

            // Cinema List
            Expanded(
              child: ListView(
                children: [
                  CinemaCard(
                    name: 'AEON MALL JGC CGV',
                    address: 'Jl. JGC No.1, Jakarta',
                    onTap: () {
                      _addToFavorites('AEON MALL JGC CGV');
                    },
                    imageUrl: 'assets/favorit.jpg',
                  ),
                  CinemaCard(
                    name: 'AEON MALL TANJUNG BARAT XXI',
                    address: 'Jl. Tanjung Barat No.2, Jakarta',
                    onTap: () {
                      _addToFavorites('AEON MALL TANJUNG BARAT XXI');
                    },
                    imageUrl: 'assets/favorit.jpg',
                  ),
                  CinemaCard(
                    name: 'AGORA MALL IMAX',
                    address: 'Jl. Agora No.3, Jakarta',
                    onTap: () {
                      _addToFavorites('AGORA MALL IMAX');
                    },
                    imageUrl: 'assets/favorit.jpg',
                  ),
                  CinemaCard(
                    name: 'AGORA MALL PREMIERE',
                    address: 'Jl. Premiere No.4, Jakarta',
                    onTap: () {
                      _addToFavorites('AGORA MALL PREMIERE');
                    },
                    imageUrl: 'assets/favorit.jpg',
                  ),
                  CinemaCard(
                    name: 'ARION XXI',
                    address: 'Jl. Arion No.6, Jakarta',
                    onTap: () {
                      _addToFavorites('ARION XXI');
                    },
                    imageUrl: 'assets/favorit.jpg',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
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
        currentIndex: 1,
        onTap: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  HomePage()),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  Tket()),
            );
          } else if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  Tiketku()),
            );
           
          }
        },
        selectedItemColor: const Color.fromARGB(255, 25, 0, 164),
       
      ),
    );
  }
}
