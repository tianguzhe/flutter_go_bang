import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_bang/common/models/go_band_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  final double canvasSize = 300;

  Future<bool?> showDeleteDialog(context, WidgetRef ref) {
    final winInfo = ref.watch(winInfoProvider);

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("提示"),
          content: Text(winInfo),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("取消"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
                ref.read(gobandViewModelProvider.notifier).nextGame();
              },
              child: const Text(
                "再来一局",
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isWin = ref.watch(isWinProvider);
    final list = ref.watch(gobandViewModelProvider);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (isWin) {
        showDeleteDialog(context, ref);
      }
    });

    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            RepaintBoundary(
              child: CustomPaint(
                size: Size(canvasSize, canvasSize),
                painter: MyQiPanPainter(),
              ),
            ),
            Positioned(
              child: Builder(builder: (context) {
                return GestureDetector(
                  onPanDown: (e) {
                    if (!isWin) {
                      ref
                          .read(gobandViewModelProvider.notifier)
                          .addNextSetp(e.localPosition);
                    } else {
                      showDeleteDialog(context, ref);
                    }
                  },
                  child: CustomPaint(
                    size: Size(canvasSize, canvasSize),
                    painter: MyQiZiPainter(list),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

class MyQiPanPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var rect = Offset.zero & size;
    debugPrint("paint: $rect");

    drawChessboard(canvas, rect);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

  void drawChessboard(Canvas canvas, Rect rect) {
    var paint = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill
      ..color = const Color(0xFFDCC48C);
    canvas.drawRect(rect, paint);

    paint
      ..style = PaintingStyle.stroke
      ..color = Colors.black38
      ..strokeWidth = 1.0;

    for (var i = 0; i <= 15; i++) {
      double dy = rect.top + rect.height / 15 * i;
      canvas.drawLine(Offset(rect.left, dy), Offset(rect.right, dy), paint);
    }

    for (var i = 0; i <= 15; i++) {
      double dx = rect.left + rect.height / 15 * i;
      canvas.drawLine(Offset(dx, rect.top), Offset(dx, rect.bottom), paint);
    }
  }
}

class MyQiZiPainter extends CustomPainter {
  final List<GoBand> list;
  MyQiZiPainter(this.list);

  @override
  void paint(Canvas canvas, Size size) {
    var rect = Offset.zero & size;

    drawPieces(canvas, rect, list);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  void drawPieces(Canvas canvas, Rect rect, List<GoBand> list) {
    double eWidth = rect.width / 15;
    double eHeight = rect.height / 15;

    var paint = Paint()..style = PaintingStyle.fill;

    for (var i = 0; i < list.length; i++) {
      var qizi = list[i];

      if (qizi.role == "black") {
        canvas.drawCircle(
          Offset(qizi.dx, qizi.dy),
          min(eWidth / 2, eHeight / 2) - 2,
          paint..color = Colors.black,
        );
      } else {
        canvas.drawCircle(
          Offset(qizi.dx, qizi.dy),
          min(eWidth / 2, eHeight / 2) - 2,
          paint..color = Colors.white,
        );
      }
    }
  }
}
