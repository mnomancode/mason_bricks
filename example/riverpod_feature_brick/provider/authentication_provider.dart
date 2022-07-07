import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'authentication_notifier.dart';

final AuthenticationNotifierProvider = StateNotifierProvider<AuthenticationNotifier, AuthenticationState>(
  (ref) {
    return AuthenticationNotifier();
  },
);
