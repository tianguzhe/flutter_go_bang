// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'go_band_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GoBand _$$_GoBandFromJson(Map<String, dynamic> json) => _$_GoBand(
      dx: (json['dx'] as num).toDouble(),
      dy: (json['dy'] as num).toDouble(),
      role: json['role'] as String,
    );

Map<String, dynamic> _$$_GoBandToJson(_$_GoBand instance) => <String, dynamic>{
      'dx': instance.dx,
      'dy': instance.dy,
      'role': instance.role,
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$winInfoHash() => r'3c8a162e53790f00e405648ae7c37a1cccd142ce';

/// See also [winInfo].
@ProviderFor(winInfo)
final winInfoProvider = AutoDisposeProvider<String>.internal(
  winInfo,
  name: r'winInfoProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$winInfoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef WinInfoRef = AutoDisposeProviderRef<String>;
String _$isWinHash() => r'8e9f4db2f1d17676c5686accefd6a03d9f2e355d';

/// See also [isWin].
@ProviderFor(isWin)
final isWinProvider = AutoDisposeProvider<bool>.internal(
  isWin,
  name: r'isWinProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$isWinHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef IsWinRef = AutoDisposeProviderRef<bool>;
String _$gobandViewModelHash() => r'f3bc9e104fdd22b4912805ee60ec73165eecaf4c';

/// See also [GobandViewModel].
@ProviderFor(GobandViewModel)
final gobandViewModelProvider =
    AutoDisposeNotifierProvider<GobandViewModel, List<GoBand>>.internal(
  GobandViewModel.new,
  name: r'gobandViewModelProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$gobandViewModelHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$GobandViewModel = AutoDisposeNotifier<List<GoBand>>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
