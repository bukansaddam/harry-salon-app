import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tugas_akhir_app/provider/payslip_provider.dart';
import 'package:tugas_akhir_app/screen/widgets/card_payslip.dart';

class PayslipEmployeeScreen extends StatefulWidget {
  const PayslipEmployeeScreen({super.key});

  @override
  State<PayslipEmployeeScreen> createState() => _PayslipEmployeeScreenState();
}

class _PayslipEmployeeScreenState extends State<PayslipEmployeeScreen> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    final employeeProvider = context.read<PayslipProvider>();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (employeeProvider.pageItems != null) {
          employeeProvider.getAllPayslip();
        }
      }
    });

    Future.microtask(() async {
      employeeProvider.refreshPayslip();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payslip'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _buildList(),
      ),
    );
  }

  Widget _buildList() {
    return Consumer<PayslipProvider>(
      builder: (context, payslipProvider, child) {
        final state = payslipProvider.loadingState;

        return state.when(
          initial: () {
            return const SizedBox.shrink();
          },
          loading: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
          loaded: () {
            return ListView.builder(
              controller: _scrollController,
              itemCount: payslipProvider.payslips.length,
              itemBuilder: (context, index) {
                final payslip = payslipProvider.payslips[index];
                return CardPayslip(
                  payslip: payslip,
                  onTap: () {
                    context.goNamed('detail_payslip', pathParameters: {
                      'id': payslip.id,
                    });
                  },
                );
              },
            );
          },
          error: (e) {
            return Center(
              child: Text(e),
            );
          },
        );
      },
    );
  }
}
