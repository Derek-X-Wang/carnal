// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'context_source.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ContextSource _$ContextSourceFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'directory':
      return DirectoryContext.fromJson(json);
    case 'file':
      return FileContext.fromJson(json);
    case 'text':
      return TextContext.fromJson(json);
    case 'screenCapture':
      return ScreenCaptureContext.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'ContextSource',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$ContextSource {
  bool get canRead => throw _privateConstructorUsedError; // Directory path
  String get name => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool canRead, bool canWrite, String path, String name)
        directory,
    required TResult Function(
            bool canRead, bool canWrite, String path, String name)
        file,
    required TResult Function(bool canRead, String content, String name) text,
    required TResult Function(
            bool canRead, String imagePath, String content, String name)
        screenCapture,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool canRead, bool canWrite, String path, String name)?
        directory,
    TResult? Function(bool canRead, bool canWrite, String path, String name)?
        file,
    TResult? Function(bool canRead, String content, String name)? text,
    TResult? Function(
            bool canRead, String imagePath, String content, String name)?
        screenCapture,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool canRead, bool canWrite, String path, String name)?
        directory,
    TResult Function(bool canRead, bool canWrite, String path, String name)?
        file,
    TResult Function(bool canRead, String content, String name)? text,
    TResult Function(
            bool canRead, String imagePath, String content, String name)?
        screenCapture,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DirectoryContext value) directory,
    required TResult Function(FileContext value) file,
    required TResult Function(TextContext value) text,
    required TResult Function(ScreenCaptureContext value) screenCapture,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DirectoryContext value)? directory,
    TResult? Function(FileContext value)? file,
    TResult? Function(TextContext value)? text,
    TResult? Function(ScreenCaptureContext value)? screenCapture,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DirectoryContext value)? directory,
    TResult Function(FileContext value)? file,
    TResult Function(TextContext value)? text,
    TResult Function(ScreenCaptureContext value)? screenCapture,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContextSourceCopyWith<ContextSource> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContextSourceCopyWith<$Res> {
  factory $ContextSourceCopyWith(
          ContextSource value, $Res Function(ContextSource) then) =
      _$ContextSourceCopyWithImpl<$Res, ContextSource>;
  @useResult
  $Res call({bool canRead, String name});
}

/// @nodoc
class _$ContextSourceCopyWithImpl<$Res, $Val extends ContextSource>
    implements $ContextSourceCopyWith<$Res> {
  _$ContextSourceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? canRead = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      canRead: null == canRead
          ? _value.canRead
          : canRead // ignore: cast_nullable_to_non_nullable
              as bool,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DirectoryContextCopyWith<$Res>
    implements $ContextSourceCopyWith<$Res> {
  factory _$$DirectoryContextCopyWith(
          _$DirectoryContext value, $Res Function(_$DirectoryContext) then) =
      __$$DirectoryContextCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool canRead, bool canWrite, String path, String name});
}

