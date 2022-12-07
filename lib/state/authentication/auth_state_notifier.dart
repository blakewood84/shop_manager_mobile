import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

enum AuthState { error, initial, loading, signedIn, signedOut }

class AuthStateNotifier extends StateNotifier {
  AuthStateNotifier() : super(AuthState.initial);

  void signIn() async {}

  void signOut() async {}

  Future<void> _fetchUser(String userId) async {}
}
