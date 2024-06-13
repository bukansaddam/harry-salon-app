import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:contentsize_tabbarview/contentsize_tabbarview.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tugas_akhir_app/data/api/api_service.dart';
import 'package:tugas_akhir_app/data/local/auth_repository.dart';
import 'package:tugas_akhir_app/model/detail_store.dart';
import 'package:tugas_akhir_app/provider/commodity_provider.dart';
import 'package:tugas_akhir_app/provider/review_provider.dart';
import 'package:tugas_akhir_app/provider/service_provider.dart';
import 'package:tugas_akhir_app/provider/store_detail_provider.dart';
import 'package:tugas_akhir_app/provider/store_provider.dart';
import 'package:tugas_akhir_app/screen/widgets/bar_graph/bar_graph.dart';
import 'package:tugas_akhir_app/screen/widgets/tab_item.dart';
import 'package:tugas_akhir_app/screen/widgets/toast_message.dart';

class DetailStoreScreen extends StatefulWidget {
  final String id;

  const DetailStoreScreen({super.key, required this.id});

  @override
  State<DetailStoreScreen> createState() => _DetailStoreScreenState();
}

class _DetailStoreScreenState extends State<DetailStoreScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final ScrollController _scrollController = ScrollController();

  CommodityProvider? commodityProvider;
  ServiceProvider? serviceProvider;
  ReviewProvider? reviewProvider;
  bool _isDataFetched = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!_isDataFetched) {
      commodityProvider = Provider.of<CommodityProvider>(context);
      serviceProvider = Provider.of<ServiceProvider>(context);
      reviewProvider = Provider.of<ReviewProvider>(context);

      Future.microtask(() {
        commodityProvider!.refreshCommodity(storeId: widget.id);
        serviceProvider!.refreshService(storeId: widget.id);
        reviewProvider!.refreshReview(storeId: widget.id);
      });

      _isDataFetched = true;
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _onSelected(BuildContext context, value) {
    switch (value) {
      case 'Edit':
        ToastMessage.show(context, value);
        break;
      case 'Deactivate':
        showDialog(
          context: context,
          builder: (_) {
            return AlertDialog(
              title: const Text('Deactivate Store'),
              content: const Text('Are you sure to deactivate this store?'),
              actions: [
                TextButton(
                  onPressed: () {
                    context.pop();
                  },
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    Provider.of<StoreDetailProvider>(context, listen: false)
                        .deactivateStore();
                    context.pop();
                    ToastMessage.show(context, 'Store deactivated');
                  },
                  child: const Text('Deactivate'),
                ),
              ],
            );
          },
        );
        break;
      case 'Activate':
        showDialog(
          context: context,
          builder: (_) {
            return AlertDialog(
              title: const Text('Activate Store'),
              content: const Text('Are you sure to activate this store?'),
              actions: [
                TextButton(
                  onPressed: () {
                    context.pop();
                  },
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    Provider.of<StoreDetailProvider>(context, listen: false)
                        .activateStore();
                    context.pop();
                    ToastMessage.show(context, 'Store activated');
                  },
                  child: const Text('Activate'),
                ),
              ],
            );
          },
        );
        break;
      case 'Delete':
        ToastMessage.show(context, value);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => StoreDetailProvider(
          authRepository: AuthRepository(),
          apiService: ApiService(),
          id: widget.id),
      child: Consumer5<StoreDetailProvider, CommodityProvider, ServiceProvider,
          StoreProvider, ReviewProvider>(
        builder: (context, detailProvider, commodityProvider, serviceProvider,
            storeProvider, reviewProvider, child) {
          final state = detailProvider.loadingState;

          return state.when(
            initial: () => const Center(
              child: CircularProgressIndicator(),
            ),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            loaded: () {
              final detailStore = detailProvider.detailStoreResponse!.data;
              return _buildBody(
                context,
                detailStore,
                detailProvider,
                commodityProvider,
                serviceProvider,
                storeProvider,
                reviewProvider,
              );
            },
            error: (message) => Center(
              child: Text(message),
            ),
          );
        },
      ),
    );
  }

  Widget _buildBody(
    BuildContext context,
    DetailStore detailStore,
    StoreDetailProvider detailProvider,
    CommodityProvider commodityProvider,
    ServiceProvider serviceProvider,
    StoreProvider storeProvider,
    ReviewProvider reviewProvider,
  ) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: CarouselSlider(
              items: detailStore.images.map((index) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Colors.black,
                        ),
                        child: Image.network(
                          "${ApiService.baseUrl}/${index.image}",
                          fit: BoxFit.cover,
                        ));
                  },
                );
              }).toList(),
              options: CarouselOptions(
                aspectRatio: 1.2,
                viewportFraction: 1,
                autoPlay: true,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        context.pop();
                        storeProvider.refreshOwnerStore();
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      'Detail Store',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    PopupMenuButton(
                      onSelected: (value) {
                        _onSelected(context, value);
                      },
                      itemBuilder: (BuildContext context) {
                        return [
                          const PopupMenuItem(
                            value: 'Edit',
                            child: Text('Edit'),
                          ),
                          detailProvider.isActive == true
                              ? const PopupMenuItem(
                                  value: 'Deactivate',
                                  child: Text('Deactivate'),
                                )
                              : const PopupMenuItem(
                                  value: 'Activate',
                                  child: Text('Activate'),
                                ),
                          const PopupMenuItem(
                            value: 'Delete',
                            child: Text(
                              'Delete',
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                        ];
                      },
                      icon: const Icon(
                        Icons.more_vert,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 250),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: 12,
                              height: 12,
                              decoration: BoxDecoration(
                                color: detailProvider.isActive == true
                                    ? Colors.green
                                    : Colors.red,
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              context.watch<StoreDetailProvider>().isActive ==
                                      true
                                  ? 'Active'
                                  : 'Inactive',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          detailStore.name,
                          style: const TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 26,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on_outlined,
                              color: Colors.black,
                              size: 20,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              detailStore.location,
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(
                              Icons.schedule_outlined,
                              color: Colors.black,
                              size: 20,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'Open ${detailStore.openAt.split(':').take(2).join(':')} - ${detailStore.closeAt.split(':').take(2).join(':')}',
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        DefaultTabController(
                          length: 2,
                          child: Column(
                            children: <Widget>[
                              Container(
                                width: double.infinity,
                                height: 40,
                                padding: const EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color(0xFF3B59BA),
                                      Color(0xFF354A98)
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                  ),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: TabBar(
                                  controller: _tabController,
                                  indicatorSize: TabBarIndicatorSize.tab,
                                  indicator: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: Colors.white,
                                  ),
                                  dividerHeight: 0,
                                  labelStyle: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                  labelColor: const Color(0xFF354A98),
                                  unselectedLabelColor: Colors.white,
                                  tabs: const [
                                    TabItem(title: 'Detail'),
                                    TabItem(title: 'Report'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          child: ContentSizeTabBarView(
                            controller: _tabController,
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              _buildDetail(
                                detailStore,
                                detailProvider,
                                commodityProvider,
                                serviceProvider,
                                reviewProvider,
                              ),
                              _buildReport(detailStore),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildDetail(
    DetailStore detailStore,
    StoreDetailProvider detailProvider,
    CommodityProvider commodityProvider,
    ServiceProvider serviceProvider,
    ReviewProvider reviewProvider,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Description',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        const SizedBox(height: 4),
        Text(
          detailStore.description,
          textAlign: TextAlign.justify,
        ),
        const SizedBox(height: 12),
        _buildServiceSection(detailStore, serviceProvider),
        const SizedBox(height: 12),
        _buildEmployeeSection(detailStore, detailProvider),
        const SizedBox(height: 12),
        _buildRatingSection(detailStore, reviewProvider),
        const SizedBox(height: 12),
        _buildCommoditySection(detailStore, commodityProvider),
      ],
    );
  }

  Widget _buildReport(DetailStore detailStore) {
    List<double> weeklyData = [];
    for (int i = 0; i < 7; i++) {
      weeklyData.add(Random().nextInt(90) + 10);
    }
    List<int> dates = [];
    DateTime now = DateTime.now().subtract(const Duration(days: 1));
    for (int i = 6; i >= 0; i--) {
      DateTime date = now.subtract(Duration(days: i));
      dates.add(date.day);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildStatisticSection(weeklyData, dates),
        _buildHistorySection(),
      ],
    );
  }

  Widget _buildServiceSection(
      DetailStore detailStore, ServiceProvider serviceProvider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Services',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            TextButton(
              onPressed: () {
                context.goNamed(
                  'more_service',
                  pathParameters: {'id': widget.id},
                );
              },
              child: const Text(
                'see more',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        _buildListService(detailStore, serviceProvider),
      ],
    );
  }

  Widget _buildListService(
      DetailStore detailStore, ServiceProvider serviceProvider) {
    if (serviceProvider.services.isEmpty) {
      return const Center(child: Text('No services found'));
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: serviceProvider.services.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8, right: 16, left: 16),
          child: Row(
            children: [
              Image.network(
                '${ApiService.baseUrl}/${serviceProvider.services[index].image}',
                width: 16,
                height: 16,
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 8),
              Text(serviceProvider.services[index].name),
              const Spacer(),
              Text(
                NumberFormat.currency(
                  locale: 'id',
                  symbol: 'Rp ',
                  decimalDigits: 0,
                ).format(serviceProvider.services[index].price),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildEmployeeSection(
      DetailStore detailStore, StoreDetailProvider detailProvider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Employee',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            TextButton(
              onPressed: () {
                context.goNamed(
                  'more_employee',
                  pathParameters: {'id': widget.id},
                );
              },
              child: const Text(
                'see more',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        _buildListEmployee(detailStore, detailProvider),
        Center(
            child: detailProvider.employees.length > 3
                ? Text(
                    'and ${detailProvider.employees.length - 3} more employees',
                    style: const TextStyle(color: Colors.grey),
                  )
                : const SizedBox()),
      ],
    );
  }

  Widget _buildListEmployee(
      DetailStore detailStore, StoreDetailProvider detailProvider) {
    if (detailProvider.employees.isEmpty) {
      return const Center(child: Text('No employees found'));
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: detailProvider.employees.length,
      itemBuilder: (context, index) {
        return ListTile(
            title: Text(detailProvider.employees[index].name),
            leading: CircleAvatar(
              radius: 20,
              backgroundImage:
                  Image.network(detailProvider.employees[index].avatar).image,
            ));
      },
    );
  }

  Widget _buildRatingSection(
      DetailStore detailStore, ReviewProvider reviewProvider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Rating',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            TextButton(
              onPressed: () {
                context.goNamed(
                  'more_review',
                  pathParameters: {'id': widget.id},
                );
              },
              child: const Text(
                'see more',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(
              Icons.star_rounded,
              color: Colors.yellow,
              size: 55,
            ),
            Text.rich(
              TextSpan(
                text: reviewProvider.averageRating.toString(),
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(
                    text: '/5 (${reviewProvider.totalReview} Reviews)',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        _buildItemReview(reviewProvider),
      ],
    );
  }

  Widget _buildItemReview(ReviewProvider reviewProvider) {
    if (reviewProvider.reviews.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Text('No reviews found'),
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundImage: Image.network(
                  reviewProvider.reviews[0].avatar,
                ).image,
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    reviewProvider.reviews[0].username,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    DateFormat('dd MMM yyyy').format(
                      DateTime.parse(reviewProvider.reviews[0].date.toString()),
                    ),
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              RatingBar.builder(
                initialRating: reviewProvider.reviews[0].rating!.toDouble(),
                itemCount: 5,
                glow: false,
                itemSize: 20,
                ignoreGestures: true,
                itemBuilder: (context, index) =>
                    const Icon(Icons.star_rounded, color: Colors.amber),
                onRatingUpdate: (value) {},
              ),
            ],
          ),
          reviewProvider.reviews[0].comment != null
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    Text(
                      reviewProvider.reviews[0].comment!,
                      style: const TextStyle(
                        fontSize: 16,
                        overflow: TextOverflow.ellipsis,
                      ),
                      textAlign: TextAlign.justify,
                      maxLines: 4,
                    ),
                  ],
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }

  Widget _buildCommoditySection(
      DetailStore detailStore, CommodityProvider commodityProvider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Commodity',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            TextButton(
              onPressed: () {
                context.goNamed(
                  'more_commodity',
                  pathParameters: {'id': widget.id},
                );
              },
              child: const Text(
                'see more',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        SizedBox(
          height: 150,
          child: _buildListCommodity(detailStore, commodityProvider),
        ),
      ],
    );
  }

  Widget _buildListCommodity(
      DetailStore detailStore, CommodityProvider commodityProvider) {
    if (commodityProvider.commodities.isEmpty) {
      return const Center(child: Text('No Commodities found'));
    }

    return ListView.builder(
      shrinkWrap: true,
      itemCount: commodityProvider.commodities.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(right: 8),
          child: InkWell(
            onTap: () {
              context.goNamed('detail_commodity_2', pathParameters: {
                'id': widget.id,
                'commodityId': commodityProvider.commodities[index].id,
              });
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    '${ApiService.baseUrl}/${commodityProvider.commodities[index].image}',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  commodityProvider.commodities[index].name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 2,
                ),
                Text(
                  'stock : ${commodityProvider.commodities[index].stock}',
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildStatisticSection(List<double> weeklyData, List<int> dates) {
    return InkWell(
      onTap: () {
        context.goNamed('detail_statistic', pathParameters: {'id': widget.id});
      },
      child: Container(
        width: double.infinity,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          color: const Color.fromARGB(255, 242, 246, 252),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        '${DateFormat('dd MMM').format(DateTime.now().subtract(const Duration(days: 7)))} - Yesterday',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.black),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: SizedBox(
                              child: MyBarGraph(
                                weeklyData: weeklyData,
                                weeklyDate: dates,
                                onTapedBar: (event, response, index, _) {
                                  if (response != null &&
                                      response.spot != null &&
                                      event is FlTapUpEvent) {
                                    final x = response.spot!.touchedBarGroup.x;
                                    final y = response.spot!.touchedRodData.toY;

                                    if (index == x) {
                                      debugPrint('x: $x');
                                      debugPrint('y: $y');
                                    }
                                  }
                                },
                                onPressed: false,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(width: 16),
              const Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Total Income',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Rp 1.000.000',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Total Order',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    '1000',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHistorySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Order History',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'see more',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        const ListTile(
          title: Text('Joe Bambang'),
          leading: Icon(Icons.abc),
        ),
      ],
    );
  }
}
