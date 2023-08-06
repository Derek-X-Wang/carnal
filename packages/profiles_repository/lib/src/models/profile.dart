
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import '../entities/entities.dart';
import './settings.dart';

@immutable
class Profile extends Equatable {
  final String name;
  final Settings settings;

  Profile({
    required this.name,
    required this.settings,
  });

  Profile copyWith({String? name, Settings? settings}) {
    return Profile(
      name: name ?? this.name,
      settings: settings ?? this.settings,
    );
  }

  @override
  List<Object?> get props => [name, settings];

  @override
  String toString() {
    return 'Profile { name: $name }';
  }

  ProfileEntity toEntity() {
    return ProfileEntity(
      name: this.name,
      settings: this.settings.toEntity(),
    );
  }

  static Profile fromEntity(ProfileEntity entity) {
    return Profile(
      name: entity.name,
      settings: Settings.fromEntity(entity.settings),
    );
  }
}
