import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:interview_project/providers/isloading_provider.dart';
import 'package:interview_project/providers/obscure_provider.dart';
import 'package:interview_project/screens/login_screen.dart';
import 'package:interview_project/utils/constants.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle.light,),
        colorScheme: ColorScheme.fromSeed(seedColor: tealDark),
        useMaterial3: true,
      ),
      home: MultiProvider(providers: [
        ChangeNotifierProvider<ObscureProvider>(create: (context) => ObscureProvider()),
    ChangeNotifierProvider<isLoadingProvider>(create: (context) => isLoadingProvider()),
    ],child: LoginScreen())
    );
  }
}

