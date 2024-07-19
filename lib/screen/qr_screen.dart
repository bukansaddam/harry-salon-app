import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:tugas_akhir_app/provider/presence_provider.dart';

class QrScreen extends StatefulWidget {
  const QrScreen({super.key, required this.storeId, required this.title});

  final String storeId;
  final String title;

  @override
  State<QrScreen> createState() => _QrScreenState();
}

class _QrScreenState extends State<QrScreen> {
  PresenceProvider? presenceProvider;
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    presenceProvider = context.read<PresenceProvider>();

    Future.microtask(() async {
      _timer = Timer.periodic(const Duration(seconds: 15), (timer) {
        presenceProvider!.getQrCode(storeId: widget.storeId);
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Consumer<PresenceProvider>(
          builder: (context, provider, child) {
            final state = provider.loadingState;
            final data = provider.qrCodeResponse;
            return state.when(
              initial: () => const Center(child: CircularProgressIndicator()),
              loading: () => const Center(child: CircularProgressIndicator()),
              loaded: () {
                return QrImageView(data: data!.token, size: 500);
              },
              error: (error) => Center(child: Text(error.toString())),
            );
          },
        ),
      ),
    );
  }
}
