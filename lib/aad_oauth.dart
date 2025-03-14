/// Authenticates a user with Azure Active Directory using OAuth2.0.
library aad_oauth;

import 'dart:async';

import 'package:aad_oauth/helper/core_oauth.dart';
import 'package:aad_oauth/model/failure.dart';
import 'package:aad_oauth/model/token.dart';
import 'package:dartz/dartz.dart';

import 'model/config.dart';

/// Authenticates a user with Azure Active Directory using OAuth2.0.
class AadOAuth {
  final CoreOAuth _coreOAuth;

  AadOAuth(Config config) : _coreOAuth = CoreOAuth.fromConfig(config);

  /// Perform Azure AD login.
  ///
  /// Setting [refreshIfAvailable] to `true` will attempt to re-authenticate
  /// with the existing refresh token, if any, even though the access token may
  /// still be valid. If there's no refresh token the existing access token
  /// will be returned, as long as we deem it still valid. In the event that
  /// both access and refresh tokens are invalid, the web gui will be used.
  Future<Either<Failure, Token>> login(
          {bool refreshIfAvailable = false, String? email}) =>
      _coreOAuth.login(refreshIfAvailable: refreshIfAvailable, email: email);

  /// Retrieve cached OAuth Access Token.
  Future<String?> getAccessToken() async => _coreOAuth.getAccessToken();

  /// Retrieve cached OAuth Id Token.
  Future<String?> getIdToken() async => _coreOAuth.getIdToken();

  /// Perform Azure AD logout.
  Future<void> logout() async => _coreOAuth.logout();
}
