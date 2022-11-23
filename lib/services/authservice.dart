part of "services.dart";

Future<UserCredential> signInWithGoogle() async {
  Firebase.initializeApp();
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  final GoogleSignInAuthentication googleAuth =
      await googleUser!.authentication;

  final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

  return await FirebaseAuth.instance.signInWithCredential(credential);
}

Future signOut() async {
  Firebase.initializeApp();
  await FirebaseAuth.instance.signOut();
  await GoogleSignIn().signOut().then((value) {});
}
