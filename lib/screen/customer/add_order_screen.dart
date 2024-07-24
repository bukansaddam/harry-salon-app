import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tugas_akhir_app/model/hairstyle.dart';
import 'package:tugas_akhir_app/model/service.dart';
import 'package:tugas_akhir_app/model/store.dart';
import 'package:tugas_akhir_app/provider/hairstyle_provider.dart';
import 'package:tugas_akhir_app/provider/order_provider.dart';
import 'package:tugas_akhir_app/provider/service_provider.dart';
import 'package:tugas_akhir_app/screen/widgets/button.dart';
import 'package:tugas_akhir_app/screen/widgets/card_hairstyle.dart';
import 'package:tugas_akhir_app/screen/widgets/search_bar.dart';
import 'package:tugas_akhir_app/screen/widgets/text_field.dart';
import 'package:tugas_akhir_app/screen/widgets/toast_message.dart';

class AddOrderScreen extends StatefulWidget {
  const AddOrderScreen({super.key, required this.location});

  final Store location;

  @override
  State<AddOrderScreen> createState() => _AddOrderScreenState();
}

class _AddOrderScreenState extends State<AddOrderScreen> {
  final _descriptionController = TextEditingController();
  final _searchController = TextEditingController();
  final _scrollController = ScrollController();
  Timer? _debounce;
  String searchValue = '';

  final formKey = GlobalKey<FormState>();

  Service? dropdownValue;
  Hairstyle? referenceHairstyle;
  int totalPrice = 0;

