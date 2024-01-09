import 'package:flutter/material.dart';
import 'package:unikc/features/information/presentation/call.dart';
import 'package:unikc/features/information/presentation/create_resident.dart';
import 'package:unikc/features/user/presentation/home.dart';
import 'package:unikc/features/user/presentation/home_page.dart';
void main() async {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unikc',
      initialRoute: '/home',
      routes: {
        '/home': (context) => Home(),
        '/create_resident': (context) => CreateResident(),
        '/call': (context) => const CallUser()
      },
      debugShowCheckedModeBanner: false,
    );
  }
}