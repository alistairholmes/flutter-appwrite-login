import 'package:flutter/material.dart';
import 'package:flutter_appwrite_demo/ui/login/login.dart';
import 'package:provider/provider.dart';
import 'utils/notifiers/providers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            fontFamily: 'Poppins'),
        debugShowCheckedModeBanner: false,
        home: Login(),
      ),
    );
  }
}
