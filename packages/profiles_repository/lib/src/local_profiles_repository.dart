import 'dart:async';
import 'dart:convert';

import 'package:local_storage/local_storage.dart';
import 'package:profiles_repository/profiles_repository.dart';

class LocalProfilesRepository implements ProfilesRepository {
  final storage = LocalStorage.instance;
  static const String _domainKey = 'profiles';
  static String _profileKey(String userId) => '$userId/profile';

  @override
  Stream<Profile> profile(String userId) {
    final raw = storage.readString(_domainKey, _profileKey(userId));
    if (raw == null) {
      return Stream.fromFuture(() async {
        final profile = Profile.empty;
        await storage.writeString(
            _domainKey, _profileKey(userId), json.encode(profile.toJson()));
        return profile;
      }());
    } else {
      final profile = Profile.fromJson(json.decode(raw));
      return Stream.value(profile);
    }
  }

  @override
  Stream<Settings> settings(String userId) {
    return this.profile(userId).map((u) => u.settings);
  }

  @override
  Future<void> updateSettings(String userId, Settings settings) async {
    final profile = await this.profile(userId).first;
    final newProfile = profile.copyWith(settings: settings);
    await storage.writeString(
        _domainKey, _profileKey(userId), json.encode(newProfile.toJson()));
  }

  @override
  Future<void> updateProfile(String userId, Profile profile) async {
    await storage.writeString(
        _domainKey, _profileKey(userId), json.encode(profile.toJson()));
  }

  @override
  Profile currentProfile(String userId) {
    final raw = storage.readString(_domainKey, _profileKey(userId));
    if (raw == null) {
      return Profile.empty;
    } else {
      return Profile.fromJson(json.decode(raw));
    }
  }

  @override
  Settings currentSettings(String userId) {
    return this.currentProfile(userId).settings;
  }
}
