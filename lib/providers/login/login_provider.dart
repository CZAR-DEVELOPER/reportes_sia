import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:one_context/one_context.dart';

class LoginNotifier extends StateNotifier<dynamic> {
  LoginNotifier() : super(null);

  login() {
    OneContext().pushNamedAndRemoveUntil('/admin', (Route<dynamic> route) => false);
  }

  logout() {
    OneContext().pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);
  }
}

final loginProvider = StateNotifierProvider<LoginNotifier, dynamic>((ref) {
  return LoginNotifier();
});
