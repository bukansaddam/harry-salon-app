import 'package:flutter/material.dart';
import 'package:tugas_akhir_app/screen/customer/favorite_screen.dart';
import 'package:tugas_akhir_app/screen/customer/homepage_customer_screen.dart';
import 'package:tugas_akhir_app/screen/customer/profile_screen.dart';

class HomeCustomerScreen extends StatefulWidget {
  const HomeCustomerScreen({
    super.key,
  });

  @override
  State<HomeCustomerScreen> createState() => _HomeCustomerScreenState();
}

class _HomeCustomerScreenState extends State<HomeCustomerScreen> {
  late int _selectedIndex;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _selectedIndex = 0;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> _screens = <Widget>[
    HomepageCustomerScreen(),
    FavoriteScreen(),
    SafeArea(
      child: Text(
        'Profile',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
      ),
    ),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: _buildNavBar(context),
    );
  }

  Widget _buildNavBar(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
          )
        ],
      ),
      child: BottomNavigationBar(
        currentIndex: _selectedIndex,
        backgroundColor: Colors.white,
        showUnselectedLabels: true,
        unselectedItemColor: Colors.black,
        selectedItemColor: const Color(0xFF3B59BA),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              _selectedIndex == 0 ? Icons.home_rounded : Icons.home_outlined,
              color:
                  _selectedIndex == 0 ? const Color(0xFF3B59BA) : Colors.black,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              _selectedIndex == 1
                  ? Icons.favorite_rounded
                  : Icons.favorite_outline,
              color:
                  _selectedIndex == 1 ? const Color(0xFF3B59BA) : Colors.black,
            ),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              _selectedIndex == 2
                  ? Icons.history_rounded
                  : Icons.history_outlined,
              color:
                  _selectedIndex == 2 ? const Color(0xFF3B59BA) : Colors.black,
            ),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              _selectedIndex == 3
                  ? Icons.person_rounded
                  : Icons.person_outlined,
              color:
                  _selectedIndex == 3 ? const Color(0xFF3B59BA) : Colors.black,
            ),
            label: 'Profile',
          ),
        ],
        onTap: _onItemTapped,
      ),
    );
  }
}
