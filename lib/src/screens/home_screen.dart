import 'package:flutter/material.dart';

import '../screens/orders_overview.dart';
import '../screens/graph_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  List<Widget> screens = [const OrdersOverviewScreen(), const GraphScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey[50],
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Info',
            icon: Icon(Icons.bar_chart),
          ),
        ],
        selectedItemColor: Colors.blue[800],
        onTap: _onItemTapped,
      ),
      body: screens[_currentIndex],
    );
  }
}