/// @nodoc
class __$$DirectoryContextCopyWithImpl<$Res>
    extends _$ContextSourceCopyWithImpl<$Res, _$DirectoryContext>
    implements _$$DirectoryContextCopyWith<$Res> {
  __$$DirectoryContextCopyWithImpl(
      _$DirectoryContext _value, $Res Function(_$DirectoryContext) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? canRead = null,
    Object? canWrite = null,
    Object? path = null,
    Object? name = null,
  }) {
    return _then(_$DirectoryContext(
      canRead: null == canRead
          ? _value.canRead
          : canRead // ignore: cast_nullable_to_non_nullable
              as bool,
      canWrite: null == canWrite
          ? _value.canWrite
          : canWrite // ignore: cast_nullable_to_non_nullable
              as bool,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DirectoryContext extends DirectoryContext with DiagnosticableTreeMixin {
  const _$DirectoryContext(
      {required this.canRead,
      required this.canWrite,
      required this.path,
      required this.name,
      final String? $type})
      : $type = $type ?? 'directory',
        super._();

  factory _$DirectoryContext.fromJson(Map<String, dynamic> json) =>
      _$$DirectoryContextFromJson(json);

  @override
  final bool canRead;
  @override
  final bool canWrite;
  @override
  final String path;
// Directory path
  @override
  final String name;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ContextSource.directory(canRead: $canRead, canWrite: $canWrite, path: $path, name: $name)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ContextSource.directory'))
      ..add(DiagnosticsProperty('canRead', canRead))
      ..add(DiagnosticsProperty('canWrite', canWrite))
      ..add(DiagnosticsProperty('path', path))
      ..add(DiagnosticsProperty('name', name));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DirectoryContext &&
            (identical(other.canRead, canRead) || other.canRead == canRead) &&
            (identical(other.canWrite, canWrite) ||
                other.canWrite == canWrite) &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, canRead, canWrite, path, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DirectoryContextCopyWith<_$DirectoryContext> get copyWith =>
      __$$DirectoryContextCopyWithImpl<_$DirectoryContext>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool canRead, bool canWrite, String path, String name)
        directory,
    required TResult Function(
            bool canRead, bool canWrite, String path, String name)
        file,
    required TResult Function(bool canRead, String content, String name) text,
    required TResult Function(
            bool canRead, String imagePath, String content, String name)
        screenCapture,
  }) {
    return directory(canRead, canWrite, path, name);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool canRead, bool canWrite, String path, String name)?
        directory,
    TResult? Function(bool canRead, bool canWrite, String path, String name)?
        file,
    TResult? Function(bool canRead, String content, String name)? text,
    TResult? Function(
            bool canRead, String imagePath, String content, String name)?
        screenCapture,
  }) {
    return directory?.call(canRead, canWrite, path, name);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool canRead, bool canWrite, String path, String name)?
        directory,
    TResult Function(bool canRead, bool canWrite, String path, String name)?
        file,
    TResult Function(bool canRead, String content, String name)? text,
    TResult Function(
            bool canRead, String imagePath, String content, String name)?
        screenCapture,
    required TResult orElse(),
  }) {
    if (directory != null) {
      return directory(canRead, canWrite, path, name);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DirectoryContext value) directory,
    required TResult Function(FileContext value) file,
    required TResult Function(TextContext value) text,
    required TResult Function(ScreenCaptureContext value) screenCapture,
  }) {
    return directory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DirectoryContext value)? directory,
    TResult? Function(FileContext value)? file,
    TResult? Function(TextContext value)? text,
    TResult? Function(ScreenCaptureContext value)? screenCapture,
  }) {
    return directory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DirectoryContext value)? directory,
    TResult Function(FileContext value)? file,
    TResult Function(TextContext value)? text,
    TResult Function(ScreenCaptureContext value)? screenCapture,
    required TResult orElse(),
  }) {
    if (directory != null) {
      return directory(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$DirectoryContextToJson(
      this,
    );
  }
}

abstract class DirectoryContext extends ContextSource {
  const factory DirectoryContext(
      {required final bool canRead,
      required final bool canWrite,
      required final String path,
      required final String name}) = _$DirectoryContext;
  const DirectoryContext._() : super._();

  factory DirectoryContext.fromJson(Map<String, dynamic> json) =
      _$DirectoryContext.fromJson;

  @override
  bool get canRead;
  bool get canWrite;
  String get path;
  @override // Directory path
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$DirectoryContextCopyWith<_$DirectoryContext> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FileContextCopyWith<$Res>
    implements $ContextSourceCopyWith<$Res> {
  factory _$$FileContextCopyWith(
          _$FileContext value, $Res Function(_$FileContext) then) =
      __$$FileContextCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool canRead, bool canWrite, String path, String name});
}

