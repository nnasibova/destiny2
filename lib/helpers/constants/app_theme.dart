import 'package:flutter/material.dart';

class AppTheme{
  static final ThemeData theme =  ThemeData(
       fontFamily: 'SignikaNegative',
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),

        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          actionsIconTheme: IconThemeData(color: Colors.white),
          iconTheme: IconThemeData(color: Colors.white)
        )
  );
}