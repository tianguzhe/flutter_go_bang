import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'go_band_model.freezed.dart';
part 'go_band_model.g.dart';

@freezed
class GoBand with _$GoBand {
  factory GoBand({
    required double dx,
    required double dy,
    required String role,
  }) = _GoBand;

  factory GoBand.fromJson(Map<String, Object?> json) => _$GoBandFromJson(json);
}

@riverpod
class GobandViewModel extends _$GobandViewModel {
  final oneSize = 20;

  @override
  List<GoBand> build() => [];

  addNextSetp(Offset offset) {
    double calcDx = 0;
    double calcDy = 0;
    String role = state.length % 2 == 0 ? "black" : "white";

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

    if (state
        .where((element) => element.dx == calcDx && element.dy == calcDy)
        .isNotEmpty) {
      return;
    }

    state = [...state, GoBand(dx: calcDx, dy: calcDy, role: role)];
  }

  nextGame() {
    state = [];
  }
}

@riverpod
String winInfo(WinInfoRef ref) {
  final isWin = ref.watch(isWinProvider);
  final gobandList = ref.watch(gobandViewModelProvider);

  if (isWin) {
    return gobandList.last.role == "black" ? "黑胜" : "白胜";
  } else {
    return "";
  }
}

@riverpod
bool isWin(IsWinRef ref) {
  final gobandList = ref.watch(gobandViewModelProvider);
  if (gobandList.isEmpty) return false;
  return _calcWin(gobandList);
}

bool _calcWin(List<GoBand> list) {
  const oneSize = 20;

  final lastBand = list.last;

  final calcDx = lastBand.dx;
  final calcDy = lastBand.dy;
  final role = lastBand.role;

  for (var i = 1; i < 5; i++) {
    bool topLeft =
        _hasRole(calcDx - oneSize * i, calcDy - oneSize * i, role, list);
    if (!topLeft) {
      break;
    }
    if (i == 4) {
      return true;
    }
  }

  for (var i = 1; i < 5; i++) {
    bool top = _hasRole(calcDx, calcDy - oneSize * i, role, list);
    if (!top) {
      break;
    }
    if (i == 4) {
      return true;
    }
  }

  for (var i = 1; i < 5; i++) {
    bool topRight =
        _hasRole(calcDx + oneSize * i, calcDy - oneSize * i, role, list);
    if (!topRight) {
      break;
    }
    if (i == 4) {
      return true;
    }
  }

  for (var i = 1; i < 5; i++) {
    bool left = _hasRole(calcDx - oneSize * i, calcDy, role, list);
    if (!left) {
      break;
    }
    if (i == 4) {
      return true;
    }
  }

  for (var i = 1; i < 5; i++) {
    bool right = _hasRole(calcDx + oneSize * i, calcDy, role, list);
    if (!right) {
      break;
    }
    if (i == 4) {
      return true;
    }
  }

  for (var i = 1; i < 5; i++) {
    bool bottomLeft =
        _hasRole(calcDx - oneSize * i, calcDy + oneSize * i, role, list);
    if (!bottomLeft) {
      break;
    }
    if (i == 4) {
      return true;
    }
  }

  for (var i = 1; i < 5; i++) {
    bool bottom = _hasRole(calcDx, calcDy + oneSize * i, role, list);
    if (!bottom) {
      break;
    }
    if (i == 4) {
      return true;
    }
  }

  for (var i = 1; i < 5; i++) {
    bool bottomRight =
        _hasRole(calcDx + oneSize * i, calcDy + oneSize * i, role, list);
    if (!bottomRight) {
      break;
    }
    if (i == 4) {
      return true;
    }
  }

  return false;
}

bool _hasRole(double calcDx, double calcDy, String role, List<GoBand> list) {
  return list
      .where((element) =>
          element.dx == calcDx && element.dy == calcDy && element.role == role)
      .isNotEmpty;
}
