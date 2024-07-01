import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:slide_countdown/slide_countdown.dart';
import 'package:tugas_akhir_app/common/order_state.dart';
import 'package:tugas_akhir_app/data/api/api_service.dart';
import 'package:tugas_akhir_app/data/local/auth_repository.dart';
import 'package:tugas_akhir_app/model/hairstyle.dart';
import 'package:tugas_akhir_app/provider/order_detail_provider.dart';
import 'package:tugas_akhir_app/provider/order_provider.dart';
import 'package:tugas_akhir_app/screen/widgets/button.dart';
import 'package:tugas_akhir_app/screen/widgets/card_hairstyle.dart';

class EmployeeDetailOrderScreen extends StatefulWidget {
  const EmployeeDetailOrderScreen({super.key, required this.orderId});

  final String orderId;

  @override
  State<EmployeeDetailOrderScreen> createState() =>
      _EmployeeDetailOrderScreenState();
}

class _EmployeeDetailOrderScreenState extends State<EmployeeDetailOrderScreen> {
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
              final currentTask = context.read<OrderProvider>().currentTask;
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
                                        title: 'Menunggu Konfirmasi',
                                        message:
                                            'Menunggu konfirmasi dari toko',
                                      ),
                                  pending: () => _buildBody(
                                      provider: detailProvider,
                                      title: 'Menunggu Konfirmasi',
                                      message:
                                          'Anda masih sedang berada dalam antrian. Mohon tunggu'),
                                  waiting: () => _buildBody(
                                        provider: detailProvider,
                                        title: 'Menunggu Pelanggan',
                                        message:
                                            'Tunggu sampai pelanggan datang',
                                        countdown: true,
                                      ),
                                  onProcress: () => _buildBody(
                                        provider: detailProvider,
                                        title: 'Diproses',
                                        message:
                                            'Selesaikan pengerjaanmu sekarang',
                                      ),
                                  done: () => _buildBody(
                                        provider: detailProvider,
                                        title: 'Selesai',
                                        message: 'Pengerjaan selesai',
                                      ),
                                  canceled: () => _buildBody(
                                        provider: detailProvider,
                                        title: 'Dibatalkan',
                                        message: 'Pengerjaan dibatalkan',
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
                    Positioned(
                      bottom: 40,
                      left: 16,
                      right: 16,
                      child: detailProvider.orderState.when(
                        initial: () => const SizedBox(),
                        pending: () => currentTask == null ||
                                currentTask.status == 'done'
                            ? _buildButton(
                                detailProvider: detailProvider,
                                title: 'Accept Order',
                                function: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: const Text('Konfirmasi'),
                                          content: const Text(
                                              'Apakah Anda yakin ingin menerima pesanan ?'),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                context.pop();
                                              },
                                              child: const Text('Tidak'),
                                            ),
                                            TextButton(
                                              onPressed: () async {
                                                if (mounted) {
                                                  context.pop();
                                                  await context
                                                      .read<OrderProvider>()
                                                      .updateStatusOrder(
                                                        id: widget.orderId,
                                                        isAccepted: true,
                                                      );
                                                  await detailProvider
                                                      .getDetailOrder(
                                                          id: widget.orderId);
                                                }
                                              },
                                              child: const Text('Ya'),
                                            ),
                                          ],
                                        );
                                      });
                                })
                            : const SizedBox(),
                        waiting: () => const SizedBox(),
                        onProcress: () => _buildButton(
                          detailProvider: detailProvider,
                          title: 'Finish Order',
                          function: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text('Konfirmasi'),
                                    content: const Text(
                                        'Apakah Anda yakin ingin menyelesaikan pesanan ?'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          context.pop();
                                        },
                                        child: const Text('Tidak'),
                                      ),
                                      TextButton(
                                        onPressed: () async {
                                          if (mounted) {
                                            context.pop();
                                            await context
                                                .read<OrderProvider>()
                                                .updateStatusOrder(
                                                  id: widget.orderId,
                                                  status: 'done',
                                                );
                                            await detailProvider.getDetailOrder(
                                                id: widget.orderId);
                                          }
                                        },
                                        child: const Text('Ya'),
                                      ),
                                    ],
                                  );
                                });
                          },
                        ),
                        done: () => const SizedBox(),
                        canceled: () => const SizedBox(),
                        error: (message) => const SizedBox(),
                      ),
                    ),
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

  Widget _buildBody(
      {required DetailOrderProvider provider,
      required String title,
      required String message,
      bool countdown = false}) {
    final order = provider.detailOrderResponse!.data;
    final reference = order.reference != null
        ? Hairstyle.fromJson(order.reference!.toJson())
        : null;
    final orderState = provider.orderState;
    final DateTime targetTime = order.endTime;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        orderState != const OrderState.pending()
            ? Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: orderState.when(
                          initial: () => Colors.black,
                          pending: () => Colors.yellow[500],
                          waiting: () => Colors.green,
                          onProcress: () => Colors.green,
                          done: () => Colors.green,
                          canceled: () => Colors.red,
                          error: (message) => Colors.red,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        message,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    countdown
                        ? SlideCountdown(
                            duration: targetTime.difference(DateTime.now()),
                            slideDirection: SlideDirection.up,
                            decoration: BoxDecoration(
                              color: const Color(0xFFB23745),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            onDone: () async {
                              await context
                                  .read<OrderProvider>()
                                  .updateStatusOrder(
                                    id: widget.orderId,
                                    status: 'delay',
                                  );
                              await provider.getDetailOrder(id: widget.orderId);
                            },
                          )
                        : const SizedBox(),
                    Text(
                      order.id,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              )
            : const SizedBox.shrink(),
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
                  const SizedBox(height: 160),
                ],
              )
            : const SizedBox(height: 500),
      ],
    );
  }

  Widget _buildButton(
      {required DetailOrderProvider detailProvider,
      required String title,
      required Function() function}) {
    return CustomButton(
      function: function,
      text: title,
    );
  }
}
