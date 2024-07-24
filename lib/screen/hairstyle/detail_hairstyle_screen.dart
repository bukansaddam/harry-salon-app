import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tugas_akhir_app/common/loading_state.dart';
import 'package:tugas_akhir_app/data/api/api_service.dart';
import 'package:tugas_akhir_app/data/local/auth_repository.dart';
import 'package:tugas_akhir_app/model/detail_hairstyle.dart';
import 'package:tugas_akhir_app/provider/favorite_provider.dart';
import 'package:tugas_akhir_app/provider/hairstyle_detail_provider.dart';
import 'package:tugas_akhir_app/screen/widgets/toast_message.dart';

class DetailHairstyleScreen extends StatefulWidget {
  const DetailHairstyleScreen({super.key, required this.id});

  final String id;

  @override
  State<DetailHairstyleScreen> createState() => _DetailHairstyleScreenState();
}

class _DetailHairstyleScreenState extends State<DetailHairstyleScreen> {
  final actor = const String.fromEnvironment('actor', defaultValue: 'customer');

  bool get isOwner => actor == 'owner';
  bool get isCustomer => actor == 'customer';

  FavoriteProvider? favoriteProvider;

  @override
  void initState() {
    super.initState();

    favoriteProvider = context.read<FavoriteProvider>();

    Future.microtask(() {
      favoriteProvider!.getFavorite(id: widget.id);
    });
  }

  void _onSelected(value) {
    switch (value) {
      case 'Edit':
        ToastMessage.show(context, 'Edit');
        break;
      case 'Delete':
        ToastMessage.show(context, 'Delete');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HairstyleDetailProvider>(
      create: (context) => HairstyleDetailProvider(
        apiService: ApiService(),
        authRepository: AuthRepository(),
        id: widget.id,
      ),
      builder: (context, child) {
        return Scaffold(
          body: Consumer2<HairstyleDetailProvider, FavoriteProvider>(
            builder: (context, hairstyleProvider, favoriteProvider, child) {
              final state = hairstyleProvider.loadingState;
              return _buildBody(
                  context, hairstyleProvider, favoriteProvider, state);
            },
          ),
        );
      },
    );
  }

  Widget _buildBody(
    BuildContext context,
    HairstyleDetailProvider hairstyleProvider,
    FavoriteProvider favoriteProvider,
    LoadingState state,
  ) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: state.when(
            initial: () => CarouselSlider(
              items: [1].map((index) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.black,
                      ),
                    );
                  },
                );
              }).toList(),
              options: CarouselOptions(
                aspectRatio: 1.2,
                viewportFraction: 1,
              ),
            ),
            loading: () => const SizedBox.shrink(),
            loaded: () {
              final detailHairstyle =
                  hairstyleProvider.detailHairstyleResponse!.data;

              return _buildCarousel(
                  context, hairstyleProvider, detailHairstyle);
            },
            error: (message) => Center(
              child: Text(message),
            ),
          ),
        ),
        IgnorePointer(
          child: Container(
            height: 200,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black87, Colors.transparent],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ),
        SafeArea(
          child: Stack(
            children: [
              _buildAppBar(context, favoriteProvider),
              Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 250),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: state.when(
                    initial: () => const SizedBox.shrink(),
                    loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    loaded: () {
                      final detailHairstyle =
                          hairstyleProvider.detailHairstyleResponse!.data;

                      return _buildDetailHairstyle(context, detailHairstyle);
                    },
                    error: (message) => Center(
                      child: Text(message),
                    ),
                  )),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildCarousel(
      BuildContext context,
      HairstyleDetailProvider hairstyleProvider,
      DetailHairstyle detailHairstyle) {
    return CarouselSlider(
      items: detailHairstyle.images.map((index) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.black,
              ),
              child: Image.network(
                index,
                fit: BoxFit.cover,
              ),
            );
          },
        );
      }).toList(),
      options: CarouselOptions(
        aspectRatio: 1.2,
        viewportFraction: 1,
        autoPlay: detailHairstyle.images.length > 1 ? true : false,
        enableInfiniteScroll: detailHairstyle.images.length > 1 ? true : false,
      ),
    );
  }

  Widget _buildAppBar(BuildContext context, FavoriteProvider favoriteProvider) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        const Text(
          'Detail Hairstyle',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        isOwner
            ? PopupMenuButton(
                onSelected: _onSelected,
                itemBuilder: (BuildContext context) {
                  return [
                    const PopupMenuItem(
                      value: 'Edit',
                      child: Text('Edit'),
                    ),
                    const PopupMenuItem(
                      value: 'Delete',
                      child: Text('Delete'),
                    ),
                  ];
                },
                icon: const Icon(
                  Icons.more_vert,
                  color: Colors.white,
                ),
              )
            : isCustomer
                ? IconButton(
                    onPressed: () async {
                      if (favoriteProvider.isFavorite) {
                        await favoriteProvider.removeFromFavorite(widget.id);
                        debugPrint('Remove from favorite');
                      } else {
                        await favoriteProvider.addToFavorite(widget.id);
                        debugPrint('Add to favorite');
                      }
                    },
                    icon: Icon(
                      favoriteProvider.isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: Colors.red,
                    ))
                : const SizedBox(
                    width: 30,
                  ),
      ],
    );
  }

  Widget _buildDetailHairstyle(
      BuildContext context, DetailHairstyle detailHairstyle) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            detailHairstyle.name,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF293869),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            detailHairstyle.description,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
