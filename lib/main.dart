import 'package:flutter/material.dart';
import 'package:login/provider/provider.dart';
import 'package:provider/provider.dart';

import 'app_router.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyProvider(),
      child: const MaterialApp(
        onGenerateRoute: Routes.generateRoute,
        onUnknownRoute: Routes.errorRoute,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
