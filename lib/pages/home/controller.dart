import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  HomeController();

  // _initData() {
  //   update(["home"]);
  // }

  // void onTap() {}

  // // @override
  // // void onInit() {
  // //   super.onInit();
  // // }

  // @override
  // void onReady() {
  //   super.onReady();
  //   _initData();
  // }

  // // @override
  // // void onClose() {
  // //   super.onClose();
  // // }

  var qizi = <QiziModel>[
    // QiziModel(140, 140, "black"),
    // QiziModel(140, 160, "white"),
  ];

  bool win = false;

  String winDetail = "";

  void addRandom(Offset offset) {
    // print(offset.dx % 20);
    // print(offset.dy % 20);
    double calcDx = 0;
    double calcDy = 0;
    String role = qizi.length % 2 == 0 ? "black" : "white";

    if (offset.dx % 20 >= 10) {
      calcDx = offset.dx - (offset.dx % 20) + 20;
    } else if (offset.dx % 20 < 10) {
      calcDx = offset.dx - (offset.dx % 20);
    } else {
      return;
    }

    if (offset.dy % 20 >= 10) {
      calcDy = offset.dy - (offset.dy % 20) + 20;
    } else if (offset.dy % 20 < 10) {
      calcDy = offset.dy - (offset.dy % 20);
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
      bool topLeft = _hasRole(calcDx - 20 * i, calcDy - 20 * i, role);
      if (!topLeft) {
        break;
      }
      if (i == 4) {
        return true;
      }
    }

    for (var i = 1; i < 5; i++) {
      bool top = _hasRole(calcDx, calcDy - 20 * i, role);
      if (!top) {
        break;
      }
      if (i == 4) {
        return true;
      }
    }

    for (var i = 1; i < 5; i++) {
      bool topRight = _hasRole(calcDx + 20 * i, calcDy - 20 * i, role);
      if (!topRight) {
        break;
      }
      if (i == 4) {
        return true;
      }
    }

    for (var i = 1; i < 5; i++) {
      bool left = _hasRole(calcDx - 20 * i, calcDy, role);
      if (!left) {
        break;
      }
      if (i == 4) {
        return true;
      }
    }

    for (var i = 1; i < 5; i++) {
      bool right = _hasRole(calcDx + 20 * i, calcDy, role);
      if (!right) {
        break;
      }
      if (i == 4) {
        return true;
      }
    }

    for (var i = 1; i < 5; i++) {
      bool bottomLeft = _hasRole(calcDx - 20 * i, calcDy + 20 * i, role);
      if (!bottomLeft) {
        break;
      }
      if (i == 4) {
        return true;
      }
    }

    for (var i = 1; i < 5; i++) {
      bool bottom = _hasRole(calcDx, calcDy + 20 * i, role);
      if (!bottom) {
        break;
      }
      if (i == 4) {
        return true;
      }
    }

    for (var i = 1; i < 5; i++) {
      bool bottomRight = _hasRole(calcDx + 20 * i, calcDy + 20 * i, role);
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
