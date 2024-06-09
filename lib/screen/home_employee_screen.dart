import 'package:flutter/material.dart';
import 'package:tugas_akhir_app/screen/employee/dashboard_employee_screen.dart';

class HomeEmployeeScreen extends StatefulWidget {
  const HomeEmployeeScreen({super.key});

  @override
  State<HomeEmployeeScreen> createState() => _HomeEmployeeScreenState();
}

class _HomeEmployeeScreenState extends State<HomeEmployeeScreen> {
  late int _selectedIndex;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _selectedIndex = 0;
  }

  void _onItemTapped(int index) {
    if (index != 2) {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  static const List<Widget> _screens = <Widget>[
    DashboardEmployeeScreen(),
    SafeArea(
      child: Text(
        'Activity',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
      ),
    ),
    Text(
      'Scan',
      style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
    ),
    SafeArea(
      child: Text(
        'Payslip',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
      ),
    ),
    SafeArea(
      child: Text(
        'Profile',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: _buildNavBar(context),
      floatingActionButton: _buildFAB(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
              Icons.insights_rounded,
              color:
                  _selectedIndex == 1 ? const Color(0xFF3B59BA) : Colors.black,
            ),
            label: 'Activity',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add,
              color:
                  _selectedIndex == 2 ? const Color(0xFF3B59BA) : Colors.black,
            ),
            label: 'Scan',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              _selectedIndex == 3
                  ? Icons.payments_rounded
                  : Icons.payments_outlined,
              color:
                  _selectedIndex == 3 ? const Color(0xFF3B59BA) : Colors.black,
            ),
            label: 'Payslip',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              _selectedIndex == 4 ? Icons.person_rounded : Icons.person_outline,
              color:
                  _selectedIndex == 4 ? const Color(0xFF3B59BA) : Colors.black,
            ),
            label: 'Profile',
          ),
        ],
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildFAB(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [Color(0xFF3B59BA), Color(0xFF354A98)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: FloatingActionButton(
        onPressed: () {
          // do something
        },
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: const Icon(Icons.qr_code, color: Colors.white),
      ),
    );
  }
}
