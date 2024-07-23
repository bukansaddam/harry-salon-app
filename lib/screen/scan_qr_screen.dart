import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScanQrScreen extends StatelessWidget {
  const ScanQrScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MobileScanner(
      controller: MobileScannerController(
        autoStart: true,
        detectionSpeed: DetectionSpeed.noDuplicates,
        returnImage: true,
      ),
      onDetect: (barcodes) {
        final List<Barcode> barcode = barcodes.barcodes;
        debugPrint('Barcode detected: ${barcode[0].rawValue}');
        if (barcode.isNotEmpty) {
          context.pop(barcode[0].rawValue);
        }
      },
    );
  }
}
