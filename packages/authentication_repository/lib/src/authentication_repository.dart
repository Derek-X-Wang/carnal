import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:cache/cache.dart';
import 'package:crypto/crypto.dart';
// import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

/// Thrown if during the sign up process if a failure occurs.
class SignUpFailure implements Exception {}

/// Thrown during the login process if a failure occurs.
class LogInWithEmailAndPasswordFailure implements Exception {}

/// Thrown during the sign in with google process if a failure occurs.
class LogInWithGoogleFailure implements Exception {}

/// Thrown during the sign in with apple process if a failure occurs.
class LogInWithAppleFailure implements Exception {}

/// Thrown during the sign in anonymously process if a failure occurs.
class LogInAnonymouslyFailure implements Exception {}

/// Thrown during the logout process if a failure occurs.
class LogOutFailure implements Exception {}

/// Thrown if during the link process if no current user available.
class MissingUserFailure implements Exception {}

/// Thrown if during the link with email process if a failure occurs.
class LinkWithEmailFailure implements Exception {}

/// Thrown if during the link with google process if a failure occurs.
class LinkWithGoogleFailure implements Exception {}

/// Thrown if during the link with apple process if a failure occurs.
class LinkWithAppleFailure implements Exception {}

/// {@template authentication_repository}
/// Repository which manages user authentication.
/// {@endtemplate}
class AuthenticationRepository {
  /// {@macro authentication_repository}
  AuthenticationRepository({
    CacheClient? cache,
    GoogleSignIn? googleSignIn,
  })  : _cache = cache ?? CacheClient(),
        _googleSignIn = googleSignIn ?? GoogleSignIn.standard();

  final CacheClient _cache;
  final GoogleSignIn _googleSignIn;

  /// User cache key.
  /// Should only be used for testing purposes.
  @visibleForTesting
  static const userCacheKey = '__user_cache_key__';

  /// Stream of [User] which will emit the current user when
  /// the authentication state changes.
  ///
  /// Emits [User.empty] if the user is not authenticated.
  // Stream<User> get user {
  //   return _firebaseAuth.authStateChanges().map((firebaseUser) {
  //     final user = firebaseUser == null ? User.empty : firebaseUser.toUser;
  //     _cache.write(key: userCacheKey, value: user);
  //     return user;
  //   });
  // }

  /// Returns the current cached user.
  /// Defaults to [User.empty] if there is no cached user.
  User get currentUser {
    return _cache.read<User>(key: userCacheKey) ?? User.empty;
  }

  /// Creates a new user with the provided [email] and [password].
  ///
  /// Throws a [SignUpFailure] if an exception occurs.
  // Future<void> signUp({required String email, required String password}) async {
  //   try {
  //     await _firebaseAuth.createUserWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     );
  //   } on Exception {
  //     throw SignUpFailure();
  //   }
  // }

  /// Starts the Sign In Anonymously.
  ///
  /// Throws a [logInAnonymously] if an exception occurs.
  // Future<void> logInAnonymously() async {
  //   try {
  //     await _firebaseAuth.signInAnonymously();
  //   } on Exception {
  //     throw LogInAnonymouslyFailure();
  //   }
  // }

  /// Starts the Sign In with Google Flow.
  ///
  /// Throws a [logInWithGoogle] if an exception occurs.
  // Future<void> logInWithGoogle() async {
  //   try {
  //     final credential = await signInWithGoogle();

  //     /// Assume at least anonymous user is logged in.
  //     final currentUser = _getCurrentUser();
  //     try {
  //       await currentUser.linkWithCredential(credential);
  //     } on firebase_auth.FirebaseAuthException catch (e) {
  //       print('logInWithGoogle error: ${e.code}');
  //       if (e.code == 'credential-already-in-use') {
  //         await _firebaseAuth.signInWithCredential(credential);
  //       } else {
  //         throw LinkWithGoogleFailure();
  //       }
  //     }
  //   } on Exception {
  //     throw LogInWithGoogleFailure();
  //   }
  // }

  /// Starts the Sign In with Google Flow.
  ///
  /// Throws a [logInWithApple] if an exception occurs.
  // Future<void> logInWithApple() async {
  //   try {
  //     final credential = await signInWithApple();

  //     /// Assume at least anonymous user is logged in.
  //     final currentUser = _getCurrentUser();
  //     try {
  //       await currentUser.linkWithCredential(credential);
  //     } on firebase_auth.FirebaseAuthException catch (e) {
  //       print('logInWithApple error: ${e.code}');
  //       if (e.code == 'credential-already-in-use') {
  //         await _firebaseAuth.signInWithCredential(credential);
  //       } else {
  //         throw LinkWithAppleFailure();
  //       }
  //     }
  //   } on Exception {
  //     throw LogInWithAppleFailure();
  //   }
  // }

