import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tugas_akhir_app/common/loading_state.dart';
import 'package:tugas_akhir_app/data/api/api_service.dart';
import 'package:tugas_akhir_app/data/local/auth_repository.dart';
import 'package:tugas_akhir_app/model/detail_commodity.dart';
import 'package:tugas_akhir_app/provider/commodity_detail_provider.dart';
import 'package:tugas_akhir_app/provider/commodity_provider.dart';
import 'package:tugas_akhir_app/screen/widgets/button.dart';
import 'package:tugas_akhir_app/screen/widgets/toast_message.dart';

class DetailCommodityScreen extends StatefulWidget {
  const DetailCommodityScreen(
      {super.key, required this.id, required this.storeId});

  final String id;
  final String storeId;

  @override
  State<DetailCommodityScreen> createState() => _DetailCommodityScreenState();
}

class _DetailCommodityScreenState extends State<DetailCommodityScreen> {
  late CommodityProvider _commodityProvider;

  final actor = const String.fromEnvironment('actor', defaultValue: 'owner');

  bool get isOwner => actor == 'owner';
  bool get isEmployee => actor == 'employee';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _commodityProvider = Provider.of<CommodityProvider>(context, listen: false);
  }

  void _onSelected(value, DetailCommodity detailCommodity) {
    switch (value) {
      case 'Edit':
        context.goNamed('update_commodity', pathParameters: {
          'commodityId': widget.id,
          'id': widget.storeId
        }, extra: {
          'id': widget.storeId,
          'commodity': detailCommodity,
        });
        break;
      case 'Delete':
        ToastMessage.show(context, 'Delete');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DetailCommodityProvider>(
      create: (context) => DetailCommodityProvider(
        apiService: ApiService(),
        authRepository: AuthRepository(),
        id: widget.id,
      ),
      child: Scaffold(
        body: Consumer<DetailCommodityProvider>(
          builder: (context, provider, child) {
            final state = provider.loadingState;
            return RefreshIndicator(
                onRefresh: () {
                  return provider.getDetail(id: widget.id);
                },
                child: _buildBody(context, provider, state));
          },
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context, DetailCommodityProvider provider,
      LoadingState state) {
    return Stack(
      children: [
        state.when(
          initial: () => const SizedBox.shrink(),
          loading: () => const Center(child: CircularProgressIndicator()),
          loaded: () {
            final detailCommodity = provider.detailCommodityResponse!.data;
            return SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  _buildImage(provider, detailCommodity),
                  _buildDetailCommodity(context, detailCommodity, provider),
                ],
              ),
            );
          },
          error: (message) => Center(child: Text(message)),
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
          child: _buildAppBar(provider),
        ),
      ],
    );
  }

  Widget _buildAppBar(DetailCommodityProvider provider) {
    final detailCommodity = provider.detailCommodityResponse?.data;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            _commodityProvider.refreshCommodity(storeId: widget.storeId);
            context.pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        const Text(
          'Detail Commodity',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        isOwner
            ? PopupMenuButton(
                onSelected: (String value) {
                  _onSelected(value, detailCommodity!);
                },
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
                width: 24,
              ),
      ],
    );
  }

  Widget _buildImage(
      DetailCommodityProvider provider, DetailCommodity detailCommodity) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
      child: Image.network(
        detailCommodity.image,
        fit: BoxFit.cover,
        height: 600,
        width: double.infinity,
        loadingBuilder: (BuildContext context, Widget child,
            ImageChunkEvent? loadingProgress) {
          if (loadingProgress == null) {
            return child;
          } else {
            return Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        (loadingProgress.expectedTotalBytes ?? 1)
                    : null,
              ),
            );
          }
        },
      ),
    );
  }

  Widget _buildDetailCommodity(BuildContext context,
      DetailCommodity detailCommodity, DetailCommodityProvider provider) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            detailCommodity.name,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF293869),
            ),
          ),
          const SizedBox(height: 8),
          Text('Category: ${detailCommodity.category}'),
          const SizedBox(height: 8),
          const Text('Current Stock'),
          const SizedBox(height: 8),
          _buildStockSection(context, provider),
          const SizedBox(height: 80),
          provider.commodityStock != provider.currentStock
              ? provider.loadingState.when(
                  initial: () => const SizedBox.shrink(),
                  loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  loaded: () => CustomButton(
                    function: () {
                      showDialog(
                        context: context,
                        builder: (_) {
                          return AlertDialog(
                            title: const Text('Update Stock'),
                            content: const Text(
                                'Are you sure want to update this item stock?'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('No'),
                              ),
                              TextButton(
                                onPressed: () async {
                                  context.pop();
                                  _updateStock(provider);
                                },
                                child: const Text('Yes'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    text: 'Update Stock',
                  ),
                  error: (message) => Text(message),
                )
              : const SizedBox.shrink(),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Future<void> _updateStock(DetailCommodityProvider provider) async {
    await provider.updateStock();
    if (mounted) {
      ToastMessage.show(context, 'Stock Updated');
      // context.goNamed('more_commodity', pathParameters: {'id': widget.storeId});
    }
  }

  Widget _buildStockSection(
      BuildContext context, DetailCommodityProvider provider) {
    return SizedBox(
      width: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              provider.decreaseStock();
            },
            child: Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF3B59BA), Color(0xFF354A98)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              height: 50,
              width: 50,
              child: const Icon(Icons.remove, color: Colors.white),
            ),
          ),
          Text(
            provider.commodityStock.toString(),
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Color(0xFF293869),
            ),
          ),
          InkWell(
            onTap: () {
              provider.increaseStock();
            },
            child: Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF3B59BA), Color(0xFF354A98)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              height: 50,
              width: 50,
              child: const Icon(Icons.add, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
