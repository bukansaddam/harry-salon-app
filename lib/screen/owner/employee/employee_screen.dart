import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tugas_akhir_app/provider/employee_provider.dart';
import 'package:tugas_akhir_app/screen/widgets/search_bar.dart';
import 'package:tugas_akhir_app/screen/widgets/toast_message.dart';

class EmployeeScreen extends StatefulWidget {
  const EmployeeScreen({super.key});

  @override
  State<EmployeeScreen> createState() => _EmployeeScreenState();
}

class _EmployeeScreenState extends State<EmployeeScreen> {
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
          employeeProvider.getAllEmployee();
        }
      }
    });

    Future.microtask(() async {
      employeeProvider.refreshEmployee();
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
      context.read<EmployeeProvider>().refreshEmployee(searchValue: query);
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
      floatingActionButton: _buildFAB(context),
    );
  }

  Widget _buildList(BuildContext context) {
    return Consumer<EmployeeProvider>(
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
              itemCount: provider.employees.length +
                  (provider.pageItems != null ? 1 : 0),
              itemBuilder: (context, index) {
                if (index == provider.employees.length &&
                    provider.pageItems != null) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                final employee = provider.employees[index];
                return ListTile(
                  onTap: () {
                    context.pushNamed('detail_employee', pathParameters: {
                      'id': employee.id,
                    });
                  },
                  leading: CircleAvatar(
                    radius: 20,
                    backgroundImage: Image.network(employee.avatar).image,
                  ),
                  title: Text(employee.name),
                  trailing: PopupMenuButton(
                      icon: const Icon(Icons.more_vert),
                      elevation: 1,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context) {
                        return [
                          const PopupMenuItem(
                            height: 30,
                            value: 'Delete',
                            child: Text(
                              'Delete',
                              style: TextStyle(
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ];
                      },
                      onSelected: _onSelected),
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
          context.goNamed('add_employee');
        },
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
