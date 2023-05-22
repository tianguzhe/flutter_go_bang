import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final double canvasSize;
  late double oneSize;

  HomeController(this.canvasSize);

  _initData() {
    oneSize = canvasSize / 15;
    debugPrint("onesize $oneSize");
  }

  // void onTap() {}

  // // @override
  // // void onInit() {
  // //   super.onInit();
  // // }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  // // @override
  // // void onClose() {
  // //   super.onClose();
  // // }

  var qizi = <QiziModel>[];

  bool win = false;

  String winDetail = "";

  void addRandom(Offset offset) {
    double calcDx = 0;
    double calcDy = 0;
    String role = qizi.length % 2 == 0 ? "black" : "white";

    if (offset.dx % oneSize >= oneSize / 2) {
      calcDx = offset.dx - (offset.dx % oneSize) + oneSize;
    } else if (offset.dx % oneSize < oneSize / 2) {
      calcDx = offset.dx - (offset.dx % oneSize);
    } else {
      return;
    }

    if (offset.dy % oneSize >= oneSize / 2) {
      calcDy = offset.dy - (offset.dy % oneSize) + oneSize;
    } else if (offset.dy % oneSize < oneSize / 2) {
      calcDy = offset.dy - (offset.dy % oneSize);
    } else {
      return;
    }

    if (qizi
        .where((element) => element.dx == calcDx && element.dy == calcDy)
        .isNotEmpty) {
      return;
    }

    qizi.add(QiziModel(calcDx, calcDy, role));

    win = _calcWin(
      calcDx,
      calcDy,
      role,
    );

    winDetail = role == "black" ? "黑胜" : "白胜";

    update(["home"]);
  }

  void nextGame() {
    qizi = [];
    win = false;
    update(["home"]);
  }

  bool _calcWin(double calcDx, double calcDy, String role) {
    for (var i = 1; i < 5; i++) {
      bool topLeft = _hasRole(calcDx - oneSize * i, calcDy - oneSize * i, role);
      if (!topLeft) {
        break;
      }
      if (i == 4) {
        return true;
      }
    }

    for (var i = 1; i < 5; i++) {
      bool top = _hasRole(calcDx, calcDy - oneSize * i, role);
      if (!top) {
        break;
      }
      if (i == 4) {
        return true;
      }
    }

    for (var i = 1; i < 5; i++) {
      bool topRight =
          _hasRole(calcDx + oneSize * i, calcDy - oneSize * i, role);
      if (!topRight) {
        break;
      }
      if (i == 4) {
        return true;
      }
    }

    for (var i = 1; i < 5; i++) {
      bool left = _hasRole(calcDx - oneSize * i, calcDy, role);
      if (!left) {
        break;
      }
      if (i == 4) {
        return true;
      }
    }

    for (var i = 1; i < 5; i++) {
      bool right = _hasRole(calcDx + oneSize * i, calcDy, role);
      if (!right) {
        break;
      }
      if (i == 4) {
        return true;
      }
    }

    for (var i = 1; i < 5; i++) {
      bool bottomLeft =
          _hasRole(calcDx - oneSize * i, calcDy + oneSize * i, role);
      if (!bottomLeft) {
        break;
      }
      if (i == 4) {
        return true;
      }
    }

    for (var i = 1; i < 5; i++) {
      bool bottom = _hasRole(calcDx, calcDy + oneSize * i, role);
      if (!bottom) {
        break;
      }
      if (i == 4) {
        return true;
      }
    }

    for (var i = 1; i < 5; i++) {
      bool bottomRight =
          _hasRole(calcDx + oneSize * i, calcDy + oneSize * i, role);
      if (!bottomRight) {
        break;
      }
      if (i == 4) {
        return true;
      }
    }

    return false;
  }

  bool _hasRole(double calcDx, double calcDy, String role) {
    return qizi
        .where((element) =>
            element.dx == calcDx &&
            element.dy == calcDy &&
            element.role == role)
        .isNotEmpty;
  }
}

class QiziModel {
  final double dx;
  final double dy;
  final String role;

  QiziModel(this.dx, this.dy, this.role);
}
