import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';
import 'package:tugas_akhir_app/model/detail_user.dart';
import 'package:tugas_akhir_app/model/store.dart';
import 'package:tugas_akhir_app/provider/hairstyle_provider.dart';
import 'package:tugas_akhir_app/provider/order_provider.dart';
import 'package:tugas_akhir_app/provider/store_provider.dart';
import 'package:tugas_akhir_app/provider/user_provider.dart';
import 'package:tugas_akhir_app/screen/widgets/button.dart';
import 'package:tugas_akhir_app/screen/widgets/card_hairstyle.dart';
import 'package:tugas_akhir_app/screen/widgets/text_field.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:tugas_akhir_app/screen/widgets/toast_message.dart';

class HomepageCustomerScreen extends StatefulWidget {
  const HomepageCustomerScreen({super.key});

  @override
  State<HomepageCustomerScreen> createState() => _HomepageCustomerScreenState();
}

class _HomepageCustomerScreenState extends State<HomepageCustomerScreen>
    with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  bool _isExpanded = true;
  static const kExpandedHeight = 190.0;
  Store? dropdownValue;

  final _locationController = TextEditingController();

  late AnimationController _animationController;
  late Animation<BorderRadius?> _borderRadiusAnimation;

  late UserProvider userProvider;
  late StoreProvider storeProvider;
  late OrderProvider orderProvider;

  LatLng? locationData;
  LatLng currentLocation = const LatLng(0, 0);

  geo.Placemark? placemark;

  @override
  void initState() {
    super.initState();
    final hairstyleProvider = context.read<HairstyleProvider>();
    userProvider = context.read<UserProvider>();
    storeProvider = context.read<StoreProvider>();
    orderProvider = context.read<OrderProvider>();

    Future.microtask(() async {
      await hairstyleProvider.refreshHairstyle();
      await userProvider.getDetailUser();
      await storeProvider.refreshStore();
      await orderProvider.refreshOrder();
      if (mounted && storeProvider.storesCustomer.isNotEmpty) {
        setState(() {
          dropdownValue = storeProvider.storesCustomer.isNotEmpty
              ? storeProvider.storesCustomer.first
              : null;
          _locationController.text =
              "${storeProvider.storesCustomer.first.name}, ${storeProvider.storesCustomer.first.location}";
        });
      }
    });

    initAnimation();

    getMyLocation();

    _scrollController.addListener(() {
      final offset = _scrollController.offset;
      const maxOffset = kExpandedHeight - kToolbarHeight;

      double value = (offset / maxOffset).clamp(0.0, 1.0);
      _animationController.value = value;

      setState(() {
        _isExpanded = _scrollController.hasClients && offset < maxOffset;
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _animationController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  void initAnimation() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _borderRadiusAnimation = BorderRadiusTween(
      begin: const BorderRadius.vertical(
        bottom: Radius.circular(20),
      ),
      end: const BorderRadius.vertical(
        bottom: Radius.circular(0),
      ),
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  void getMyLocation() async {
    late bool serviceEnabled;
    late PermissionStatus permissionGranted;
    final Location location = Location();

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        debugPrint("Location services are not available");
        return;
      }
    }
    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        debugPrint("Location permission not granted");
        return;
      }
    }

    final locationDataResult = await location.getLocation();
    final latLng =
        LatLng(locationDataResult.latitude!, locationDataResult.longitude!);

    if (mounted) {
      setState(() {
        currentLocation = latLng;
        locationData = latLng;
      });
    }
  }

  double calculateDistance(
      storeLatitude, storeLongitude, userLatitude, userLongitude) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((userLatitude - storeLatitude) * p) / 2 +
        c(storeLatitude * p) *
            c(userLatitude * p) *
            (1 - c((userLongitude - storeLongitude) * p)) /
            2;
    var radiusOfEarth = 6371;
    return radiusOfEarth * 2 * asin(sqrt(a));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer4<UserProvider, HairstyleProvider, StoreProvider,
          OrderProvider>(
        builder: (context, userProvider, hairstyleProvider, storeProvider,
            orderProvider, child) {
          return _buildBody(context, userProvider, hairstyleProvider,
              storeProvider, orderProvider);
        },
      ),
    );
  }

  Widget _buildBody(
      BuildContext context,
      UserProvider userProvider,
      HairstyleProvider hairstyleProvider,
      StoreProvider storeProvider,
      OrderProvider orderProvider) {
    final state = hairstyleProvider.loadingState;
    return RefreshIndicator(
      onRefresh: () async {
        await storeProvider.refreshStore();
        await hairstyleProvider.refreshHairstyle();
        await orderProvider.refreshOrder();
      },
      child: CustomScrollView(
        controller: _scrollController,
        slivers: [
          _buildAppBar(context, userProvider, orderProvider),
          _buildCurrentActivitySection(orderProvider),
          SliverToBoxAdapter(
            child: state.when(
              initial: () => const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: Text(
                      'Popular Hairstyle',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  Center(child: CircularProgressIndicator()),
                ],
              ),
              loading: () => const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: Text(
                      'Popular Hairstyle',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  SizedBox(height: 10),
                  Center(child: CircularProgressIndicator()),
                ],
              ),
              loaded: () => _buildHairstyleSection(hairstyleProvider),
              error: (error) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  const Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: Text(
                      'Popular Hairstyle',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 100,
                    child: Center(
                      child: Text(
                        error.toString(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar(BuildContext context, UserProvider userProvider,
      OrderProvider orderProvider) {
    return SliverAppBar(
      title: AnimatedOpacity(
        opacity: _isExpanded ? 0.0 : 1.0,
        duration: const Duration(milliseconds: 150),
        child: const Text(
          'Harry Salon',
          style: TextStyle(color: Colors.white),
        ),
      ),
      pinned: true,
      expandedHeight: kExpandedHeight,
      flexibleSpace: AnimatedBuilder(
        animation: _borderRadiusAnimation,
        builder: (context, child) {
          return ClipRRect(
            borderRadius: _borderRadiusAnimation.value!,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF3B59BA),
                    Color(0xFF354A98),
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: _buildContentAppBar(
                  context, userProvider, storeProvider, orderProvider),
            ),
          );
        },
      ),
    );
  }

  Widget _buildContentAppBar(BuildContext context, UserProvider userProvider,
      StoreProvider storeProvider, OrderProvider orderProvider) {
    final state = userProvider.loadingState;
    final user = userProvider.userDetailResponse?.data;
    return FlexibleSpaceBar(
      collapseMode: CollapseMode.parallax,
      background: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              state.when(
                initial: () => _buildProfileSection(),
                loading: () => _buildProfileSection(),
                loaded: () {
                  return _buildProfileSection(user: user);
                },
                error: (e) => _buildProfileSection(),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () => user == null
                          ? ToastMessage.show(context, 'Please login first')
                          : _buildBottomSheet(context, storeProvider),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            bottomLeft: Radius.circular(15),
                          ),
                          color: Colors.grey[200],
                        ),
                        child: SizedBox(
                          height: 56,
                          child: CustomTextField(
                            text: 'Choose Location',
                            controller: _locationController,
                            suffixIcon: const Icon(Icons.arrow_drop_down),
                            enabled: false,
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      if (orderProvider.currentTaskCustomer != null) {
                        ToastMessage.show(context, 'You already ordered');
                      } else if (dropdownValue != null) {
                        context.goNamed('order', extra: dropdownValue);
                      } else if (user == null) {
                        ToastMessage.show(context, 'Please login first');
                      } else {
                        ToastMessage.show(
                            context, 'Please choose location first');
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 56,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 4),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        ),
                        color: Colors.blue[500],
                      ),
                      child: const Row(
                        children: [
                          Text(
                            'Order',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 8),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 16,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCurrentActivitySection(OrderProvider orderProvider) {
    final state = orderProvider.loadingState;

    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Current Activity',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 12),
            state.when(
              initial: () => Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
              loading: () => Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
              loaded: () {
                final myOrder = orderProvider.currentTaskCustomer;
                final waitingTime = orderProvider.waitingTime;
                if (myOrder == null || myOrder.status == 'done') {
                  return const SizedBox(
                    height: 100,
                    child: Center(
                      child: Text(
                        'You don\'t have any order right now',
                      ),
                    ),
                  );
                } else {
                  return Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey[200],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on,
                              size: 16,
                            ),
                            const SizedBox(width: 4),
                            Flexible(
                              child: Text(
                                '${myOrder.storeName}, ${myOrder.storeLocation}',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          myOrder.serviceName,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        const SizedBox(height: 8),
                        Text(myOrder.description),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(
                              Icons.attach_file,
                              size: 16,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              myOrder.reference != null
                                  ? '1 references'
                                  : 'No reference',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Waiting estimate'),
                            Text(waitingTime == 0
                                ? 'Now'
                                : waitingTime > 60
                                    ? '${waitingTime ~/ 60} h'
                                    : '$waitingTime min'),
                          ],
                        ),
                        const SizedBox(height: 8),
                        CustomButton(
                          function: () {
                            context.goNamed('detail_order',
                                pathParameters: {'id': myOrder.id},
                                extra: 'Detail Order');
                          },
                          text: 'Detail',
                          height: 35,
                          radius: 5,
                          gradient: false,
                        ),
                      ],
                    ),
                  );
                }
              },
              error: (e) => Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                child: Center(
                  child: Text(e),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildHairstyleSection(HairstyleProvider provider) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Popular Hairstyle',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              TextButton(
                onPressed: () {
                  context.goNamed('more_hairstyle');
                },
                child: const Text(
                  'see more',
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          StaggeredGrid.count(
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
          )
        ],
      ),
    );
  }

  Widget _buildProfileSection({
    DetailUser? user,
  }) {
    final isLoggedIn = user != null;
    return Row(
      children: [
        isLoggedIn
            ? CircleAvatar(
                radius: 25,
                backgroundImage: Image.network(
                  user.avatar,
                ).image,
              )
            : const Icon(Icons.person, color: Colors.white, size: 30),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Hi there,',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                )),
            isLoggedIn
                ? Text(
                    user.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                : const Text(
                    'Annonymous',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )
          ],
        ),
      ],
    );
  }

  Future<void> _buildBottomSheet(
      BuildContext context, StoreProvider storeProvider) {
    final state = storeProvider.loadingState;
    return showModalBottomSheet<void>(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return SizedBox(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 16),
                child: Row(
                  children: [
                    const Expanded(
                      child: Center(
                        child: Text(
                          'Select Location',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        context.pop();
                      },
                      icon: const Icon(Icons.close, size: 20),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: state.when(
                    initial: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    loaded: () => ListView.builder(
                      itemCount: storeProvider.storesCustomer.length,
                      itemBuilder: (context, index) {
                        final store = storeProvider.storesCustomer[index];
                        return _buildItemStore(store);
                      },
                    ),
                    error: (error) => Center(child: Text(error)),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildItemStore(Store store) {
    final radius = calculateDistance(store.latitude, store.longitude,
        currentLocation.latitude, currentLocation.longitude);

    String distance = '';

    if (radius * 1000 < 1000) {
      distance = '${(radius * 1000).round()} m';
    } else {
      distance = '${radius.toStringAsFixed(1)} km';
    }
    return InkWell(
      onTap: () {
        setState(() {
          dropdownValue = store;
          _locationController.text = '${store.name}, ${store.location}';
        });
        context.pop();
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: store == dropdownValue
              ? Border.all(color: Colors.blue, width: 2)
              : null,
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 20,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                color: Colors.blue[100],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  child: Text(
                    distance,
                    style: TextStyle(
                      color: Colors.blue[700],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                store.name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                store.location,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 16),
              InkWell(
                onTap: () {
                  context.goNamed('detail_store',
                      pathParameters: {'id': store.id});
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Detail',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(width: 8),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 14,
                      color: Colors.blue,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
