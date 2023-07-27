import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing/pages/page.dart';
import 'package:testing/providers/providers.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});
  //
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(
        builder: (BuildContext context) => ChangeNotifierProvider(
          create: (context) => ProviderAuthLogin(),
          builder: (context, child) => const PageAuthLogin(),
        ),
      ),
    );
  }
  //
}
