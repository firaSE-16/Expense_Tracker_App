import 'package:flutter/material.dart';
import 'package:flutter_application_5/widgets/expenses.dart';

var kColorScheme = ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 96, 59, 181));

var kDarkColorScheme = ColorScheme.fromSeed(seedColor: const Color.fromARGB(255,5, 99, 125),
brightness: Brightness.dark,);

void main() {
  runApp( MaterialApp(
    darkTheme: ThemeData.dark().copyWith(
      useMaterial3: true,
      colorScheme: kDarkColorScheme
    ),
    theme: ThemeData(
    ).copyWith(useMaterial3: true,
    colorScheme: kColorScheme,
    appBarTheme: const AppBarTheme().copyWith(
      backgroundColor: kColorScheme.onPrimaryContainer,
      foregroundColor: kColorScheme.primaryContainer
  
    ),
    cardTheme: const CardTheme().copyWith(
      color:kColorScheme.secondaryContainer, 
      margin: const EdgeInsets.symmetric(horizontal: 16,vertical:8 )
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(style:ElevatedButton.styleFrom(
      backgroundColor: kColorScheme.primary
    )),
    textTheme: ThemeData().textTheme.copyWith(
      titleLarge: TextStyle(fontWeight: FontWeight.normal, color: kColorScheme.onSecondaryContainer,fontSize:14)
    )
    ),
    themeMode: ThemeMode.system,
    home: Expenses(), 
  )); 
}
 