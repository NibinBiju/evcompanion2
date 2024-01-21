import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseHelper {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore store=FirebaseFirestore.instance;

  get user => auth.currentUser;

  //Signup
  Future<String?> signUp({required String email, required String password}) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
       store.collection('addBooking').doc(user!.uid).set({
        'uid':user.uid,
        'email':email
      },SetOptions(merge: true)
      );
      return user;
      
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
  //SignIn
  Future<String?> signIn({required String email, required String password}) async {
    try {
      await auth.signInWithEmailAndPassword(
          email: email,
          password: password);
          return null;
     
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  //Sign
  Future<void> signOut() async{
    await auth.signOut();
  }
}