import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tugas_akhir_app/data/api/api_service.dart';
import 'package:tugas_akhir_app/data/local/auth_repository.dart';
import 'package:tugas_akhir_app/model/hairstyle.dart';
import 'package:tugas_akhir_app/provider/order_detail_provider.dart';
import 'package:tugas_akhir_app/screen/widgets/card_hairstyle.dart';

class OwnerDetailHistoryScreen extends StatefulWidget {
  const OwnerDetailHistoryScreen(
      {super.key, required this.storeId, required this.orderId});

  final String storeId;
  final String orderId;

  @override
  State<OwnerDetailHistoryScreen> createState() =>
      _OwnerDetailHistoryScreenState();
}

class _OwnerDetailHistoryScreenState extends State<OwnerDetailHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DetailOrderProvider>(
      create: (context) => DetailOrderProvider(
        apiService: ApiService(),
        authRepository: AuthRepository(),
        id: widget.orderId,
      ),
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Order Detail'),
          ),
          body: Consumer<DetailOrderProvider>(
            builder: (context, detailProvider, child) {
              final state = detailProvider.loadingState;
              return state.when(
                initial: () => const Center(
                  child: CircularProgressIndicator(),
                ),
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
                loaded: () => Stack(
                  children: [
                    RefreshIndicator(
                      onRefresh: () async {
                        await detailProvider.getDetailOrder(id: widget.orderId);
                      },
                      child: SingleChildScrollView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              detailProvider.orderState.when(
                                  initial: () => _buildBody(
                                        provider: detailProvider,
                                      ),
                                  pending: () => _buildBody(
                                        provider: detailProvider,
                                      ),
                                  waiting: () => _buildBody(
                                        provider: detailProvider,
                                      ),
                                  onProcress: () => _buildBody(
                                        provider: detailProvider,
                                      ),
                                  done: () => _buildBody(
                                        provider: detailProvider,
                                      ),
                                  canceled: () => _buildBody(
                                        provider: detailProvider,
                                      ),
                                  error: (message) => Center(
                                        child: Text(message),
                                      )),
                              const SizedBox(height: 100),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        color: Colors.white,
                        padding: const EdgeInsets.all(32),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text('No. Reference :'),
                            Text(widget.orderId)
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                error: (e) => Center(
                  child: Text(e.toString()),
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildBody({required DetailOrderProvider provider}) {
    final order = provider.detailOrderResponse!.data;
    final reference = order.reference != null
        ? Hairstyle.fromJson(order.reference!.toJson())
        : null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          title: Text(
            order.userName,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 12),
          leading: CircleAvatar(
            radius: 25,
            backgroundImage: order.employeeAvatar != null
                ? order.employeeAvatar!.contains('http')
                    ? NetworkImage(order.employeeAvatar!)
                    : NetworkImage(
                        '${ApiService.baseUrl}/${order.employeeAvatar}')
                : null,
          ),
          subtitle: Text(order.userPhone.toString()),
        ),
        const SizedBox(height: 16),
        const Text(
          'Detail',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                order.serviceName,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                  NumberFormat.currency(
                    locale: 'id',
                    symbol: 'Rp',
                    decimalDigits: 0,
                  ).format(order.servicePrice),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  )),
            ],
          ),
          subtitle: Text(order.description),
          contentPadding: const EdgeInsets.symmetric(horizontal: 12),
          leading: Container(
            width: 50,
            height: 50,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Image.network('${ApiService.baseUrl}/${order.serviceImage}',
                fit: BoxFit.cover),
          ),
        ),
        reference != null
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Reference',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: 200,
                    height: 300,
                    child: CardHairstyle(
                      hairstyle: reference,
                      onTap: () {
                        // do something
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              )
            : const SizedBox.shrink(),
        provider.detailOrderResponse!.data.employeeAvatar != null
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Handled By',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 8),
                  ListTile(
                    title: Text(order.employeeName!),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                    leading: CircleAvatar(
                      radius: 25,
                      backgroundImage: order.employeeAvatar != null
                          ? order.employeeAvatar!.contains('http')
                              ? NetworkImage(order.employeeAvatar!)
                              : NetworkImage(
                                  '${ApiService.baseUrl}/${order.employeeAvatar}')
                          : null,
                    ),
                  ),
                ],
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
