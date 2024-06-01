import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tugas_akhir_app/data/api/api_service.dart';
import 'package:tugas_akhir_app/data/local/auth_repository.dart';
import 'package:tugas_akhir_app/provider/payslip_detail_provider.dart';
import 'package:tugas_akhir_app/screen/widgets/text_field.dart';

class DetailPayslipScreen extends StatefulWidget {
  const DetailPayslipScreen({super.key, required this.id});

  final String id;

  @override
  State<DetailPayslipScreen> createState() => _DetailPayslipScreenState();
}

class _DetailPayslipScreenState extends State<DetailPayslipScreen> {
  final _scrollController = ScrollController();
  final _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DetailPayslipProvider>(
      create: (context) => DetailPayslipProvider(
        apiService: ApiService(),
        authRepository: AuthRepository(),
        id: widget.id,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Detail Payslip'),
        ),
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return Consumer<DetailPayslipProvider>(
      builder: (context, provider, child) {
        final state = provider.loadingState;

        return state.when(
          initial: () => const Center(
            child: CircularProgressIndicator(),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          loaded: () => _buildDetail(provider),
          error: (e) => Center(
            child: Text(e.toString()),
          ),
        );
      },
    );
  }

  Widget _buildDetail(DetailPayslipProvider provider) {
    return Stack(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(bottom: 80, top: 16, left: 16, right: 16),
          child: CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: Image.network(
                                  provider.detailPayslipResponse!.data.avatar)
                              .image,
                        ),
                        const SizedBox(width: 24),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              provider.detailPayslipResponse!.data.employeeName,
                              style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF354A98)),
                            ),
                            const Text('Employee'),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Date',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    CustomTextField(
                      controller: _dateController,
                      enabled: false,
                      prefixIcon: const Icon(Icons.calendar_month),
                      text: DateFormat('dd MMMM yyyy').format(
                        provider.detailPayslipResponse!.data.date,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Earnings',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final earning =
                        provider.detailPayslipResponse!.data.earnings[index];
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(earning.name!),
                              Text(
                                NumberFormat.currency(
                                  locale: 'id',
                                  symbol: 'Rp ',
                                  decimalDigits: 0,
                                ).format(earning.amount),
                              ),
                            ],
                          ),
                        ),
                        const Divider(
                          height: 1,
                        ),
                      ],
                    );
                  },
                  childCount:
                      provider.detailPayslipResponse!.data.earnings.length,
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total Earnings',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        NumberFormat.currency(
                          locale: 'id',
                          symbol: 'Rp ',
                          decimalDigits: 0,
                        ).format(provider.totalEarning),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(height: 16),
              ),
              const SliverToBoxAdapter(
                child: Text(
                  'Deductions',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final deduction =
                        provider.detailPayslipResponse!.data.deductions[index];
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(deduction.name!),
                              Text(
                                NumberFormat.currency(
                                  locale: 'id',
                                  symbol: '- Rp ',
                                  decimalDigits: 0,
                                ).format(deduction.amount),
                              ),
                            ],
                          ),
                        ),
                        const Divider(
                          height: 1,
                        ),
                      ],
                    );
                  },
                  childCount:
                      provider.detailPayslipResponse!.data.deductions.length,
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total Deductions',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        NumberFormat.currency(
                          locale: 'id',
                          symbol: '- Rp ',
                          decimalDigits: 0,
                        ).format(provider.totalDeduction),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(height: 16),
              ),
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Attachment',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 8),
                    provider.detailPayslipResponse!.data.attachment != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              '${ApiService.baseUrl}/${provider.detailPayslipResponse!.data.attachment}',
                              height: 200,
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                          )
                        : Container(
                            height: 200,
                            width: 100,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: const EdgeInsets.all(32),
            color: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Total',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  NumberFormat.currency(
                    locale: 'id',
                    symbol: 'Rp ',
                    decimalDigits: 0,
                  ).format(provider.detailPayslipResponse!.data.total),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
