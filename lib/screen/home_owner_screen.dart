import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:tugas_akhir_app/provider/home_provider.dart';
import 'package:tugas_akhir_app/screen/customer/profile_screen.dart';
import 'package:tugas_akhir_app/screen/owner/employee/employee_screen.dart';
import 'package:tugas_akhir_app/screen/hairstyle/hairstyle_screen.dart';
import 'package:tugas_akhir_app/screen/owner/payslip/payslip_screen.dart';
import 'package:tugas_akhir_app/screen/owner/store/dashboard_screen.dart';
import 'package:tugas_akhir_app/screen/widgets/item_drawer.dart';

class HomeOwnerScreen extends StatefulWidget {
  const HomeOwnerScreen({super.key});

  @override
  State<HomeOwnerScreen> createState() => _HomeOwnerScreenState();
}

class _HomeOwnerScreenState extends State<HomeOwnerScreen> {
  late int _selectedIndex;
  String _title = 'Dashboard';
  bool _expanded = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _selectedIndex = context.watch<HomeProvider>().selectedIndex;
  }

  void _onItemTapped(int index) {
    context.read<HomeProvider>().onItemTapped(index);
  }

  static const List<Widget> _widgetOptions = <Widget>[
    DashboardScreen(),
    EmployeeScreen(),
    PayslipScreen(),
    HairstyleScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: _expanded ? 300 : 55,
        child: Drawer(
          child: SizedBox(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.3),
                ItemDrawer(
                  icon: Icons.dashboard_outlined,
                  title: _expanded ? 'Dashboard' : null,
                  selected: _selectedIndex == 0,
                  onTap: () {
                    _title = 'Dashboard';
                    _onItemTapped(0);
                    // context.pop();
                  },
                ),
                ItemDrawer(
                  icon: Iconsax.people,
                  title: _expanded ? 'Employees' : null,
                  selected: _selectedIndex == 1,
                  onTap: () {
                    _title = 'Employee';
                    _onItemTapped(1);
                    // context.pop();
                  },
                ),
                ItemDrawer(
                  icon: Iconsax.wallet_1,
                  title: _expanded ? 'Payslips' : null,
                  selected: _selectedIndex == 2,
                  onTap: () {
                    _title = 'Payslip';
                    _onItemTapped(2);
                    // context.pop();
                  },
                ),
                ItemDrawer(
                  icon: Icons.face,
                  title: _expanded ? 'Hairstyles' : null,
                  selected: _selectedIndex == 3,
                  onTap: () {
                    _title = 'Hairstyle';
                    _onItemTapped(3);
                    // context.pop();
                  },
                ),
                ItemDrawer(
                  icon: Icons.person_outline,
                  title: _expanded ? 'Profile' : null,
                  selected: _selectedIndex == 4,
                  onTap: () {
                    _title = 'Profile';
                    _onItemTapped(4);
                    // context.pop();
                  },
                ),
                ItemDrawer(
                  icon:
                      _expanded ? Iconsax.arrow_left_2 : Iconsax.arrow_right_3,
                  title: '',
                  selected: _selectedIndex == 5,
                  onTap: () {
                    setState(() {
                      _expanded = !_expanded;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        title: Text(
          _title,
          style: _selectedIndex == 0
              ? const TextStyle(color: Colors.white)
              : const TextStyle(color: Colors.black),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: _selectedIndex == 0
                  ? [const Color(0xFF3B59BA), const Color(0xFF354A98)]
                  : [Colors.transparent, Colors.transparent],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: _selectedIndex == 0
            ? const IconThemeData(color: Colors.white)
            : const IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
        child: _widgetOptions[_selectedIndex],
      ),
    );
  }
}
