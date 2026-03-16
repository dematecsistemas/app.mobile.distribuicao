import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ScannerScreen extends StatefulWidget {
  const ScannerScreen({super.key});

  @override
  State<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  final MobileScannerController _scannerController = MobileScannerController();
  bool _hasScanned = false; // Flag para garantir que só leia o código 1 vez

  @override
  void dispose() {
    _scannerController.dispose();
    super.dispose();
  }

  void _onDetect(BarcodeCapture capture) {
    // Se já leu, ignora os próximos frames da câmera para não fechar a tela duas vezes
    if (_hasScanned) return;

    final barcode = capture.barcodes.firstOrNull;
    if (barcode != null && barcode.rawValue != null) {
      setState(() => _hasScanned = true);

      // Devolve o código lido para a tela anterior
      Navigator.pop(context, barcode.rawValue);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Pegamos a altura da tela para posicionar o texto perfeitamente acima do quadrado
    final screenHeight = MediaQuery.of(context).size.height;
    final cutoutSize = 280.0; // Tamanho do quadrado de leitura

    return Scaffold(
      backgroundColor:
          Colors.black, // Fundo preto enquanto a câmera não carrega
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            PhosphorIconsRegular.caretLeft,
            color: Colors.white,
            size: 28,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          // A CORREÇÃO ESTÁ AQUI:
          IconButton(
            icon: ValueListenableBuilder(
              // Agora escutamos o controlador inteiro
              valueListenable: _scannerController,
              builder: (context, state, child) {
                // E pegamos o torchState de dentro do estado atual da câmera
                final torchState = state.torchState;

                if (torchState == TorchState.on) {
                  return const Icon(
                    PhosphorIconsFill.flashlight,
                    color: Colors.yellow,
                  );
                }

                return const Icon(
                  PhosphorIconsRegular.flashlight,
                  color: Colors.white,
                );
              },
            ),
            onPressed: () => _scannerController.toggleTorch(),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Stack(
        children: [
          // 1. A Câmera no fundo
          MobileScanner(controller: _scannerController, onDetect: _onDetect),

          // 2. A Máscara Escura com o "Buraco" transparente
          Positioned.fill(
            child: CustomPaint(
              painter: _ScannerOverlayPainter(cutoutSize: cutoutSize),
            ),
          ),

          // 3. O Texto e Ícone acima do recorte
          Positioned(
            top: (screenHeight / 2) - (cutoutSize / 2) - 100,
            left: 0,
            right: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  PhosphorIconsRegular.camera,
                  color: Colors.white,
                  size: 28,
                ),
                const SizedBox(height: 16),
                const Text(
                  'Para fazer a busca, aponte a\ncâmera para o código.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// O segredo da tela! O CustomPainter desenha a tela toda preta com opacidade,
/// e recorta um buraco no meio usando Path.combine()
class _ScannerOverlayPainter extends CustomPainter {
  final double cutoutSize;

  _ScannerOverlayPainter({required this.cutoutSize});

  @override
  void paint(Canvas canvas, Size size) {
    final backgroundPaint = Paint()..color = Colors.black.withOpacity(0.85);

    final cutoutRect = Rect.fromCenter(
      center: Offset(size.width / 2, size.height / 2),
      width: cutoutSize,
      height: cutoutSize,
    );
    final cutoutRRect = RRect.fromRectAndRadius(
      cutoutRect,
      const Radius.circular(24),
    );

    final backgroundPath = Path()
      ..addRect(Rect.fromLTWH(0, 0, size.width, size.height));

    final cutoutPath = Path()..addRRect(cutoutRRect);

    final finalPath = Path.combine(
      PathOperation.difference,
      backgroundPath,
      cutoutPath,
    );

    canvas.drawPath(finalPath, backgroundPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
