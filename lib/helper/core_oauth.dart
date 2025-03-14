import 'package:aad_oauth/helper/choose_oauth.dart'
    // ignore: uri_does_not_exist
    if (dart.library.io) 'package:aad_oauth/helper/mobile_oauth.dart'
    // ignore: uri_does_not_exist
    if (dart.library.html) 'package:aad_oauth/helper/web_oauth.dart';
import 'package:aad_oauth/model/config.dart';
import 'package:aad_oauth/model/failure.dart';
import 'package:aad_oauth/model/token.dart';
import 'package:dartz/dartz.dart';

class CoreOAuth {
  CoreOAuth();

  Future<Either<Failure, Token>> login(
          {bool refreshIfAvailable = false, String? email}) async =>
      throw UnsupportedFailure(ErrorType.Unsupported, 'Unsupported login');

  Future<void> logout() async =>
      throw UnsupportedFailure(ErrorType.Unsupported, 'Unsupported logout');

  Future<String?> getAccessToken() async => throw UnsupportedFailure(
      ErrorType.Unsupported, 'Unsupported getAccessToken');

  Future<String?> getIdToken() async => throw UnsupportedFailure(
      ErrorType.Unsupported, 'Unsupported getAccessToken');

  factory CoreOAuth.fromConfig(Config config) =>
      config.isStub ? MockCoreOAuth() : getOAuthConfig(config);
}

/// Mock class for testing.
class MockCoreOAuth extends CoreOAuth {
  final String mockAccessToken = 'ACCESS_TOKEN';
  final String mockIdToken = 'ID_TOKEN';

  @override
  Future<Either<Failure, Token>> login(
          {bool refreshIfAvailable = false, String? email}) async =>
      Right(Token(accessToken: mockAccessToken));

  @override
  Future<void> logout() async {}

  @override
  Future<String?> getAccessToken() async => mockAccessToken;

  @override
  Future<String?> getIdToken() async => mockIdToken;
}
