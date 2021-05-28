//import 'package:firebase_auth/firebase_auth.dart';
//
//class AuthenticationService{
//  final FirebaseAuth _firebaseAuth;
//
//  AuthenticationService(this._firebaseAuth);
//
//  Stream<User> get authStateChanges => _firebaseAuth.authStateChanges();
//
//  Future<void> signOut() async {
//    await _firebaseAuth.signOut();
//  }
//
//  Future<void> sendPasswordResetEmail(String email) async{
//    return _firebaseAuth.sendPasswordResetEmail(email: email);
//  }
//
//  Future<String> signIn({String email,String password}) async {
//    try{
//      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
//      return "Login Successful";
//    } on FirebaseAuthException catch (e){
//      return e.message;
//    }
//  }
//  Future<String> signUp({String email,String password}) async {
//    try{
//      await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
//      return "Registration Successful";
//    } on FirebaseAuthException catch (e){
//      return e.message;
//    }
//  }
//}
//
//bool validateEmail(String value) {
//  Pattern pattern =
//      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
//  RegExp regex = new RegExp(pattern);
//  return (!regex.hasMatch(value)) ? false : true;
//}
//
//class EmailValidator {
//  static String validate(String value) {
//    if(value.isEmpty) {
//      return "Email can't be empty!";
//    }
//    if(!validateEmail(value)){
//      return 'Valid Email Needed!';
//    }
//    return null;
//  }
//}
//class PasswordValidator {
//  static String validate(String value) {
//    if(value.isEmpty) {
//      return "Password can't be empty!";
//    }
//    if(value.length < 6){
//      return "Password length can't be less than 6";
//    }
//    if(value.length > 13){
//      return "Password length can't be greater than 13";
//    }
//    return null;
//  }
//}
//class NameValidator {
//  static String validate(String value) {
//    if(value.isEmpty) {
//      return "Name can't be empty!";
//    }
//    if(value.length < 2){
//      return "Please enter a valid name";
//    }
//    return null;
//  }
//}