import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "new_key_regenk",
            authDomain: "parkit-c49c2.firebaseapp.com",
            projectId: "parkit-c49c2",
            storageBucket: "parkit-c49c2.appspot.com",
            messagingSenderId: "853321428774",
            appId: "1:853321428774:web:8144d3878a175c73e89be7",
            measurementId: "G-5VLEFG4NHM"));
  } else {
    await Firebase.initializeApp();
  }
}
