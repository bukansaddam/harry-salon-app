import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas_akhir_app/model/commodity_history.dart';
import 'package:tugas_akhir_app/provider/commodity_provider.dart';

class CommodityHistoryScreen extends StatefulWidget {
  const CommodityHistoryScreen({super.key, required this.storeId});

  final String storeId;

  @override
  State<CommodityHistoryScreen> createState() => _CommodityHistoryScreenState();
}

class _CommodityHistoryScreenState extends State<CommodityHistoryScreen> {
  CommodityProvider? historyProvider;

  @override
  void initState() {
    super.initState();

    historyProvider = Provider.of<CommodityProvider>(context, listen: false);

    Future.microtask(() async {
      historyProvider!.refreshCommodityHistory(storeId: widget.storeId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Commodity History'),
      ),
      body: Consumer<CommodityProvider>(
        builder: (context, historyProvider, child) {
          final state = historyProvider.historyLoadingState;
          return state.when(
            initial: () => const Center(child: CircularProgressIndicator()),
            loading: () => const Center(child: CircularProgressIndicator()),
            loaded: () {
              final histories = historyProvider.commodityHistories;
              return _buildList(histories, historyProvider);
            },
            error: (error) => Center(child: Text(error.toString())),
          );
        },
      ),
    );
  }

  Widget _buildList(
      List<CommodityHistory> histories, CommodityProvider historyProvider) {
    return histories.isEmpty
        ? const Center(child: Text('No history found'))
        : ListView.builder(
            itemCount: histories.length,
            itemBuilder: (context, index) {
              final history = histories[index];
              return Column(
                children: [
                  ListTile(
                    title: Text(history.description.contains('increased')
                        ? 'Increased'
                        : history.description.contains('decreased')
                            ? 'Decreased'
                            : history.description.contains('name')
                                ? 'Change Name'
                                : history.description.contains('category')
                                    ? 'Change Category'
                                    : 'Change Image'),
                    subtitle: Text(history.description),
                  ),
                  const Divider(
                    indent: 16,
                    endIndent: 16,
                  ),
                ],
              );
            },
          );
  }
}