/// @nodoc
class __$$FileContextCopyWithImpl<$Res>
    extends _$ContextSourceCopyWithImpl<$Res, _$FileContext>
    implements _$$FileContextCopyWith<$Res> {
  __$$FileContextCopyWithImpl(
      _$FileContext _value, $Res Function(_$FileContext) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? canRead = null,
    Object? canWrite = null,
    Object? path = null,
    Object? name = null,
  }) {
    return _then(_$FileContext(
      canRead: null == canRead
          ? _value.canRead
          : canRead // ignore: cast_nullable_to_non_nullable
              as bool,
      canWrite: null == canWrite
          ? _value.canWrite
          : canWrite // ignore: cast_nullable_to_non_nullable
              as bool,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FileContext extends FileContext with DiagnosticableTreeMixin {
  const _$FileContext(
      {required this.canRead,
      required this.canWrite,
      required this.path,
      required this.name,
      final String? $type})
      : $type = $type ?? 'file',
        super._();

  factory _$FileContext.fromJson(Map<String, dynamic> json) =>
      _$$FileContextFromJson(json);

  @override
  final bool canRead;
  @override
  final bool canWrite;
  @override
  final String path;
// File path
  @override
  final String name;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ContextSource.file(canRead: $canRead, canWrite: $canWrite, path: $path, name: $name)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ContextSource.file'))
      ..add(DiagnosticsProperty('canRead', canRead))
      ..add(DiagnosticsProperty('canWrite', canWrite))
      ..add(DiagnosticsProperty('path', path))
      ..add(DiagnosticsProperty('name', name));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FileContext &&
            (identical(other.canRead, canRead) || other.canRead == canRead) &&
            (identical(other.canWrite, canWrite) ||
                other.canWrite == canWrite) &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, canRead, canWrite, path, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FileContextCopyWith<_$FileContext> get copyWith =>
      __$$FileContextCopyWithImpl<_$FileContext>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool canRead, bool canWrite, String path, String name)
        directory,
    required TResult Function(
            bool canRead, bool canWrite, String path, String name)
        file,
    required TResult Function(bool canRead, String content, String name) text,
    required TResult Function(
            bool canRead, String imagePath, String content, String name)
        screenCapture,
  }) {
    return file(canRead, canWrite, path, name);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool canRead, bool canWrite, String path, String name)?
        directory,
    TResult? Function(bool canRead, bool canWrite, String path, String name)?
        file,
    TResult? Function(bool canRead, String content, String name)? text,
    TResult? Function(
            bool canRead, String imagePath, String content, String name)?
        screenCapture,
  }) {
    return file?.call(canRead, canWrite, path, name);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool canRead, bool canWrite, String path, String name)?
        directory,
    TResult Function(bool canRead, bool canWrite, String path, String name)?
        file,
    TResult Function(bool canRead, String content, String name)? text,
    TResult Function(
            bool canRead, String imagePath, String content, String name)?
        screenCapture,
    required TResult orElse(),
  }) {
    if (file != null) {
      return file(canRead, canWrite, path, name);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DirectoryContext value) directory,
    required TResult Function(FileContext value) file,
    required TResult Function(TextContext value) text,
    required TResult Function(ScreenCaptureContext value) screenCapture,
  }) {
    return file(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DirectoryContext value)? directory,
    TResult? Function(FileContext value)? file,
    TResult? Function(TextContext value)? text,
    TResult? Function(ScreenCaptureContext value)? screenCapture,
  }) {
    return file?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DirectoryContext value)? directory,
    TResult Function(FileContext value)? file,
    TResult Function(TextContext value)? text,
    TResult Function(ScreenCaptureContext value)? screenCapture,
    required TResult orElse(),
  }) {
    if (file != null) {
      return file(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$FileContextToJson(
      this,
    );
  }
}

abstract class FileContext extends ContextSource {
  const factory FileContext(
      {required final bool canRead,
      required final bool canWrite,
      required final String path,
      required final String name}) = _$FileContext;
  const FileContext._() : super._();

  factory FileContext.fromJson(Map<String, dynamic> json) =
      _$FileContext.fromJson;

  @override
  bool get canRead;
  bool get canWrite;
  String get path;
  @override // File path
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$FileContextCopyWith<_$FileContext> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TextContextCopyWith<$Res>
    implements $ContextSourceCopyWith<$Res> {
  factory _$$TextContextCopyWith(
          _$TextContext value, $Res Function(_$TextContext) then) =
      __$$TextContextCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool canRead, String content, String name});
}

