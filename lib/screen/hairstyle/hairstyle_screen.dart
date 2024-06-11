import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tugas_akhir_app/provider/hairstyle_provider.dart';
import 'package:tugas_akhir_app/screen/widgets/card_hairstyle.dart';
import 'package:tugas_akhir_app/screen/widgets/search_bar.dart';

class HairstyleScreen extends StatefulWidget {
  const HairstyleScreen({super.key});

  @override
  State<HairstyleScreen> createState() => _HairstyleScreenState();
}

class _HairstyleScreenState extends State<HairstyleScreen> {
  final _searchController = TextEditingController();
  final _scrollController = ScrollController();
  Timer? _debounce;
  String searchValue = '';

  final actor = const String.fromEnvironment('actor', defaultValue: 'customer');

  bool get isCustomer => actor == 'customer';
  bool get isOwner => actor == 'owner';

  @override
  void initState() {
    super.initState();
    final hairstyleProvider = context.read<HairstyleProvider>();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (hairstyleProvider.pageItems != null) {
          hairstyleProvider.getAllHairstyle();
        }
      }
    });

    Future.microtask(() async {
      hairstyleProvider.refreshHairstyle(searchValue: searchValue);
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
      context.read<HairstyleProvider>().refreshHairstyle(searchValue: query);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: isCustomer
          ? AppBar(
              title: const Text('Hairstyle'),
            )
          : null,
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
                  hintText: 'Search hairstyle...',
                ),
              ],
            ),
          ),
          Expanded(
            child: _buildList(context),
          ),
        ],
      ),
      floatingActionButton: isOwner ? _buildFAB(context) : null,
    );
  }

  Widget _buildList(BuildContext context) {
    return Consumer<HairstyleProvider>(
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
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: StaggeredGrid.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  children: List.generate(
                    provider.hairstyles.length,
                    (index) {
                      final hairstyle = provider.hairstyles[index];
                      return CardHairstyle(
                        index: index,
                        onTap: () {
                          context.goNamed('detail_hairstyle',
                              pathParameters: {'id': hairstyle.id});
                        },
                        hairstyle: hairstyle,
                      );
                    },
                  ),
                ),
              ),
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
          context.goNamed('add_hairstyle');
        },
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
