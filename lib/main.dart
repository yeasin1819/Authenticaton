import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import './screens/registar_screen.dart';

FirebaseOptions get firebaseOptions => const FirebaseOptions(
      appId: '1:982270673899:android:ed1917ef1a9158194d0fae',
      apiKey: 'AIzaSyBXsrGjc58ukhUoLNd3iVNnOeOzVDo0bTo',
      projectId: 'flutterfirebase-18575',
      messagingSenderId: '982270673899',
    );

Future<void> initializeDefault() async {
  FirebaseApp app = await Firebase.initializeApp(
      // options: DefaultFirebaseConfig.platformOptions,
      options: firebaseOptions);
  print('Initialized default app $app');
}

void main() async {
   await initializeDefault();
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Registar(),
    );
  }
}
