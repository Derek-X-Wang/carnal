import 'dart:async';
import 'dart:convert';

import 'package:local_storage/local_storage.dart';
import 'package:profiles_repository/profiles_repository.dart';
import 'package:rxdart/rxdart.dart';

class LocalProfilesRepository implements ProfilesRepository {
  final storage = LocalStorage.instance;
  static const String _domainKey = 'profiles';
  static const String _domainVersion = 'v1';
  // TODO: use for migration logic
  static const List<String> _pastDomainVersions = [];
  static String _profileKey(String userId) => '$userId/profile';

  final BehaviorSubject<Profile> _profileSubject = BehaviorSubject<Profile>();

  @override
  Stream<Profile> profile(String userId) {
    if (_profileSubject.valueOrNull == null) {
      _loadProfileFromStorage(userId);
    }
    return _profileSubject.stream;
  }

  @override
  Stream<Settings> settings(String userId) {
    return this.profile(userId).map((u) => u.settings);
  }

  @override
  Stream<List<ContextSource>> contextSources(String userId) {
    return this.profile(userId).map((u) => u.sources);
  }

  @override
  Future<void> updateSettings(String userId, Settings settings) async {
    final profile = await this.profile(userId).first;
    final newProfile = profile.copyWith(settings: settings);
    await updateProfile(userId, newProfile);
  }

  @override
  Future<void> updateProfile(String userId, Profile profile) async {
    await storage.writeString(_domainKey, _domainVersion, _profileKey(userId),
        json.encode(profile.toJson()));
    _profileSubject.add(profile);
  }

  @override
  Future<void> updateContextSources(
      String userId, List<ContextSource> sources) async {
    final profile = await this.profile(userId).first;
    final newProfile = profile.copyWith(sources: sources);
    await updateProfile(userId, newProfile);
  }

  @override
  Profile currentProfile(String userId) {
    return _readProfile(userId) ?? Profile.empty;
  }

  @override
  Settings currentSettings(String userId) {
    return this.currentProfile(userId).settings;
  }

  @override
  List<ContextSource> currentContextSources(String userId) {
    return this.currentProfile(userId).sources;
  }

  void _loadProfileFromStorage(String userId) {
    final profile = _readProfile(userId);
    if (profile == null) {
      final profile = Profile.empty;
      storage.writeString(_domainKey, _domainVersion, _profileKey(userId),
          json.encode(profile.toJson()));
      _profileSubject.add(profile);
    } else {
      _profileSubject.add(profile);
    }
  }

  Profile? _readProfile(String userId) {
    final raw =
        storage.readString(_domainKey, _domainVersion, _profileKey(userId));
    if (raw == null) return null;
    return Profile.fromJson(json.decode(raw));
  }
}

extension Helpers on LocalProfilesRepository {}
