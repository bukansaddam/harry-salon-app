import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tugas_akhir_app/data/api/api_service.dart';
import 'package:tugas_akhir_app/provider/review_provider.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key, required this.storeId});

  final String storeId;

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  final _searchController = TextEditingController();
  final _scrollController = ScrollController();
  Timer? _debounce;
  int? _value;
  bool isSelected = false;

  @override
  void initState() {
    super.initState();
    final employeeProvider = context.read<ReviewProvider>();

    _value = 0;

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (employeeProvider.pageItems != null) {
          employeeProvider.getAllReview(storeId: widget.storeId);
        }
      }
    });

    Future.microtask(() async {
      employeeProvider.refreshReview(storeId: widget.storeId);
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 1000), () {
      context
          .read<ReviewProvider>()
          .refreshReview(storeId: widget.storeId, searchValue: query);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('More Review'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            LayoutBuilder(
              builder: (context, constraints) {
                return Wrap(
                  spacing: 8,
                  children: List<Widget>.generate(
                    6,
                    (index) {
                      if (index == 0) {
                        return ChoiceChip(
                          label: const Text(
                            'All',
                          ),
                          selected: _value == index,
                          labelStyle: TextStyle(
                            color:
                                _value == index ? Colors.white : Colors.black,
                            fontSize: 16,
                          ),
                          labelPadding:
                              const EdgeInsets.symmetric(horizontal: 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          side: BorderSide(
                            width: 1.5,
                            color: _value == index
                                ? Colors.transparent
                                : const Color(0xFF3B59BA),
                          ),
                          showCheckmark: false,
                          backgroundColor: Colors.white,
                          selectedColor: const Color(0xFF3B59BA),
                          selectedShadowColor: Colors.transparent,
                          onSelected: (bool selected) {
                            setState(() {
                              _value = selected ? index : null;
                              _onSearchChanged('');
                            });
                          },
                        );
                      }
                      return SizedBox(
                        width: constraints.maxWidth / 6 - 8,
                        child: ChoiceChip(
                          label: Text(
                            '$index',
                          ),
                          selected: _value == index,
                          avatar: Icon(
                            Icons.star_rounded,
                            color:
                                _value == index ? Colors.white : Colors.amber,
                          ),
                          labelStyle: TextStyle(
                            color:
                                _value == index ? Colors.white : Colors.black,
                            fontSize: 16,
                          ),
                          labelPadding: const EdgeInsets.only(right: 4),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          side: BorderSide(
                            width: 1.5,
                            color: _value == index
                                ? Colors.transparent
                                : const Color(0xFF3B59BA),
                          ),
                          showCheckmark: false,
                          backgroundColor: Colors.white,
                          selectedColor: const Color(0xFF3B59BA),
                          selectedShadowColor: Colors.transparent,
                          onSelected: (bool selected) {
                            setState(() {
                              _value = selected ? index : null;
                              _onSearchChanged(_value.toString());
                            });
                          },
                        ),
                      );
                    },
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            Expanded(
              child: _buildList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildList() {
    return Consumer<ReviewProvider>(
      builder: (context, provider, _) {
        final state = provider.loadingState;
        return state.when(
          initial: () {
            return const SizedBox.shrink();
          },
          loading: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
          loaded: () {
            return ListView.builder(
              controller: _scrollController,
              itemCount: provider.reviews.length +
                  (provider.pageItems != null ? 1 : 0),
              itemBuilder: (context, index) {
                if (index == provider.reviews.length &&
                    provider.pageItems != null) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                final employee = provider.reviews[index];
                return Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 24,
                                backgroundImage: employee.avatar
                                        .contains('http')
                                    ? Image.network(employee.avatar).image
                                    : Image.asset(
                                            '${ApiService.baseUrl}/${employee.avatar}')
                                        .image,
                              ),
                              const SizedBox(width: 8),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    employee.username,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    DateFormat('dd MMM yyyy').format(
                                      DateTime.parse(employee.date.toString()),
                                    ),
                                    style: const TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              RatingBar.builder(
                                initialRating: employee.rating!.toDouble(),
                                itemCount: 5,
                                glow: false,
                                itemSize: 20,
                                ignoreGestures: true,
                                itemBuilder: (context, index) => const Icon(
                                    Icons.star_rounded,
                                    color: Colors.amber),
                                onRatingUpdate: (value) {},
                              ),
                            ],
                          ),
                          employee.comment != null
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 8),
                                    Text(
                                      employee.comment!,
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                      textAlign: TextAlign.justify,
                                      maxLines: 4,
                                    ),
                                  ],
                                )
                              : const SizedBox.shrink(),
                        ],
                      ),
                    ),
                    const Divider(),
                  ],
                );
              },
            );
          },
          error: (e) {
            return Center(
              child: Text(e.toString()),
            );
          },
        );
      },
    );
  }
}
