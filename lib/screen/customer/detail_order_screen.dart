import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:slide_countdown/slide_countdown.dart';
import 'package:tugas_akhir_app/data/api/api_service.dart';
import 'package:tugas_akhir_app/data/local/auth_repository.dart';
import 'package:tugas_akhir_app/model/hairstyle.dart';
import 'package:tugas_akhir_app/provider/order_detail_provider.dart';
import 'package:tugas_akhir_app/provider/order_provider.dart';
import 'package:tugas_akhir_app/screen/widgets/button.dart';
import 'package:tugas_akhir_app/screen/widgets/card_hairstyle.dart';

class DetailOrderScreen extends StatefulWidget {
  const DetailOrderScreen({super.key, required this.id});

  final String id;

  @override
  State<DetailOrderScreen> createState() => _DetailOrderScreenState();
}

class _DetailOrderScreenState extends State<DetailOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DetailOrderProvider>(
      create: (context) => DetailOrderProvider(
        apiService: ApiService(),
        authRepository: AuthRepository(),
        id: widget.id,
      ),
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Detail Order'),
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
                        await detailProvider.getDetailOrder(id: widget.id);
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
                                            'Anda masih sedang berada dalam antrian. Mohon tunggu',
                                        time: true,
                                      ),
                                  waiting: () => _buildBody(
                                        provider: detailProvider,
                                        title: 'Pesanan Anda Dikonfirmasi',
                                        message:
                                            'Silahkan datang ke toko dan lakukan konfirmasi kehadiran sebelum waktu yang ditentukan',
                                        countdown: true,
                                      ),
                                  onProcress: () => _buildBody(
                                        provider: detailProvider,
                                        title: 'Giliran Anda',
                                        message:
                                            'Selamat menikmati pelayanan kami',
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
                      child: context.watch<DetailOrderProvider>().isOnLocation
                          ? const SizedBox()
                          : _buildButton(detailProvider),
                    ),
                  ],
                ),
                error: (message) => Center(
                  child: Text(message),
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildBody({
    required DetailOrderProvider provider,
    required String title,
    required String message,
    bool time = false,
    bool countdown = false,
  }) {
    final status = provider.orderState;
    final order = provider.detailOrderResponse!.data;
    final reference = order.reference != null
        ? Hairstyle.fromJson(order.reference!.toJson())
        : null;
    final orderNumber = context.watch<OrderProvider>().waitingTime;
    final DateTime targetTime = order.endTime;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: status.when(
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
                        await context.read<OrderProvider>().updateStatusOrder(
                              id: widget.id,
                              status: 'delay',
                            );
                        await provider.getDetailOrder(id: widget.id);
                      },
                    )
                  : const SizedBox(),
              time
                  ? Text(
                      orderNumber == 0
                          ? 'Segera datang ke toko'
                          : orderNumber > 60
                              ? '${orderNumber ~/ 60} Jam'
                              : '$orderNumber Menit',
                      style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    )
                  : const SizedBox(),
              Text(
                order.id,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
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
        const SizedBox(height: 4),
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
                ],
              )
            : provider.detailOrderResponse!.data.employeeAvatar != null
                ? const SizedBox()
                : const SizedBox(height: 350),
        const SizedBox(height: 12),
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
                  reference != null
                      ? const SizedBox()
                      : const SizedBox(height: 300),
                ],
              )
            : const SizedBox(
                height: 100,
              ),
      ],
    );
  }

  Widget _buildButton(DetailOrderProvider detailProvider) {
    return CustomButton(
      function: () {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Konfirmasi'),
                content: const Text(
                    'Apakah Anda yakin ingin mengonfirmasi kedatangan?'),
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
                        await context.read<OrderProvider>().updateStatusOrder(
                              id: widget.id,
                              isOnLocation: true,
                            );
                        await detailProvider.updateLocation();
                        await detailProvider.getDetailOrder(id: widget.id);
                      }
                    },
                    child: const Text('Ya'),
                  ),
                ],
              );
            });
      },
      text: "Confirm Attendance",
    );
  }
}