  @override
  void initState() {
    super.initState();
    final hairstyleProvider = context.read<HairstyleProvider>();
    final serviceProvider = context.read<ServiceProvider>();
    final orderProvider = context.read<OrderProvider>();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (hairstyleProvider.pageItems != null) {
          hairstyleProvider.getAllHairstyle();
        }
      }
    });

    Future.microtask(() async {
      serviceProvider.refreshService(storeId: widget.location.id);
      await hairstyleProvider.refreshHairstyle(searchValue: searchValue);
      await orderProvider.getQueue(storeId: widget.location.id);
      if (mounted) {
        setState(() {
          dropdownValue = serviceProvider.services.isEmpty
              ? null
              : serviceProvider.services.first;
          totalPrice = (serviceProvider.services.isNotEmpty
              ? serviceProvider.services.first.price
              : 0)!;
        });
      }
    });
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    _searchController.dispose();
    _scrollController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 1000), () {
      context.read<HairstyleProvider>().refreshHairstyle(searchValue: query);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            const Text("Order"),
            Text(
              '${widget.location.name}, ${widget.location.location}',
              style:
                  const TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
            ),
          ],
        ),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Consumer3<ServiceProvider, HairstyleProvider, OrderProvider>(
      builder:
          (context, serviceProvider, hairstyleProvider, orderProvider, child) {
        final serviceState = serviceProvider.loadingState;
        return Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: SingleChildScrollView(
                  controller: _scrollController,
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Services*',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 4),
                        serviceState.when(
                          initial: () =>
                              _buildServices(serviceProvider: serviceProvider),
                          loading: () =>
                              _buildServices(serviceProvider: serviceProvider),
                          loaded: () {
                            if (dropdownValue == null &&
                                serviceProvider.services.isNotEmpty) {
                              dropdownValue = serviceProvider.services.first;
                            }
                            return _buildServices(
                                serviceProvider: serviceProvider,
                                isLoading: false);
                          },
                          error: (e) => _buildServices(error: e),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Description',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 4),
                        CustomTextField(
                          controller: _descriptionController,
                          hintText: 'Input order description here',
                          labelText: 'Description',
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Reference',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 4),
                        _buildImage(context, hairstyleProvider)
                      ],
                    ),
                  ),
                ),
              ),
            ),
            _buildTotal(orderProvider),
          ],
        );
      },
    );
  }

  Widget _buildServices(
      {ServiceProvider? serviceProvider,
      String? error,
      bool isLoading = true}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.grey[200],
      ),
      child: isLoading
          ? IgnorePointer(
              child: DropdownButton<String>(
                value: 'Choose Service',
                isExpanded: true,
                underline: const SizedBox(),
                items: const [
                  DropdownMenuItem<String>(
                    value: 'Choose Service',
                    child: Text('Choose Service'),
                  )
                ],
                onChanged: (_) {},
              ),
            )
          : DropdownButton<Service>(
              key: UniqueKey(),
              value: dropdownValue,
              isExpanded: true,
              underline: const SizedBox(),
              items: serviceProvider!.services.map((service) {
                return DropdownMenuItem<Service>(
                  value: service,
                  child: Text(service.name),
                );
              }).toList(),
              onChanged: (Service? newValue) {
                setState(() {
                  dropdownValue = newValue;
                  totalPrice = newValue!.price!;
                });
              },
            ),
    );
  }

  Widget _buildImage(
      BuildContext context, HairstyleProvider hairstyleProvider) {
    return referenceHairstyle != null
        ? Row(
            children: [
              SizedBox(
                width: 200,
                height: 300,
                child: CardHairstyle(
                  hairstyle: referenceHairstyle!,
                  onTap: () {
                    _buildBottomSheet(context, hairstyleProvider);
                  },
                ),
              ),
              const SizedBox(width: 16),
              InkWell(
                onTap: () => _buildBottomSheet(context, hairstyleProvider),
                child: ClipOval(
                    child: Container(
                  height: 80,
                  width: 80,
                  color: Colors.grey[200],
                  child: const Icon(
                    Icons.sync_rounded,
                    size: 60,
                    color: Color(0xFF3B59BA),
                  ),
                )),
              ),
            ],
          )
        : InkWell(
            onTap: () => _buildBottomSheet(context, hairstyleProvider),
            child: ClipOval(
              child: Container(
                height: 80,
                width: 80,
                color: Colors.grey[200],
                child: const Icon(
                  Icons.add_rounded,
                  size: 60,
                  color: Color(0xFF3B59BA),
                ),
              ),
            ),
          );
  }

  Future<void> _buildBottomSheet(
      BuildContext context, HairstyleProvider hairstyleProvider) {
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
                          'Select Hairstyle',
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
                child: _buildHairstyle(hairstyleProvider),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildHairstyle(HairstyleProvider hairstyleProvider) {
    final hairstyleState = hairstyleProvider.loadingState;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MySearchBar(
                searchController: _searchController,
                onChanged: (value) {
                  _onSearchChanged(value!);
                },
                hintText: 'Search hairstyle...',
              ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: hairstyleState.when(
              initial: () => const Center(
                child: CircularProgressIndicator(),
              ),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              loaded: () => _buildList(hairstyleProvider),
              error: (error) => Center(child: Text(error)),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildList(HairstyleProvider provider) {
    return SingleChildScrollView(
      child: StaggeredGrid.count(
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
                setState(() {
                  referenceHairstyle = hairstyle;
                });
                context.pop();
              },
              hairstyle: hairstyle,
            );
          },
        ),
      ),
    );
  }

  Widget _buildTotal(OrderProvider orderProvider) {
    final state = orderProvider.queueLoadingState;
    final queue = orderProvider.queue;
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 15,
            spreadRadius: 15,
          )
        ],
        color: Color(0xFFF6F7FC),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: 32,
          top: 16,
          left: 16,
          right: 16,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Total'),
                      Text(
                        NumberFormat.currency(
                          locale: 'id',
                          symbol: 'Rp ',
                          decimalDigits: 0,
                        ).format(totalPrice),
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Queue'),
                      state.when(
                        initial: () => const Text(
                          '-',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        loading: () => const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator()),
                        loaded: () => Text(
                          '${queue?.totalOrder ?? 0} (${queue?.totalDuration ?? 0} min)',
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        error: (error) => Text(
                          error,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 16),
            context.watch<OrderProvider>().loadingState.when(
                  initial: () => _submitOrder(),
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  loaded: () => _submitOrder(),
                  error: (error) => _submitOrder(),
                ),
          ],
        ),
      ),
    );
  }

  Widget _submitOrder() {
    return CustomButton(
        function: () async {
          final provider = context.read<OrderProvider>();

          if (totalPrice != 0 && formKey.currentState!.validate()) {
            await provider
                .createOrder(
              storeId: widget.location.id,
              serviceId: dropdownValue!.id,
              description: _descriptionController.text,
              hairstyleId: referenceHairstyle?.id,
            )
                .then((_) {
              if (provider.uploadResponse!.success) {
                context.goNamed(
                  'payment',
                  extra: provider.uploadResponse!.data,
                );
              } else {
                ToastMessage.show(context, provider.uploadResponse!.message);
              }
            }).catchError((e) {
              ToastMessage.show(context, e.toString());
            });

            // if (isSuccess && mounted) {
            //   provider.refreshOrder();
            //   ToastMessage.show(context, 'Order created');
            //   context.pop();
            // }
          }
        },
        text: 'Submit');
  }
}
