// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

// import 'dart:async';

// import 'package:rxdart/rxdart.dart';
// import 'package:cloud_firestore/cloud_firestore.dart' as fs;
// import 'package:profiles_repository/profiles_repository.dart';

// class FirebaseProfilesRepository implements ProfilesRepository {
//   final firestore = fs.FirebaseFirestore.instance;

//   @override
//   Future<void> updateDispatchSettings(
//       String userId, DispatchSettings settings) async {
//     final ref = firestore.doc('users/$userId');
//     await ref.update({
//       'settings.dispatch': settings.toEntity().toJson(),
//     });
//   }

//   @override
//   Stream<Profile> profile(String userId) {
//     final stream = firestore.collection('users').doc(userId).snapshots();
//     final observable = stream
//         .doOnData((e) => print("snapshotProfile $userId ${e.exists}"))
//         .where((e) => e.exists);
//     return observable
//         .map((s) => Profile.fromEntity(ProfileEntity.fromSnapshot(s)));
//   }

//   @override
//   Stream<Settings> settings(String userId) {
//     return this.profile(userId).map((u) => u.settings);
//   }
// }
