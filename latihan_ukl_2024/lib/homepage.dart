import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:latihan_ukl_2024/daftarbioskop.dart';
import 'package:latihan_ukl_2024/tiketku.dart';
import 'package:latihan_ukl_2024/tket.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0; // Index untuk BottomNavigationBar

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          flexibleSpace: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: Icon(Icons.search, color: Colors.black),
                          hintText: 'Cari di TIX ID',
                          hintStyle: TextStyle(fontSize: 14.0),
                          contentPadding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 15.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        style: TextStyle(fontSize: 15.0),
                      ),
                    ),
                    SizedBox(width: 10),
                    IconButton(
                      icon: Icon(Icons.notifications, color: const Color.fromARGB(255, 0, 0, 0)),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.account_circle, color: const Color.fromARGB(255, 0, 0, 0), size: 28),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.location_on),
                  SizedBox(width: 4.0),
                  Text(
                    'JAKARTA',
                    style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                  Icon(Icons.keyboard_arrow_down),
                ],
              ),
              SizedBox(height: 16.0),
              CarouselSlider(
                options: CarouselOptions(
                  height: 150,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 16 / 9,
                  viewportFraction: 1,
                ),
                items: ['assets/MOANA2.jpg', 'assets/gladiator2.jpg'].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(2)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(2),
                          child: Image.asset(
                            i,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              SizedBox(height: 16.0),
              Container(
                padding: EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Colors.yellow[100],
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  children: [
                    Icon(Icons.star, color: Colors.orange),
                    SizedBox(width: 8.0),
                    Expanded(
                      child: Text(
                        'Jadilah TIX VIP - Dapatkan untung lebih!',
                        style: TextStyle(fontSize: 14.0),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text('Join'),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Sedang Tayang',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(5, (index) {
                    return Container(
                      margin: EdgeInsets.only(right: 12.0),
                      width: 120,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 160,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              image: DecorationImage(
                                image: AssetImage('assets/SANTET.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Film $index',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
                          ),
                          Text('Beli Tiket', style: TextStyle(color: Colors.blue)),
                        ],
                      ),
                    );
                  }),
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Spotlight',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              CarouselSlider(
                options: CarouselOptions(
                  height: 150,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.8,
                ),
                items: [
                  'assets/MOANA.jpg',
                  'assets/SANTET.jpg',
                  'assets/GOTOBUN.jpg',
                  'assets/BILAIBU.jpg',
                ].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(2)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(2),
                          child: Image.asset(
                            i,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              SizedBox(height: 16.0),
              Text(
                'TIX Now',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Column(
                children: List.generate(3, (index) {
                  return ListTile(
                    leading: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: AssetImage('assets/MOANA.jpg'), // tambahkan gambar dari asset
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    title: Text('Berita Seputar Dunia Film'),
                    subtitle: Text('2 jam lalu'),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          // Update the index checks to ensure all items are covered
          if (index == 0) {
            // Navigate to Home Page (current page)
          } else if (index == 1) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Daftarbioskop()));
          } else if (index == 2) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Tket()));
          } else if (index == 3) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Tiketku()));
          }
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Bioskop'),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'T.ket'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Tiketku'),
        ],
      ),
    );
  }
}
