

import 'package:flutter/material.dart';
import 'package:latihan_ukl_2024/daftarbioskop.dart';
import 'package:latihan_ukl_2024/homepage.dart';
import 'package:latihan_ukl_2024/tiketku.dart';

void main() {
  runApp(Tket());
}

class Tket extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TicketPage(),
    );
  }
}

class TicketPage extends StatefulWidget {
  @override
  _TicketPageState createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Navigasi ke halaman sebelumnya
          },
        ),
        title: Text(
          'Film Bioskop',
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // TabBar untuk Sedang Tayang & Akan Datang
          TabBar(
            controller: _tabController,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.blue,
            tabs: [
              Tab(text: 'SEDANG TAYANG'),
              Tab(text: 'AKAN DATANG'),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // Tab Sedang Tayang
                buildMovieGrid([
                  Movie(
                    title: 'Bila Esok Ibu Tiada',
                    genre: 'Drama, Keluarga',
                    rating: 9.2,
                    ageRating: '13+',
                    image:
                        'assets/BILAIBU.jpg', // Tambahkan file gambar ke folder assets
                  ),
                  Movie(
                    title: 'Santet Segoro Pitu',
                    genre: 'Horror',
                    rating: 9.0,
                    ageRating: '17+',
                    image: 'assets/SANTET.jpg',
                  ),
                  Movie(
                    title: 'Gladiator II',
                    genre: 'Action, Adventure',
                    rating: 9.5,
                    ageRating: '17+',
                    image: 'assets/gladiator2.jpg',
                  ),
                  Movie(
                    title: 'Garfield 2 2024',
                    genre: 'Action, Adventure',
                    rating: 9.3,
                    ageRating: '13+',
                    image: 'assets/garfiled.jpg',
                  ),
                ]),
                // Tab Akan Datang
                buildMovieGrid([
                  Movie(
                    title: 'AMBATMAN',
                    genre: 'ACTION, Adventure',
                    rating: 0.0,
                    ageRating: '17+',
                    image: 'assets/ambatman.jpg',
                  ),
                  Movie(
                    title: 'GOTOBUN ',
                    genre: 'Action, ROMANCE',
                    rating: 0.0,
                    ageRating: '13+',
                    image: 'assets/GOTOBUN.jpg',
                  ),
                ]),
              ],
            ),
          ),
        ],
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
  currentIndex: 1, // 1 karena halaman ini untuk T.ket
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
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Tiketku()),
        );
        break;
    }
  },
  selectedItemColor: const Color.fromARGB(255, 25, 0, 164),
  
),

    );
  }

  // Grid Builder untuk Daftar Film
  Widget buildMovieGrid(List<Movie> movies) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          childAspectRatio: 0.7,
        ),
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return buildMovieCard(movie);
        },
      ),
      
      

    );
    
  }
  

  // Widget untuk Kartu Film
  Widget buildMovieCard(Movie movie) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      elevation: 3.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Gambar Film
          Stack(
            children: [
              Container(
                height: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    topRight: Radius.circular(8.0),
                  ),
                  image: DecorationImage(
                    image: AssetImage(movie.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: Text(
                    movie.ageRating,
                    style:
                        TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Icon(Icons.favorite_border, color: Colors.white),
              ),
            ],
          ),
          // Detail Film
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4.0),
                Text(
                  movie.genre,
                  style: TextStyle(fontSize: 12.0, color: Colors.grey),
                ),
                SizedBox(height: 4.0),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 16.0),
                    SizedBox(width: 4.0),
                    Text(
                      movie.rating > 0
                          ? movie.rating.toString()
                          : 'Coming Soon',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 12.0),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Model untuk Film
class Movie {
  final String title;
  final String genre;
  final double rating;
  final String ageRating;
  final String image;

  Movie({
    required this.title,
    required this.genre,
    required this.rating,
    required this.ageRating,
    required this.image,
  });
}