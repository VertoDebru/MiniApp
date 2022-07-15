import 'package:flutter/material.dart';
// Import the firebase_core plugin.
import 'package:firebase_core/firebase_core.dart';

import 'src/app.dart';

void main() async {
  // Initializing Database when starting the application.
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const KosmosApp());
}