  /// Signs in with the provided [email] and [password].
  ///
  /// Throws a [LogInWithEmailAndPasswordFailure] if an exception occurs.
  // Future<void> logInWithEmailAndPassword({
  //   required String email,
  //   required String password,
  // }) async {
  //   try {
  //     await _firebaseAuth.signInWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     );
  //   } on Exception {
  //     throw LogInWithEmailAndPasswordFailure();
  //   }
  // }

  /// Signs out the current user which will emit
  /// [User.empty] from the [user] Stream.
  ///
  /// Throws a [LogOutFailure] if an exception occurs.
  // Future<void> logOut() async {
  //   try {
  //     await Future.wait([
  //       _firebaseAuth.signOut(),
  //       _googleSignIn.signOut(),
  //     ]);
  //   } on Exception {
  //     throw LogOutFailure();
  //   }
  // }
}

/// Link Credentials for anonymous users
extension LinkCredentials on AuthenticationRepository {
  /// Link current anonymous user with the provided [email] and [password].
  ///
  /// Throws a [LinkWithEmailFailure] if an exception occurs.
  // Future<void> linkWithEmail(
  //     {required String email, required String password}) async {
  //   final currentUser = _getCurrentUser();
  //   try {
  //     final credential = firebase_auth.EmailAuthProvider.credential(
  //       email: email,
  //       password: password,
  //     );
  //     await currentUser.linkWithCredential(credential);
  //   } on Exception {
  //     throw LinkWithEmailFailure();
  //   }
  // }

  /// Starts the Sign In with Google Flow.
  ///
  /// Throws a [LinkWithGoogleFailure] if an exception occurs.
  // Future<void> linkWithGoogle() async {
  //   final currentUser = _getCurrentUser();
  //   try {
  //     final credential = await signInWithGoogle();
  //     await currentUser.linkWithCredential(credential);
  //   } on Exception {
  //     throw LinkWithGoogleFailure();
  //   }
  // }

  /// Starts the Sign In with Google Flow.
  ///
  /// Throws a [LinkWithAppleFailure] if an exception occurs.
  // Future<void> linkWithApple() async {
  //   final currentUser = _getCurrentUser();
  //   try {
  //     final credential = await signInWithApple();
  //     await currentUser.linkWithCredential(credential);
  //   } on Exception {
  //     throw LinkWithAppleFailure();
  //   }
  // }
}

/// Obtain Credentials from providers
extension on AuthenticationRepository {
  /// Starts the Sign In with Google Flow.
  // Future<firebase_auth.AuthCredential> signInWithGoogle() async {
  //   final googleUser = await _googleSignIn.signIn();
  //   final googleAuth = await googleUser?.authentication;
  //   final credential = firebase_auth.GoogleAuthProvider.credential(
  //     accessToken: googleAuth?.accessToken,
  //     idToken: googleAuth?.idToken,
  //   );
  //   return credential;
  // }

  /// Starts the Sign In with Google Flow.
  // Future<firebase_auth.AuthCredential> signInWithApple() async {
  //   // To prevent replay attacks with the credential returned from Apple, we
  //   // include a nonce in the credential request. When signing in with
  //   // Firebase, the nonce in the id token returned by Apple, is expected to
  //   // match the sha256 hash of `rawNonce`.
  //   final rawNonce = _generateNonce();
  //   final nonce = _sha256ofString(rawNonce);

  //   // Request credential for the currently signed in Apple account.
  //   final appleCredential = await SignInWithApple.getAppleIDCredential(
  //     scopes: [
  //       AppleIDAuthorizationScopes.email,
  //       AppleIDAuthorizationScopes.fullName,
  //     ],
  //     nonce: nonce,
  //   );

  //   // Create an `OAuthCredential` from the credential returned by Apple.
  //   final oauthCredential = firebase_auth.OAuthProvider('apple.com').credential(
  //     idToken: appleCredential.identityToken,
  //     rawNonce: rawNonce,
  //   );

  //   // Link the user with Firebase. If the nonce we generated earlier does
  //   // not match the nonce in `appleCredential.identityToken`,
  //   // sign in will fail.
  //   return oauthCredential;
  // }
}

/// Helper functions.
extension on AuthenticationRepository {
  /// Generates a cryptographically secure random nonce, to be included in a
  /// credential request.
  String _generateNonce([int length = 32]) {
    const charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)])
        .join();
  }

  /// Returns the sha256 hash of [input] in hex notation.
  String _sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  // firebase_auth.User _getCurrentUser() {
  //   final user = _firebaseAuth.currentUser;
  //   if (user != null) {
  //     return user;
  //   } else {
  //     throw MissingUserFailure();
  //   }
  // }
}

// extension on firebase_auth.User {
//   User get toUser {
//     return User(
//       id: uid,
//       email: email,
//       name: displayName,
//       photo: photoURL,
//       isAnonymous: isAnonymous,
//     );
//   }
// }
