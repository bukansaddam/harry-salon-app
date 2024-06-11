import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tugas_akhir_app/common/loading_state.dart';
import 'package:tugas_akhir_app/data/api/api_service.dart';
import 'package:tugas_akhir_app/data/local/auth_repository.dart';
import 'package:tugas_akhir_app/model/detail_hairstyle.dart';
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
          body: Consumer<HairstyleDetailProvider>(
            builder: (context, provider, child) {
              final state = provider.loadingState;
              return _buildBody(context, provider, state);
            },
          ),
        );
      },
    );
  }

  Widget _buildBody(BuildContext context, HairstyleDetailProvider provider,
      LoadingState state) {
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
              final detailHairstyle = provider.detailHairstyleResponse!.data;

              return _buildCarousel(context, provider, detailHairstyle);
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
              _buildAppBar(context),
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
                          provider.detailHairstyleResponse!.data;

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

  Widget _buildCarousel(BuildContext context, HairstyleDetailProvider provider,
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
                "${ApiService.baseUrl}/$index",
                fit: BoxFit.cover,
              ),
            );
          },
        );
      }).toList(),
      options: CarouselOptions(
        aspectRatio: 1.2,
        viewportFraction: 1,
        autoPlay: true,
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
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
