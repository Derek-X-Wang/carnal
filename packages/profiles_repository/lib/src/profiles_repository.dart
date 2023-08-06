// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'dart:async';

import 'package:profiles_repository/profiles_repository.dart';

abstract class ProfilesRepository {
  Future<void> updateDispatchSettings(String userId, DispatchSettings settings);
  Stream<Profile> profile(String userId);
  Stream<Settings> settings(String userId);
}
