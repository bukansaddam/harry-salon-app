import 'package:contentsize_tabbarview/contentsize_tabbarview.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tugas_akhir_app/data/api/api_service.dart';
import 'package:tugas_akhir_app/data/local/auth_repository.dart';
import 'package:tugas_akhir_app/provider/employee_detail_provider.dart';
import 'package:tugas_akhir_app/screen/widgets/tab_item.dart';

class DetailEmployeeScreen extends StatefulWidget {
  const DetailEmployeeScreen({super.key, required this.id});

  final String id;

  @override
  State<DetailEmployeeScreen> createState() => _DetailEmployeeScreenState();
}

class _DetailEmployeeScreenState extends State<DetailEmployeeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<EmployeeDetailProvider>(
        create: (context) => EmployeeDetailProvider(
              authRepository: AuthRepository(),
              apiService: ApiService(),
              id: widget.id,
            ),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Detail Employee'),
          ),
          body: Consumer<EmployeeDetailProvider>(
            builder: (context, provider, child) {
              final state = provider.loadingState;

              return state.when(
                initial: () => const Center(
                  child: CircularProgressIndicator(),
                ),
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
                loaded: () => _buildBody(context, provider),
                error: (message) => Center(
                  child: Text(message),
                ),
              );
            },
          ),
        ));
  }

  Widget _buildBody(BuildContext context, EmployeeDetailProvider provider) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 35,
                  backgroundImage: NetworkImage(
                      provider.detailEmployeeResponse!.data.avatar),
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      provider.detailEmployeeResponse!.data.name,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF293869),
                      ),
                    ),
                    const Text('Employee'),
                  ],
                )
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Icon(
                  Icons.home_outlined,
                  color: Color(0xFF293869),
                ),
                const SizedBox(width: 10),
                Text(provider.detailEmployeeResponse!.data.address),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Icon(
                  Icons.alternate_email_outlined,
                  color: Color(0xFF293869),
                ),
                const SizedBox(width: 10),
                Text(provider.detailEmployeeResponse!.data.email),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Icon(
                  Icons.phone_outlined,
                  color: Color(0xFF293869),
                ),
                const SizedBox(width: 10),
                Text(provider.detailEmployeeResponse!.data.phone.toString()),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Icon(
                  Icons.store_outlined,
                  color: Color(0xFF293869),
                ),
                const SizedBox(width: 10),
                provider.detailEmployeeResponse!.data.storeLocation == null
                    ? const Text('No Store')
                    : Text(provider.detailEmployeeResponse!.data.storeLocation
                        .toString()),
              ],
            ),
            const SizedBox(height: 16),
            DefaultTabController(
              length: 2,
              child: Column(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: 40,
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF3B59BA), Color(0xFF354A98)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: TabBar(
                      controller: _tabController,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white,
                      ),
                      dividerHeight: 0,
                      labelStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      labelColor: const Color(0xFF354A98),
                      unselectedLabelColor: Colors.white,
                      tabs: const [
                        TabItem(title: 'Attendance'),
                        TabItem(title: 'Payslip'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              child: ContentSizeTabBarView(
                controller: _tabController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  _buildAttendance(),
                  _buildPayslip(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildAttendance() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 5,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFFE1EAF8)),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color(0xFFC9DBF4),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          DateFormat('EEEE').format(DateTime.now()),
                          style: const TextStyle(
                              color: Color(0xFF293869),
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        Text(
                          DateFormat('dd-MMM-yyyy').format(DateTime.now()),
                          style: const TextStyle(
                            color: Color(0xFF293869),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.access_time_outlined,
                            color: Color(0xFF293869),
                          ),
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Check In',
                                style: TextStyle(
                                  color: Color(0xFF293869),
                                ),
                              ),
                              Text(
                                '08:00 AM',
                                style: TextStyle(
                                  color: Color(0xFF293869),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.access_time_outlined,
                            color: Color(0xFF293869),
                          ),
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Check Out',
                                style: TextStyle(
                                  color: Color(0xFF293869),
                                ),
                              ),
                              Text(
                                '16:00 AM',
                                style: TextStyle(
                                  color: Color(0xFF293869),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildPayslip() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 5,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFFE1EAF8)),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color(0xFFC9DBF4),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Salary',
                          style: TextStyle(
                              color: Color(0xFF293869),
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        Text(
                          DateFormat('dd-MMM-yyyy').format(DateTime.now()),
                          style: const TextStyle(
                            color: Color(0xFF293869),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    child: Text(
                      'Rp. 5.000.000',
                      style: TextStyle(
                        color: Color(0xFF293869),
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ))
              ],
            ),
          ),
        );
      },
    );
  }
}