/// @nodoc
class __$$TextContextCopyWithImpl<$Res>
    extends _$ContextSourceCopyWithImpl<$Res, _$TextContext>
    implements _$$TextContextCopyWith<$Res> {
  __$$TextContextCopyWithImpl(
      _$TextContext _value, $Res Function(_$TextContext) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? canRead = null,
    Object? content = null,
    Object? name = null,
  }) {
    return _then(_$TextContext(
      canRead: null == canRead
          ? _value.canRead
          : canRead // ignore: cast_nullable_to_non_nullable
              as bool,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TextContext extends TextContext with DiagnosticableTreeMixin {
  const _$TextContext(
      {required this.canRead,
      required this.content,
      required this.name,
      final String? $type})
      : $type = $type ?? 'text',
        super._();

  factory _$TextContext.fromJson(Map<String, dynamic> json) =>
      _$$TextContextFromJson(json);

  @override
  final bool canRead;
  @override
  final String content;
// Text content
  @override
  final String name;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ContextSource.text(canRead: $canRead, content: $content, name: $name)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ContextSource.text'))
      ..add(DiagnosticsProperty('canRead', canRead))
      ..add(DiagnosticsProperty('content', content))
      ..add(DiagnosticsProperty('name', name));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TextContext &&
            (identical(other.canRead, canRead) || other.canRead == canRead) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, canRead, content, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TextContextCopyWith<_$TextContext> get copyWith =>
      __$$TextContextCopyWithImpl<_$TextContext>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool canRead, bool canWrite, String path, String name)
        directory,
    required TResult Function(
            bool canRead, bool canWrite, String path, String name)
        file,
    required TResult Function(bool canRead, String content, String name) text,
    required TResult Function(
            bool canRead, String imagePath, String content, String name)
        screenCapture,
  }) {
    return text(canRead, content, name);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool canRead, bool canWrite, String path, String name)?
        directory,
    TResult? Function(bool canRead, bool canWrite, String path, String name)?
        file,
    TResult? Function(bool canRead, String content, String name)? text,
    TResult? Function(
            bool canRead, String imagePath, String content, String name)?
        screenCapture,
  }) {
    return text?.call(canRead, content, name);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool canRead, bool canWrite, String path, String name)?
        directory,
    TResult Function(bool canRead, bool canWrite, String path, String name)?
        file,
    TResult Function(bool canRead, String content, String name)? text,
    TResult Function(
            bool canRead, String imagePath, String content, String name)?
        screenCapture,
    required TResult orElse(),
  }) {
    if (text != null) {
      return text(canRead, content, name);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DirectoryContext value) directory,
    required TResult Function(FileContext value) file,
    required TResult Function(TextContext value) text,
    required TResult Function(ScreenCaptureContext value) screenCapture,
  }) {
    return text(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DirectoryContext value)? directory,
    TResult? Function(FileContext value)? file,
    TResult? Function(TextContext value)? text,
    TResult? Function(ScreenCaptureContext value)? screenCapture,
  }) {
    return text?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DirectoryContext value)? directory,
    TResult Function(FileContext value)? file,
    TResult Function(TextContext value)? text,
    TResult Function(ScreenCaptureContext value)? screenCapture,
    required TResult orElse(),
  }) {
    if (text != null) {
      return text(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$TextContextToJson(
      this,
    );
  }
}

abstract class TextContext extends ContextSource {
  const factory TextContext(
      {required final bool canRead,
      required final String content,
      required final String name}) = _$TextContext;
  const TextContext._() : super._();

  factory TextContext.fromJson(Map<String, dynamic> json) =
      _$TextContext.fromJson;

  @override
  bool get canRead;
  String get content;
  @override // Text content
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$TextContextCopyWith<_$TextContext> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ScreenCaptureContextCopyWith<$Res>
    implements $ContextSourceCopyWith<$Res> {
  factory _$$ScreenCaptureContextCopyWith(_$ScreenCaptureContext value,
          $Res Function(_$ScreenCaptureContext) then) =
      __$$ScreenCaptureContextCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool canRead, String imagePath, String content, String name});
}

