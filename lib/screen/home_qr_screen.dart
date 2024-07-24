import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tugas_akhir_app/model/store_owner.dart';
import 'package:tugas_akhir_app/provider/store_provider.dart';
import 'package:tugas_akhir_app/screen/widgets/search_bar.dart';

class HomeQrScreen extends StatefulWidget {
  const HomeQrScreen({super.key});

  @override
  State<HomeQrScreen> createState() => _HomeQrScreenState();
}

class _HomeQrScreenState extends State<HomeQrScreen> {
  final _searchController = TextEditingController();
  final _scrollController = ScrollController();
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    final storeProvider = context.read<StoreProvider>();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (storeProvider.pageItems != null) {
          storeProvider.getAllOwnerStore();
        }
      }
    });

    Future.microtask(() async {
      storeProvider.refreshOwnerStore();
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
      context.read<StoreProvider>().refreshOwnerStore(searchValue: query);
    });
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
                  hintText: 'Search store...',
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
    return Consumer<StoreProvider>(
      builder: (context, storeProvider, child) {
        final state = storeProvider.loadingState;
        return state.when(
          initial: () => const SizedBox(),
          loading: () => const Center(child: CircularProgressIndicator()),
          loaded: () {
            if (storeProvider.stores.isEmpty) {
              return const Center(
                child: Text('No store found'),
              );
            }
            return ListView.builder(
              controller: _scrollController,
              itemCount: storeProvider.stores.length,
              itemBuilder: (context, index) {
                return _buildItem(context, storeProvider.stores[index]);
              },
            );
          },
          error: (error) => Center(child: Text(error.toString())),
        );
      },
    );
  }

  Widget _buildItem(BuildContext context, StoreOwner store) {
    return ListTile(
      title: Text(store.name),
      subtitle: Text(store.location),
      onTap: () {
        context.goNamed('qr',
            pathParameters: {'storeId': store.id}, extra: store.name);
      },
    );
  }
}
