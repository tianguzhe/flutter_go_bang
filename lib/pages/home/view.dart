import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  final double canvasSize = 300;

  Future<bool?> showDeleteDialog(context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("提示"),
          content: Text(controller.winDetail),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("取消"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
                controller.nextGame();
              },
              child: const Text("再来一局", style: TextStyle(color: Colors.red)),
            ),
          ],
        );

        // return Center(
        //   child: Container(height: 200, width: 200, color: Colors.red),
        // );
      },
    );
  }

  // 主视图
  Widget _buildView() {
    return Center(
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
                  if (!controller.win) controller.addRandom(e.localPosition);
                  if (controller.win) showDeleteDialog(context);
                },
                child: CustomPaint(
                  size: Size(
                    canvasSize,
                    canvasSize,
                  ),
                  painter: MyQiZiPainter(),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      id: "home",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("home")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}

class MyQiPanPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var rect = Offset.zero & size;
    debugPrint("paint: ${rect}");

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
  @override
  void paint(Canvas canvas, Size size) {
    var rect = Offset.zero & size;

    drawPieces(canvas, rect);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  void drawPieces(Canvas canvas, Rect rect) {
    double eWidth = rect.width / 15;
    double eHeight = rect.height / 15;

    var controller = Get.find<HomeController>();

    var blackPaint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.black;

    var whitePaint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.white;

    // canvas.drawCircle(
    //     Offset(rect.center.dx - eWidth / 2, rect.center.dy - eHeight / 2),
    //     min(eWidth / 2, eHeight / 2) - 2,
    //     paint);

    // debugPrint(
    //     "dx  ${rect.center.dx - eWidth / 2}, dy ${rect.center.dy - eHeight / 2} ");

    // paint.color = Colors.white;

    // canvas.drawCircle(
    //     Offset(rect.center.dx + eWidth / 2, rect.center.dy - eHeight / 2),
    //     min(eWidth / 2, eHeight / 2) - 2,
    //     paint);

    for (var i = 0; i < controller.qizi.length; i++) {
      var qizi = controller.qizi[i];

      if (qizi.role == "black") {
        canvas.drawCircle(
          Offset(qizi.dx, qizi.dy),
          min(eWidth / 2, eHeight / 2) - 2,
          blackPaint,
        );
      } else {
        canvas.drawCircle(
          Offset(qizi.dx, qizi.dy),
          min(eWidth / 2, eHeight / 2) - 2,
          whitePaint,
        );
      }
    }
  }
}
