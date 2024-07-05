import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tugas_akhir_app/model/hairstyle.dart';
import 'package:tugas_akhir_app/provider/favorite_provider.dart';
import 'package:tugas_akhir_app/screen/widgets/card_hairstyle.dart';
import 'package:tugas_akhir_app/screen/widgets/search_bar.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  final _searchController = TextEditingController();
  final _scrollController = ScrollController();
  Timer? _debounce;
  String searchValue = '';

  @override
  void initState() {
    super.initState();
    final favoriteProvider = context.read<FavoriteProvider>();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (favoriteProvider.pageItems != null) {
          favoriteProvider.getFavorite();
        }
      }
    });

    Future.microtask(() async {
      favoriteProvider.refreshFavorite(searchValue: searchValue);
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
      context.read<FavoriteProvider>().refreshFavorite(searchValue: query);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite'),
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
    );
  }

  Widget _buildList(BuildContext context) {
    return Consumer<FavoriteProvider>(
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
                    provider.favorites.length,
                    (index) {
                      final favorites = provider.favorites[index];
                      final hairstyle = Hairstyle(
                          id: favorites.hairstyleId,
                          name: favorites.name,
                          description: favorites.description,
                          image: favorites.images);
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
}
