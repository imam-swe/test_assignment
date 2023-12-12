import 'package:akij_assignment/views/qr_code/qr_code_result.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRScanScreen extends StatefulWidget {
  const QRScanScreen({super.key});

  @override
  _QRScanScreenState createState() => _QRScanScreenState();
}

class _QRScanScreenState extends State<QRScanScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  late QRViewController controller;
  bool scanSuccess = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Code Scanner'),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          _buildQrView(context),
          if (scanSuccess) _buildResultButton(),
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        if (!scanSuccess) {
          scanSuccess = true;
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ResultScreen(scanResult: scanData.code),
            ),
          );
        }
      });
    });
  }

  Widget _buildResultButton() {
    return Positioned(
      bottom: 20,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            scanSuccess = false;
          });
          controller.resumeCamera();
        },
        child: const Text('Scan Again'),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}