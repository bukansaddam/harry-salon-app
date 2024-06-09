import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tugas_akhir_app/data/api/api_service.dart';
import 'package:tugas_akhir_app/data/local/auth_repository.dart';
import 'package:tugas_akhir_app/model/user.dart';
import 'package:tugas_akhir_app/provider/commodity_provider.dart';
import 'package:tugas_akhir_app/screen/widgets/card_task.dart';
import 'package:tugas_akhir_app/screen/widgets/timeline_tile.dart';

class DashboardEmployeeScreen extends StatefulWidget {
  const DashboardEmployeeScreen({super.key});

  @override
  State<DashboardEmployeeScreen> createState() =>
      _DashboardEmployeeScreenState();
}

class _DashboardEmployeeScreenState extends State<DashboardEmployeeScreen> {
  final _scrollController = ScrollController();
  CommodityProvider? commodityProvider;
  bool _isDataFetched = false;
  AuthRepository auth = AuthRepository();
  User? user;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!_isDataFetched) {
      commodityProvider = Provider.of<CommodityProvider>(context);

      Future.microtask(() async {
        user = await auth.getUser();
        if (user != null) {
          commodityProvider!.refreshCommodity(storeId: user!.storeId!);
        }
      });

      _isDataFetched = true;
    }
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverToBoxAdapter(
            child: _buildUpcomingTasksSection(),
          ),
          const SliverToBoxAdapter(
              child: SizedBox(
            height: 16,
          )),
          SliverToBoxAdapter(
            child: _buildCurrentTasksSection(),
          ),
          const SliverToBoxAdapter(
              child: SizedBox(
            height: 16,
          )),
          SliverToBoxAdapter(
            child: Consumer<CommodityProvider>(
              builder: (context, commodityProvider, child) {
                final state = commodityProvider.loadingState;
                return state.when(
                  initial: () => const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      Text(
                        'Commodity',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Center(child: CircularProgressIndicator()),
                    ],
                  ),
                  loading: () => const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      Text(
                        'Commodity',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Center(child: CircularProgressIndicator()),
                    ],
                  ),
                  loaded: () => _buildCommoditySection(commodityProvider),
                  error: (error) => Text(error.toString()),
                );
              },
            ),
          ),
          const SliverToBoxAdapter(
              child: SizedBox(
            height: 24,
          )),
        ],
      ),
    );
  }

  Widget _buildUpcomingTasksSection() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Upcoming Tasks',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            TextButton(
              onPressed: () {
                // do something
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
        const CardTasks(),
      ],
    );
  }

  Widget _buildCurrentTasksSection() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Current Tasks',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        MyTimelineTile(
          start: false,
          end: true,
          title: "Waiting for customer confirmation",
          description: "5 minutes remaining",
        ),
        MyTimelineTile(
          start: true,
          end: true,
          title: "On Process",
          description: "Potong Rambut",
          enabled: false,
        ),
        MyTimelineTile(
          start: true,
          end: true,
          title: "Done",
          description: "Rp. 100.000",
          enabled: false,
        )
      ],
    );
  }

  Widget _buildCommoditySection(CommodityProvider commodityProvider) {
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
                  extra: user!.storeId,
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
          child: _buildListCommodity(commodityProvider),
        ),
      ],
    );
  }

  Widget _buildListCommodity(CommodityProvider commodityProvider) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: commodityProvider.commodities.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(right: 8),
          child: InkWell(
            onTap: () {
              //do something
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
}
