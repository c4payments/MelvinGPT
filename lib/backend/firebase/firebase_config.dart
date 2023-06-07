import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBDathLQltLfzgIBR84E6mJcZQgwGullpM",
            authDomain: "melvingpt1.firebaseapp.com",
            projectId: "melvingpt1",
            storageBucket: "melvingpt1.appspot.com",
            messagingSenderId: "1017386768246",
            appId: "1:1017386768246:web:8842e4c902301a7439cc57",
            measurementId: "G-BTZ1G8H7XD"));
  } else {
    await Firebase.initializeApp();
  }
}
