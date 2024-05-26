import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tugas_akhir_app/provider/employee_provider.dart';
import 'package:tugas_akhir_app/screen/widgets/search_bar.dart';

class MoreEmployeeScreen extends StatefulWidget {
  const MoreEmployeeScreen({
    super.key,
    required this.storeId,
  });

  final String storeId;

  @override
  State<MoreEmployeeScreen> createState() => _MoreEmployeeScreenState();
}

class _MoreEmployeeScreenState extends State<MoreEmployeeScreen> {
  final _searchController = TextEditingController();
  final _scrollController = ScrollController();
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    final employeeProvider = context.read<EmployeeProvider>();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (employeeProvider.pageItems != null) {
          employeeProvider.getEmployeeByStore(widget.storeId);
        }
      }
    });

    Future.microtask(() async {
      employeeProvider.refreshEmployeeByStore(widget.storeId);
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
      context
          .read<EmployeeProvider>()
          .refreshEmployeeByStore(widget.storeId, searchValue: query);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('More Employee'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
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
      ),
    );
  }

  Widget _buildList(BuildContext context) {
    return Consumer<EmployeeProvider>(
      builder: (context, provider, _) {
        final state = provider.employeeLoadingState;
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
              itemCount: provider.employeesByStore.length +
                  (provider.pageItems != null ? 1 : 0),
              itemBuilder: (context, index) {
                if (index == provider.employeesByStore.length &&
                    provider.pageItems != null) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                final employee = provider.employeesByStore[index];
                return ListTile(
                  onTap: () {
                    context.pushNamed('detail_employee', pathParameters: {
                      'id': employee.id,
                    });
                  },
                  leading: CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(employee.avatar),
                  ),
                  title: Text(employee.name),
                );
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
}
