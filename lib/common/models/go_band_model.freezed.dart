// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'go_band_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GoBand _$GoBandFromJson(Map<String, dynamic> json) {
  return _GoBand.fromJson(json);
}

/// @nodoc
mixin _$GoBand {
  double get dx => throw _privateConstructorUsedError;
  double get dy => throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GoBandCopyWith<GoBand> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoBandCopyWith<$Res> {
  factory $GoBandCopyWith(GoBand value, $Res Function(GoBand) then) =
      _$GoBandCopyWithImpl<$Res, GoBand>;
  @useResult
  $Res call({double dx, double dy, String role});
}

/// @nodoc
class _$GoBandCopyWithImpl<$Res, $Val extends GoBand>
    implements $GoBandCopyWith<$Res> {
  _$GoBandCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dx = null,
    Object? dy = null,
    Object? role = null,
  }) {
    return _then(_value.copyWith(
      dx: null == dx
          ? _value.dx
          : dx // ignore: cast_nullable_to_non_nullable
              as double,
      dy: null == dy
          ? _value.dy
          : dy // ignore: cast_nullable_to_non_nullable
              as double,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GoBandCopyWith<$Res> implements $GoBandCopyWith<$Res> {
  factory _$$_GoBandCopyWith(_$_GoBand value, $Res Function(_$_GoBand) then) =
      __$$_GoBandCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double dx, double dy, String role});
}

/// @nodoc
class __$$_GoBandCopyWithImpl<$Res>
    extends _$GoBandCopyWithImpl<$Res, _$_GoBand>
    implements _$$_GoBandCopyWith<$Res> {
  __$$_GoBandCopyWithImpl(_$_GoBand _value, $Res Function(_$_GoBand) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dx = null,
    Object? dy = null,
    Object? role = null,
  }) {
    return _then(_$_GoBand(
      dx: null == dx
          ? _value.dx
          : dx // ignore: cast_nullable_to_non_nullable
              as double,
      dy: null == dy
          ? _value.dy
          : dy // ignore: cast_nullable_to_non_nullable
              as double,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GoBand implements _GoBand {
  _$_GoBand({required this.dx, required this.dy, required this.role});

  factory _$_GoBand.fromJson(Map<String, dynamic> json) =>
      _$$_GoBandFromJson(json);

  @override
  final double dx;
  @override
  final double dy;
  @override
  final String role;

  @override
  String toString() {
    return 'GoBand(dx: $dx, dy: $dy, role: $role)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GoBand &&
            (identical(other.dx, dx) || other.dx == dx) &&
            (identical(other.dy, dy) || other.dy == dy) &&
            (identical(other.role, role) || other.role == role));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, dx, dy, role);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GoBandCopyWith<_$_GoBand> get copyWith =>
      __$$_GoBandCopyWithImpl<_$_GoBand>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GoBandToJson(
      this,
    );
  }
}

abstract class _GoBand implements GoBand {
  factory _GoBand(
      {required final double dx,
      required final double dy,
      required final String role}) = _$_GoBand;

  factory _GoBand.fromJson(Map<String, dynamic> json) = _$_GoBand.fromJson;

  @override
  double get dx;
  @override
  double get dy;
  @override
  String get role;
  @override
  @JsonKey(ignore: true)
  _$$_GoBandCopyWith<_$_GoBand> get copyWith =>
      throw _privateConstructorUsedError;
}
