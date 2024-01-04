import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/cubits/movie_cubit.dart';
import 'package:movieapp/pages/movies_page.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  var selectedIndex = 0;
  
  @override
  Widget build(BuildContext context) {

    final List<Widget> _pages = [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: MoviePage(),
      ),
      Placeholder(color: Colors.red),
      Placeholder(color: Color.fromARGB(255, 4, 139, 81)),
    ];

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 23, 25, 35),
      body: _pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.black,
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
