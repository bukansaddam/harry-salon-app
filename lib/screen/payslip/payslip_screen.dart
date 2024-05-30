import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tugas_akhir_app/model/payslip.dart';
import 'package:tugas_akhir_app/provider/payslip_provider.dart';
import 'package:tugas_akhir_app/screen/widgets/search_bar.dart';
import 'package:tugas_akhir_app/screen/widgets/toast_message.dart';

class PayslipScreen extends StatefulWidget {
  const PayslipScreen({super.key});

  @override
  State<PayslipScreen> createState() => _PayslipScreenState();
}

class _PayslipScreenState extends State<PayslipScreen> {
  final _searchController = TextEditingController();
  final _scrollController = ScrollController();
  Timer? _debounce;

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
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 1000), () {
      context.read<PayslipProvider>().refreshPayslip(searchValue: query);
    });
  }

  void _onSelected(value) {
    switch (value) {
      case 'Delete':
        ToastMessage.show(context, 'Delete');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
      floatingActionButton: _buildFAB(context),
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
          // do something here
        },
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MySearchBar(
                searchController: _searchController,
                onChanged: (value) {
                  _onSearchChanged(value!);
                },
                hintText: 'Search employee...',
              ),
            ],
          ),
        ),
        Expanded(
          child: _buildList(context),
        ),
      ],
    );
  }

  Widget _buildList(BuildContext context) {
    return Consumer<PayslipProvider>(
      builder: (context, provider, _) {
        final state = provider.loadingState;
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
              itemCount: provider.payslips.length +
                  (provider.pageItems != null ? 1 : 0),
              itemBuilder: (context, index) {
                if (index == provider.payslips.length &&
                    provider.pageItems != null) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                final payslip = provider.payslips[index];
                return _buildItem(context, payslip);
              },
            );
          },
          error: (e) {
            return Center(
              child: Text(e.toString()),
            );
          },
        );
      },
    );
  }

  Widget _buildItem(BuildContext context, Payslip payslip) {
    return ListTile(
      onTap: () {
        // do something here
      },
      leading: CircleAvatar(
        radius: 20,
        backgroundImage: Image.network(payslip.avatar).image,
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            payslip.employeeName,
          ),
          Text(
            NumberFormat.currency(
              locale: 'id',
              symbol: 'Rp ',
              decimalDigits: 0,
            ).format(payslip.total),
            style: const TextStyle(
              color: Color(0xFF354A98),
            ),
          ),
        ],
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            payslip.name,
            style: const TextStyle(
              color: Color(0xFF354A98),
            ),
          ),
          Text(
            DateFormat('dd MMM yyyy').format(payslip.createdAt),
          ),
        ],
      ),
    );
  }
}
