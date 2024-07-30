import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tugas_akhir_app/provider/commodity_provider.dart';
import 'package:tugas_akhir_app/screen/widgets/search_bar.dart';

class CommodityScreen extends StatefulWidget {
  const CommodityScreen({super.key, required this.storeId});

  final String storeId;

  @override
  State<CommodityScreen> createState() => _CommodityScreenState();
}

class _CommodityScreenState extends State<CommodityScreen> {
  final _searchController = TextEditingController();
  final _scrollController = ScrollController();
  Timer? _debounce;

  final actor = const String.fromEnvironment('actor', defaultValue: 'owner');

  bool get isOwner => actor == 'owner';
  bool get isEmployee => actor == 'employee';

  List<String> category = ['All', 'Hair Care', 'Hair Styling'];

  String selectedCategory = '';

  @override
  void initState() {
    super.initState();
    final commodityProvider = context.read<CommodityProvider>();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (commodityProvider.pageItems != null) {
          commodityProvider.getAllCommodity(storeId: widget.storeId);
        }
      }
    });

    Future.microtask(() async {
      commodityProvider.refreshCommodity(storeId: widget.storeId);
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
      context.read<CommodityProvider>().refreshCommodity(
          storeId: widget.storeId,
          searchValue: query,
          category: selectedCategory);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Commodity'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
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
                  hintText: 'Search commodity...',
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color(0xFFF3F5F9),
              ),
              child: DropdownButton<String>(
                value: selectedCategory.isNotEmpty
                    ? selectedCategory
                    : category.first,
                underline: const SizedBox(),
                items: category.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    selectedCategory = value!;
                  });
                  context.read<CommodityProvider>().refreshCommodity(
                        storeId: widget.storeId,
                        category: selectedCategory,
                      );
                },
              ),
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: _buildList(),
            ),
          ),
        ],
      ),
      floatingActionButton: isOwner ? _buildFAB() : null,
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
          if (isOwner) {
            context.goNamed('update_commodity',
                pathParameters: {
                  'id': widget.storeId,
                },
                extra: null);
          } else {
            context.goNamed('update_commodity', extra: {
              'id': widget.storeId,
              'commodity': null,
            });
          }
        },
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _buildList() {
    return Consumer<CommodityProvider>(
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
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 0.7,
              ),
              itemBuilder: (context, index) {
                final commodities = provider.commodities[index];
                return InkWell(
                  onTap: () {
                    if (isOwner) {
                      context.goNamed('detail_commodity', pathParameters: {
                        'id': widget.storeId,
                        'commodityId': commodities.id,
                      });
                    } else {
                      context.goNamed('detail_commodity', pathParameters: {
                        'commodityId': commodities.id,
                      }, extra: {
                        'id': widget.storeId,
                      });
                    }
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        child: Image.network(commodities.image,
                            height: 200, fit: BoxFit.cover),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              commodities.name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'stock : ${commodities.stock}',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
              itemCount: provider.commodities.length,
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