/// @nodoc
class __$$ScreenCaptureContextCopyWithImpl<$Res>
    extends _$ContextSourceCopyWithImpl<$Res, _$ScreenCaptureContext>
    implements _$$ScreenCaptureContextCopyWith<$Res> {
  __$$ScreenCaptureContextCopyWithImpl(_$ScreenCaptureContext _value,
      $Res Function(_$ScreenCaptureContext) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? canRead = null,
    Object? imagePath = null,
    Object? content = null,
    Object? name = null,
  }) {
    return _then(_$ScreenCaptureContext(
      canRead: null == canRead
          ? _value.canRead
          : canRead // ignore: cast_nullable_to_non_nullable
              as bool,
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ScreenCaptureContext extends ScreenCaptureContext
    with DiagnosticableTreeMixin {
  const _$ScreenCaptureContext(
      {required this.canRead,
      required this.imagePath,
      required this.content,
      required this.name,
      final String? $type})
      : $type = $type ?? 'screenCapture',
        super._();

  factory _$ScreenCaptureContext.fromJson(Map<String, dynamic> json) =>
      _$$ScreenCaptureContextFromJson(json);

  @override
  final bool canRead;
  @override
  final String imagePath;
// Path to the image of the screen capture
  @override
  final String content;
// Text content
  @override
  final String name;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ContextSource.screenCapture(canRead: $canRead, imagePath: $imagePath, content: $content, name: $name)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ContextSource.screenCapture'))
      ..add(DiagnosticsProperty('canRead', canRead))
      ..add(DiagnosticsProperty('imagePath', imagePath))
      ..add(DiagnosticsProperty('content', content))
      ..add(DiagnosticsProperty('name', name));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScreenCaptureContext &&
            (identical(other.canRead, canRead) || other.canRead == canRead) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, canRead, imagePath, content, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScreenCaptureContextCopyWith<_$ScreenCaptureContext> get copyWith =>
      __$$ScreenCaptureContextCopyWithImpl<_$ScreenCaptureContext>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool canRead, bool canWrite, String path, String name)
        directory,
    required TResult Function(
            bool canRead, bool canWrite, String path, String name)
        file,
    required TResult Function(bool canRead, String content, String name) text,
    required TResult Function(
            bool canRead, String imagePath, String content, String name)
        screenCapture,
  }) {
    return screenCapture(canRead, imagePath, content, name);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool canRead, bool canWrite, String path, String name)?
        directory,
    TResult? Function(bool canRead, bool canWrite, String path, String name)?
        file,
    TResult? Function(bool canRead, String content, String name)? text,
    TResult? Function(
            bool canRead, String imagePath, String content, String name)?
        screenCapture,
  }) {
    return screenCapture?.call(canRead, imagePath, content, name);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool canRead, bool canWrite, String path, String name)?
        directory,
    TResult Function(bool canRead, bool canWrite, String path, String name)?
        file,
    TResult Function(bool canRead, String content, String name)? text,
    TResult Function(
            bool canRead, String imagePath, String content, String name)?
        screenCapture,
    required TResult orElse(),
  }) {
    if (screenCapture != null) {
      return screenCapture(canRead, imagePath, content, name);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DirectoryContext value) directory,
    required TResult Function(FileContext value) file,
    required TResult Function(TextContext value) text,
    required TResult Function(ScreenCaptureContext value) screenCapture,
  }) {
    return screenCapture(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DirectoryContext value)? directory,
    TResult? Function(FileContext value)? file,
    TResult? Function(TextContext value)? text,
    TResult? Function(ScreenCaptureContext value)? screenCapture,
  }) {
    return screenCapture?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DirectoryContext value)? directory,
    TResult Function(FileContext value)? file,
    TResult Function(TextContext value)? text,
    TResult Function(ScreenCaptureContext value)? screenCapture,
    required TResult orElse(),
  }) {
    if (screenCapture != null) {
      return screenCapture(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ScreenCaptureContextToJson(
      this,
    );
  }
}

abstract class ScreenCaptureContext extends ContextSource {
  const factory ScreenCaptureContext(
      {required final bool canRead,
      required final String imagePath,
      required final String content,
      required final String name}) = _$ScreenCaptureContext;
  const ScreenCaptureContext._() : super._();

  factory ScreenCaptureContext.fromJson(Map<String, dynamic> json) =
      _$ScreenCaptureContext.fromJson;

  @override
  bool get canRead;
  String get imagePath; // Path to the image of the screen capture
  String get content;
  @override // Text content
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$ScreenCaptureContextCopyWith<_$ScreenCaptureContext> get copyWith =>
      throw _privateConstructorUsedError;
}
