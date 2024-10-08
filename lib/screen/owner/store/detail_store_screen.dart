import 'dart:async';
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
import 'package:tugas_akhir_app/model/order_history.dart';
import 'package:tugas_akhir_app/provider/commodity_provider.dart';
import 'package:tugas_akhir_app/provider/order_history_provider.dart';
import 'package:tugas_akhir_app/provider/review_provider.dart';
import 'package:tugas_akhir_app/provider/service_provider.dart';
import 'package:tugas_akhir_app/provider/store_detail_provider.dart';
import 'package:tugas_akhir_app/provider/store_provider.dart';
import 'package:tugas_akhir_app/screen/widgets/bar_graph/bar_graph.dart';
import 'package:tugas_akhir_app/screen/widgets/button.dart';
import 'package:tugas_akhir_app/screen/widgets/card_history.dart';
import 'package:tugas_akhir_app/screen/widgets/tab_item.dart';
import 'package:tugas_akhir_app/screen/widgets/text_field.dart';
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
  final _reviewDescriptionController = TextEditingController();

  CommodityProvider? commodityProvider;
  ServiceProvider? serviceProvider;
  ReviewProvider? reviewProvider;
  OrderHistoryProvider? orderHistoryProvider;
  bool _isDataFetched = false;

  final actor = const String.fromEnvironment('actor', defaultValue: 'customer');

  bool get isOwner => actor == 'owner';
  bool get isCustomer => actor == 'customer';

  DateTime now = DateTime.now();
  DateTime weekAgo = DateTime.now().subtract(const Duration(days: 6));

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!_isDataFetched) {
      if (isOwner) commodityProvider = Provider.of<CommodityProvider>(context);
      serviceProvider = context.read<ServiceProvider>();
      reviewProvider = context.read<ReviewProvider>();
      orderHistoryProvider = context.read<OrderHistoryProvider>();

      Future.microtask(() {
        if (isOwner) commodityProvider!.refreshCommodity(storeId: widget.id);
        serviceProvider!.refreshService(storeId: widget.id);
        reviewProvider!.refreshReview(storeId: widget.id);
        orderHistoryProvider!.refreshOrderHistory(
          storeId: widget.id,
          dateStart: weekAgo.toString(),
          dateEnd: now.toString(),
        );
      });

      _isDataFetched = true;
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    _reviewDescriptionController.dispose();
    super.dispose();
  }

  void _onSelected(BuildContext context, value, DetailStore detailStore) {
    switch (value) {
      case 'Edit':
        context.goNamed(
          'edit_store',
          pathParameters: {'id': widget.id},
          extra: detailStore,
        );
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
                    context.read<StoreDetailProvider>().activateStore();
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
        showDialog(
          context: context,
          builder: (_) {
            return AlertDialog(
              title: const Text('Delete Store'),
              content: const Text('Are you sure to delete this store?'),
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
                    Provider.of<StoreDetailProvider>(context, listen: false)
                        .deleteStore(id: detailStore.id)
                        .then((_) {
                      if (context
                          .read<StoreDetailProvider>()
                          .deleteResponse!
                          .success) {
                        context.read<StoreProvider>().refreshStore();
                        context.goNamed('home');
                        ToastMessage.show(context, 'Store Deleted');
                      }
                    }).catchError((error) {
                      ToastMessage.show(context, error);
                    });
                  },
                  child: const Text('Delete'),
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
    return ChangeNotifierProvider(
      create: (context) => StoreDetailProvider(
          authRepository: AuthRepository(),
          apiService: ApiService(),
          id: widget.id),
      child: Consumer5<StoreDetailProvider, ServiceProvider, StoreProvider,
          ReviewProvider, OrderHistoryProvider>(
        builder: (context, detailProvider, serviceProvider, storeProvider,
            reviewProvider, orderHistoryProvider, child) {
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
                serviceProvider,
                storeProvider,
                reviewProvider,
                orderHistoryProvider,
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
    ServiceProvider serviceProvider,
    StoreProvider storeProvider,
    ReviewProvider reviewProvider,
    OrderHistoryProvider orderHistoryProvider,
  ) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () {
          return Future.wait([
            detailProvider.getDetailStore(widget.id),
            reviewProvider.refreshReview(storeId: widget.id),
          ]);
        },
        child: Stack(
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
                            index.image,
                            fit: BoxFit.cover,
                          ));
                    },
                  );
                }).toList(),
                options: CarouselOptions(
                  aspectRatio: 1.2,
                  viewportFraction: 1,
                  autoPlay: detailStore.images.length > 1 ? true : false,
                  enableInfiniteScroll:
                      detailStore.images.length > 1 ? true : false,
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
                          isOwner ? storeProvider.refreshOwnerStore() : null;
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
                      isOwner
                          ? PopupMenuButton(
                              onSelected: (value) {
                                _onSelected(context, value, detailStore);
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
                            )
                          : const SizedBox(
                              width: 50,
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
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          isOwner
                              ? Row(
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
                                      context
                                                  .watch<StoreDetailProvider>()
                                                  .isActive ==
                                              true
                                          ? 'Active'
                                          : 'Inactive',
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                )
                              : const SizedBox.shrink(),
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
                          isOwner
                              ? _buildTab(
                                  detailStore,
                                  detailProvider,
                                  serviceProvider,
                                  reviewProvider,
                                  orderHistoryProvider,
                                )
                              : _buildCustomerSection(
                                  detailStore,
                                  serviceProvider,
                                  reviewProvider,
                                  detailProvider),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTab(
      DetailStore detailStore,
      StoreDetailProvider detailProvider,
      ServiceProvider serviceProvider,
      ReviewProvider reviewProvider,
      OrderHistoryProvider orderHistoryProvider) {
    return Column(
      children: [
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
                    colors: [Color(0xFF3B59BA), Color(0xFF354A98)],
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
                serviceProvider,
                reviewProvider,
              ),
              _buildReport(
                detailStore,
                orderHistoryProvider,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDetail(
    DetailStore detailStore,
    StoreDetailProvider detailProvider,
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
        _buildRatingSection(detailStore, reviewProvider, detailProvider),
        const SizedBox(height: 12),
        isOwner
            ? Consumer<CommodityProvider>(
                builder: (context, commodityProvider, child) {
                  return _buildCommoditySection(detailStore, commodityProvider);
                },
              )
            : const SizedBox.shrink(),
      ],
    );
  }

  Widget _buildReport(
      DetailStore detailStore, OrderHistoryProvider orderHistoryProvider) {
    final weeklyData = orderHistoryProvider.weeklyData;
    final dates = orderHistoryProvider.dates;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildStatisticSection(weeklyData, dates, orderHistoryProvider),
        const SizedBox(height: 16),
        _buildHistorySection(orderHistoryProvider),
      ],
    );
  }

  Widget _buildServiceSection(
      DetailStore detailStore, ServiceProvider serviceProvider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: isOwner
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.start,
          children: [
            const Text(
              'Services',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            isOwner
                ? TextButton(
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
                  )
                : const SizedBox.shrink(),
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
                serviceProvider.services[index].image,
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

  Widget _buildRatingSection(DetailStore detailStore,
      ReviewProvider reviewProvider, StoreDetailProvider detailProvider) {
    bool isMyReview = reviewProvider.reviews
        .any((element) => element.isMe && element.storeId == widget.id);
    debugPrint('isMyReview: $isMyReview');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isCustomer
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  const Text(
                    'Leave a review',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  GestureDetector(
                    onTap: () {
                      if (!isMyReview) {
                        buildBottomSheet(reviewProvider, detailProvider);
                      } else {
                        ToastMessage.show(context, 'You already left a review');
                      }
                    },
                    child: RatingBarIndicator(
                      rating:
                          isMyReview ? reviewProvider.myRating.toDouble() : 0,
                      itemBuilder: (context, index) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      itemCount: 5,
                      itemSize: 32,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 8),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              )
            : const SizedBox.shrink(),
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
              color: Colors.amber,
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
            ),
          ],
        ),
        _buildItemReview(reviewProvider),
      ],
    );
  }

  Future<void> buildBottomSheet(
      ReviewProvider reviewProvider, StoreDetailProvider detailProvider) {
    return showModalBottomSheet(
        useSafeArea: true,
        isScrollControlled: true,
        context: context,
        builder: (_) {
          return SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                Padding(
                    padding: const EdgeInsets.all(16),
                    child: _buildReviewSection(reviewProvider, detailProvider)),
              ],
            ),
          );
        });
  }

  Widget _buildReviewSection(
      ReviewProvider reviewProvider, StoreDetailProvider detailProvider) {
    int rating = 0;

    void handleSubmit() {
      if (rating == 0) {
        ToastMessage.show(context, 'Please select rating');
      } else {
        reviewProvider
            .createReview(
          storeId: widget.id,
          comment: _reviewDescriptionController.text,
          rating: rating,
        )
            .then((_) {
          if (reviewProvider.uploadResponse!.success) {
            context.pop();
            _reviewDescriptionController.clear();
            ToastMessage.show(context, 'Your review has been submitted');
            reviewProvider.refreshReview(storeId: widget.id);
            detailProvider.getDetailStore(widget.id);
          } else {
            ToastMessage.show(context, reviewProvider.uploadResponse!.message);
          }
        }).catchError((error) {
          ToastMessage.show(context, error.toString());
        });
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
          child: Stack(
            children: [
              const Center(
                child: Text(
                  "Add Review",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Positioned(
                right: 0,
                child: GestureDetector(
                    onTap: () {
                      context.pop();
                      _reviewDescriptionController.clear();
                    },
                    child: const Icon(Icons.close)),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'Rate your experience',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        const SizedBox(height: 12),
        Center(
          child: RatingBar.builder(
            initialRating: 0,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: false,
            glow: false,
            itemCount: 5,
            itemSize: 36,
            itemPadding: const EdgeInsets.symmetric(horizontal: 8),
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (value) {
              rating = value.toInt();
            },
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'Write a review',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        const SizedBox(height: 12),
        CustomTextField(
          controller: _reviewDescriptionController,
          hintText: 'Enter your review here',
          minLines: 4,
          labelText: 'Review',
        ),
        const SizedBox(height: 40),
        reviewProvider.loadingState.when(
          initial: () => CustomButton(
            text: 'Submit',
            function: handleSubmit,
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          loaded: () => CustomButton(
            text: 'Submit',
            function: handleSubmit,
          ),
          error: (error) => CustomButton(
            text: 'Submit',
            function: handleSubmit,
          ),
        ),
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
                backgroundImage:
                    Image.network(reviewProvider.reviews[0].avatar).image,
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
              RatingBarIndicator(
                rating: reviewProvider.reviews[0].rating!.toDouble(),
                itemBuilder: (context, index) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                itemCount: 5,
                itemSize: 20,
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
                    commodityProvider.commodities[index].image,
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
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
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

  Widget _buildStatisticSection(List<double> weeklyData, List<int> dates,
      OrderHistoryProvider orderHistoryProvider) {
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
                        '${DateFormat('dd MMM').format(DateTime.now().subtract(const Duration(days: 6)))} - Today',
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
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Total Income',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    NumberFormat.currency(
                      locale: 'id',
                      symbol: 'Rp ',
                      decimalDigits: 0,
                    ).format(orderHistoryProvider.totalIncome),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Total Order',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    orderHistoryProvider.totalOrder.toString(),
                    style: const TextStyle(
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

  Widget _buildHistorySection(OrderHistoryProvider orderHistoryProvider) {
    final state = orderHistoryProvider.loadingState;
    final data = orderHistoryProvider.orderHistories;
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
              onPressed: () {
                context
                    .goNamed('more_history', pathParameters: {'id': widget.id});
              },
              child: const Text(
                'see more',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
        state.when(
          initial: () => const SizedBox(),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          loaded: () {
            if (data.isEmpty) {
              return const SizedBox(
                height: 100,
                child: Center(
                  child: Text('No order history found'),
                ),
              );
            }
            return _buildListHistory(data, orderHistoryProvider);
          },
          error: (e) => Text(e.toString()),
        ),
      ],
    );
  }

  Widget _buildCustomerSection(
    DetailStore detailStore,
    ServiceProvider serviceProvider,
    ReviewProvider reviewProvider,
    StoreDetailProvider detailProvider,
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
        _buildRatingSection(detailStore, reviewProvider, detailProvider)
      ],
    );
  }

  _buildListHistory(
      List<OrderHistory> data, OrderHistoryProvider orderHistoryProvider) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: min(data.length, 5),
      itemBuilder: (context, index) {
        return CardHistory(
            padding: false,
            history: data[index],
            onTap: () {
              context.goNamed('detail_order', pathParameters: {
                'id': widget.id,
                'orderId': data[index].orderId,
              });
            });
      },
    );
  }
}
