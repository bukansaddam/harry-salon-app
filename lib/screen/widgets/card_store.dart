import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tugas_akhir_app/model/store.dart';
import 'package:tugas_akhir_app/provider/store_provider.dart';

class StoreCard extends StatelessWidget {
  final List<Store> stores;
  final StoreProvider storeProvider;
  final int count;

  const StoreCard(
      {super.key,
      required this.stores,
      required this.storeProvider,
      required this.count});

  @override
  Widget build(BuildContext context) {
    double aspectRatio = 1.2;
    if (count == 2) {
      aspectRatio = 1.2;
    } else if (count == 3) {
      aspectRatio = 1.3;
    } else if (count == 4) {
      aspectRatio = 1.4;
    }

    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: count,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: aspectRatio,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          if (index == stores.length && storeProvider.pageItems != null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final store = stores[index];
          return InkWell(
            onTap: () {
              context.goNamed(
                'detail_store',
                pathParameters: {'id': store.id},
              );
            },
            child: Container(
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: store.isActive
                      ? [const Color(0xFF3B59BA), const Color(0xFF354A98)]
                      : [
                          const Color.fromARGB(255, 33, 41, 74),
                          const Color.fromARGB(255, 33, 41, 74)
                        ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(13),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          store.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          store.location,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: const Color(0xFFB23745),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.people,
                                color: Colors.white,
                                size: 16,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                store.totalEmployees.toString(),
                                style: const TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
        childCount: stores.length + (storeProvider.pageItems != null ? 1 : 0),
      ),
    );
  }
}
