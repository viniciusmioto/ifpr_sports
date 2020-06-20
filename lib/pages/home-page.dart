import 'package:flutter/material.dart';
import 'package:ifsports/pages/championships_page.dart';
import 'package:ifsports/pages/events-page.dart';
import 'package:ifsports/pages/news-page.dart';
import 'package:ifsports/pages/training-page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController = PageController();
  List<Widget> _screens = [NewsPage(), TrainingPage(), EventsPage(), ChampionshipsPage()];

  int _selectedIndex = 0;

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onItemTapped(int selectedIndex) {
    _pageController.jumpToPage(selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _screens,
        onPageChanged: _onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _selectedIndex == 0 ? Colors.teal : Colors.grey,
            ),
            title: Text(
              "home",
              style: TextStyle(
                color: _selectedIndex == 0 ? Colors.teal : Colors.grey,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.fitness_center,
              color: _selectedIndex == 1 ? Colors.teal : Colors.grey,
            ),
            title: Text(
              "treinos",
              style: TextStyle(
                color: _selectedIndex == 1 ? Colors.teal : Colors.grey,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.event_available,
              color: _selectedIndex == 2 ? Colors.teal : Colors.grey,
            ),
            title: Text(
              "eventos",
              style: TextStyle(
                color: _selectedIndex == 2 ? Colors.teal : Colors.grey,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.stars,
              color: _selectedIndex == 3 ? Colors.teal : Colors.grey,
            ),
            title: Text(
              "competições",
              style: TextStyle(
                color: _selectedIndex == 3 ? Colors.teal : Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
