import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:new_web/providers/AddressProvider.dart';
import 'package:new_web/providers/CartProvider.dart';
import 'package:new_web/providers/PageProvider.dart';
import 'package:new_web/providers/SideMenuProvider.dart';
import 'package:provider/provider.dart';
import 'package:new_web/pages/home.dart';

import 'firebase_options.dart';
import 'providers/UserDataProvider.dart';

int? sideMenu=1;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => CartProvider()),
    ChangeNotifierProvider(create: (_) => PageProvider()),
    ChangeNotifierProvider(create: (_) => SideMenuProvider()),
    ChangeNotifierProvider(create: (_) => UserDataProvider()),
    ChangeNotifierProvider(create: (_) => AddressProvider()),
  ],
  child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Home(),
    );
  }
}

