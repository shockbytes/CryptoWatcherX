

import 'package:cryptowatcherx/data/user/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseUserRepository implements UserRepository {
  @override
  Future<void> logout() {
    return FirebaseAuth.instance.signOut();
  }

}