import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:messmatebot/domain/model/account/user.dart';
import 'package:messmatebot/domain/usecase/save_user_info_use_case.dart';
import 'package:messmatebot/injection_container/injection_container.dart';
import 'package:messmatebot/presentation/screen/auth/state/auth_ui_state.dart';

class AuthNotifier extends StateNotifier<AuthUiState> {
  AuthNotifier() : super(const AuthUiState.loading()) {
    _checkAuthStatus();
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;

  void _checkAuthStatus() async {
    state = FirebaseAuth.instance.currentUser != null
        ? const AuthUiState.authenticated()
        : const AuthUiState.anonymous();
  }

  void loginUser({
    required String email,
    required String password,
  }) async {
    state = const AuthUiState.loading();
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        state = const AuthUiState.authenticated();
      } else {
        state = const AuthUiState.error('Please enter all the fields');
      }
    } catch (err) {
      state = AuthUiState.error(err.toString());
    }
  }

  void signUpUser({
    required String email,
    required String password,
  }) async {
    state = const AuthUiState.loading();
    try {
      //register user
      if (email.isNotEmpty || password.isNotEmpty) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        print("SIgn up completed, userId = ${cred.user!.uid}");

        state = const AuthUiState.authenticated();
      }
    } catch (e) {
      state = AuthUiState.error(e.toString());
    }
  }

  void googleSignIn() async {
    state = const AuthUiState.loading();
    GoogleAuthProvider googleAuthProvider = GoogleAuthProvider();
    try {
      await _auth.signInWithProvider(googleAuthProvider);
      state = const AuthUiState.authenticated();
      final useCase = getIt<SaveUserInfoUseCase>();

      useCase(
          user: UserModel(
        uuid: _auth.currentUser!.uid,
        name: _auth.currentUser!.displayName ?? '',
        email: _auth.currentUser!.email ?? '',
        profilePicture: _auth.currentUser!.photoURL ?? '',
      ));
    } catch (e) {
      state = AuthUiState.error(e.toString());
    }
  }

  void signOut() async {
    await _auth.signOut();
    state = const AuthUiState.anonymous();
  }
}

final authNotifierProvider =
    StateNotifierProvider<AuthNotifier, AuthUiState>((ref) {
  return AuthNotifier();
});
