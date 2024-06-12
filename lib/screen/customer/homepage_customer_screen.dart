import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tugas_akhir_app/data/api/api_service.dart';
import 'package:tugas_akhir_app/model/detail_user.dart';
import 'package:tugas_akhir_app/provider/hairstyle_provider.dart';
import 'package:tugas_akhir_app/provider/user_provider.dart';
import 'package:tugas_akhir_app/screen/widgets/button.dart';
import 'package:tugas_akhir_app/screen/widgets/card_hairstyle.dart';

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
  String dropdownValue = 'Surabaya';

  late AnimationController _animationController;
  late Animation<BorderRadius?> _borderRadiusAnimation;

  late UserProvider userProvider;

  @override
  void initState() {
    super.initState();
    final hairstyleProvider = context.read<HairstyleProvider>();
    userProvider = Provider.of<UserProvider>(context, listen: false);

    Future.microtask(() async {
      hairstyleProvider.refreshHairstyle();
      userProvider.getDetailUser();
    });

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
    super.dispose();
  }

  final List<String> _locations = ['Surabaya', 'Sidoarjo', 'Gresik', 'Malang'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        _buildAppBar(context),
        _buildCurrentActivitySection(),
        SliverToBoxAdapter(
          child: Consumer<HairstyleProvider>(
            builder: (context, hairstyleProvider, child) {
              final state = hairstyleProvider.loadingState;

              return state.when(
                initial: () => const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.only(left: 16),
                      child: Text(
                        'Popular Hairstyle',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
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
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    SizedBox(height: 10),
                    Center(child: CircularProgressIndicator()),
                  ],
                ),
                loaded: () => _buildHairstyleSection(hairstyleProvider),
                error: (error) => Center(
                  child: Text(error),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildAppBar(BuildContext context) {
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
              child: _buildContentAppBar(context),
            ),
          );
        },
      ),
    );
  }

  Widget _buildContentAppBar(BuildContext context) {
    return FlexibleSpaceBar(
      collapseMode: CollapseMode.parallax,
      background: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Consumer<UserProvider>(
                builder: (context, provider, child) {
                  final state = provider.loadingState;
                  return state.when(
                    initial: () => _buildProfileSection(),
                    loading: () => _buildProfileSection(),
                    loaded: () {
                      final user = provider.userDetailResponse?.data;
                      return _buildProfileSection(user: user);
                    },
                    error: (e) => _buildProfileSection(),
                  );
                },
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          bottomLeft: Radius.circular(15),
                        ),
                        color: Colors.grey[200],
                      ),
                      child: DropdownButton<String>(
                        value: dropdownValue,
                        isExpanded: true,
                        underline: const SizedBox(),
                        items: _locations.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        },
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 56,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
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
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCurrentActivitySection() {
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
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey[200],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 16,
                      ),
                      SizedBox(width: 4),
                      Text('Surabaya'),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Potong Rambut',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  const Text('Description'),
                  const SizedBox(height: 8),
                  const Row(
                    children: [
                      Icon(
                        Icons.attach_file,
                        size: 16,
                      ),
                      SizedBox(width: 4),
                      Text('1 Reference',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Waiting estimate'),
                      Text('5 min'),
                    ],
                  ),
                  const SizedBox(height: 8),
                  CustomButton(
                    function: () {},
                    text: 'Detail',
                    height: 35,
                    radius: 5,
                    gradient: false,
                  ),
                ],
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
                  user.avatar.contains('http')
                      ? user.avatar
                      : '${ApiService.baseUrl}/${user.avatar}',
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
}
