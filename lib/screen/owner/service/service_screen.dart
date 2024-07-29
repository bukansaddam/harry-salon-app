import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tugas_akhir_app/model/service.dart';
import 'package:tugas_akhir_app/provider/service_provider.dart';
import 'package:tugas_akhir_app/screen/widgets/search_bar.dart';

class ServiceScreen extends StatefulWidget {
  const ServiceScreen({super.key, required this.storeId});

  final String storeId;

  @override
  State<ServiceScreen> createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  final _searchController = TextEditingController();
  final _scrollController = ScrollController();
  Timer? _debounce;

  ServiceProvider? serviceProvider;

  @override
  void initState() {
    super.initState();
    serviceProvider = context.read<ServiceProvider>();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (serviceProvider!.pageItems != null) {
          serviceProvider!
              .getAllService(storeId: widget.storeId, searchValue: '');
        }
      }
    });

    Future.microtask(() async {
      serviceProvider!.refreshService(storeId: widget.storeId);
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    _debounce?.cancel();
    serviceProvider!.clearImage();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 1000), () {
      context
          .read<ServiceProvider>()
          .refreshService(storeId: widget.storeId, searchValue: query);
    });
  }

  void _onSelected(value, Service service, ServiceProvider provider) {
    switch (value) {
      case 'edit':
        context.goNamed(
          'add_service',
          pathParameters: {'id': widget.storeId},
          extra: service,
        );
        break;
      case 'delete':
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Delete Service'),
              content:
                  const Text('Are you sure you want to delete this service?'),
              actions: [
                TextButton(
                  onPressed: () {
                    context.pop();
                  },
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    context.pop();
                    provider.deleteService(service.id).then((_) =>
                        provider.refreshService(storeId: widget.storeId));
                  },
                  child:
                      const Text('Delete', style: TextStyle(color: Colors.red)),
                ),
              ],
            );
          },
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('More Services'),
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
                  hintText: 'Search services...',
                ),
              ],
            ),
          ),
          Expanded(
            child: _buildList(),
          ),
        ],
      ),
      floatingActionButton: _buildFAB(),
    );
  }

  Widget _buildFAB() {
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
          context.goNamed('add_service',
              pathParameters: {'id': widget.storeId}, extra: null);
        },
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _buildList() {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<ServiceProvider>().refreshService(storeId: widget.storeId);
      },
      child: Consumer<ServiceProvider>(
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
                itemCount: provider.services.length,
                physics: const AlwaysScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final service = provider.services[index];
                  return ListTile(
                      leading: Image.network(
                        service.image,
                        height: 24,
                        width: 24,
                        fit: BoxFit.cover,
                      ),
                      title: Text(service.name),
                      subtitle: Text(service.price.toString()),
                      trailing: PopupMenuButton(
                        icon: const Icon(Icons.more_vert),
                        itemBuilder: (context) {
                          return [
                            const PopupMenuItem(
                              value: 'edit',
                              child: Text('Edit'),
                            ),
                            const PopupMenuItem(
                              value: 'delete',
                              child: Text('Delete'),
                            ),
                          ];
                        },
                        onSelected: (String value) {
                          _onSelected(value, service, provider);
                        },
                      ));
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
      ),
    );
  }
}
