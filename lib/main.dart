import 'package:flutgrid/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF712cf9), onPrimary: Color(0xFFFFFFFF),
    secondary: Color(0xFF646464), onSecondary: Color(0xFFFFFFFF),
    error: Color(0xFFB3261E), onError: Color(0xFFFFFFFF),
    background: Color(0xFFFFFBFE), onBackground: Color(0xFF323232),
    surface: Color(0xFFE7E7E7), onSurface: Color(0xFF323232),
    surfaceTint: Colors.transparent,
  );
  
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(  
        colorScheme: colorScheme,
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber, onPrimary: Color(0xFFFFFFFF), primary: Colors.amber),
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          surfaceTintColor: Colors.transparent,
          foregroundColor: colorScheme.onPrimary,
          backgroundColor: colorScheme.primary, 
          titleTextStyle: Theme.of(context).textTheme.titleMedium,
          elevation: 10, 
          toolbarHeight: 54,
        )
      ),
      home: 
      const Home(title: 'FlutGrid'),
    );
  }
}
