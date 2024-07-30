import 'package:contentsize_tabbarview/contentsize_tabbarview.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tugas_akhir_app/data/api/api_service.dart';
import 'package:tugas_akhir_app/data/local/auth_repository.dart';
import 'package:tugas_akhir_app/provider/employee_detail_provider.dart';
import 'package:tugas_akhir_app/provider/payslip_provider.dart';
import 'package:tugas_akhir_app/provider/presence_provider.dart';
import 'package:tugas_akhir_app/screen/widgets/card_attendance.dart';
import 'package:tugas_akhir_app/screen/widgets/card_payslip.dart';
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
  PresenceProvider? presenceProvider;
  PayslipProvider? payslipProvider;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    presenceProvider = context.read<PresenceProvider>();
    payslipProvider = context.read<PayslipProvider>();

    Future.microtask(() async {
      presenceProvider!.refreshAttendanceByOwner(employeeId: widget.id);
      payslipProvider!.refreshPayslipEmployeeByOwner(employeeId: widget.id);
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
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
                initial: () => const Center(child: CircularProgressIndicator()),
                loading: () => const Center(child: CircularProgressIndicator()),
                loaded: () => _buildBody(context, provider),
                error: (message) => Center(child: Text(message)),
              );
            },
          ),
        ));
  }

  Widget _buildBody(BuildContext context, EmployeeDetailProvider provider) {
    return SingleChildScrollView(
      controller: _scrollController,
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
                    : Text(
                        provider.detailEmployeeResponse!.data.storeLocation
                            .toString(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
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
    return Consumer<PresenceProvider>(
      builder: (context, presenceProvider, child) {
        final state = presenceProvider.loadingState;
        return state.when(
          initial: () => const Center(child: CircularProgressIndicator()),
          loading: () => const Center(child: CircularProgressIndicator()),
          loaded: () {
            if (presenceProvider.presences.isEmpty) {
              return const SizedBox(
                  height: 200,
                  child: Center(child: Text('No attendance data')));
            }
            return _buildListAttendance(presenceProvider);
          },
          error: (error) => Center(child: Text(error.toString())),
        );
      },
    );
  }

  Widget _buildPayslip() {
    return Consumer<PayslipProvider>(
      builder: (context, payslipProvider, child) {
        final state = payslipProvider.loadingState;
        return state.when(
          initial: () => const Center(child: CircularProgressIndicator()),
          loading: () => const Center(child: CircularProgressIndicator()),
          loaded: () => _buildListPayslip(payslipProvider),
          error: (error) => SizedBox(
              height: 200, child: Center(child: Text(error.toString()))),
        );
      },
    );
  }

  Widget _buildListAttendance(PresenceProvider presenceProvider) {
    return ListView.builder(
      itemCount: presenceProvider.presences.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final attendance = presenceProvider.presences[index];
        return CardAttendance(
          attendance: attendance,
        );
      },
    );
  }

  Widget _buildListPayslip(PayslipProvider payslipProvider) {
    return ListView.builder(
      itemCount: payslipProvider.payslips.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final payslip = payslipProvider.payslips[index];
        return CardPayslip(
          onTap: () {
            context.goNamed('detail_payslip_employee', pathParameters: {
              'employeeId': payslip.id.toString(),
              'id': widget.id
            });
          },
          payslip: payslip,
        );
      },
    );
  }
}
