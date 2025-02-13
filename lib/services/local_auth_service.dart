import 'dart:developer';

import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_darwin/local_auth_darwin.dart';

class LocalAuthService {
  LocalAuthService._();

  static final LocalAuthService _instance = LocalAuthService._();

  static LocalAuthService get shared => _instance;

  final LocalAuthentication _localAuth = LocalAuthentication();

  Future<bool> authenticate() async {
    try {
      return await _localAuth.authenticate(
        localizedReason:
            'Security is our main concern. Make sure that you are the acctual user of the app.',
        options: const AuthenticationOptions(
          stickyAuth: true,
          useErrorDialogs: true,
        ),
        authMessages: [
          const IOSAuthMessages(
            cancelButton: 'cancel',
            goToSettingsButton: 'Settings',
            goToSettingsDescription:
                'If you not added any auth methods, go and add it from the settings by taping the button below.',
          ),
          const AndroidAuthMessages(
              biometricNotRecognized: 'Biometrics not recognized.',
              cancelButton: 'cancel',
              goToSettingsButton: 'Settings',
              goToSettingsDescription:
                  'If you not added any auth methods, go and add it from the settings by taping the button below.',
              biometricRequiredTitle: 'Biometrics requied.')
        ],
      );
    } catch (e) {
      log('error while authentication: $e');
      return false;
    }
  }
}
