import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.red,
  Colors.purple,
  Colors.orange,
  Colors.pink,
  Colors.amber,
  Colors.brown,
  Colors.cyan,
  Colors.deepOrange,
  Colors.deepPurple,
  Colors.indigo,
  Colors.lime,
  Colors.yellow,
  Colors.lightBlue,
  Colors.lightGreen,
  Colors.grey,
  Colors.blueGrey,
];

class AppTheme {
  final int selectedColor;
  final bool isDarkmode;

  AppTheme({
    this.selectedColor = 0,
    this.isDarkmode = false,
  })  : assert(selectedColor >= 0, 'SelectedColor must be greater than 0'),
        assert(selectedColor < colorList.length,
            'SelectedColor must be less than ${colorList.length - 1}');

  ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        brightness: isDarkmode ? Brightness.dark : Brightness.light,
        colorSchemeSeed: colorList[selectedColor],
        appBarTheme: const AppBarTheme(
          centerTitle: false,
        ),
      );

  // copyWith es un método de Flutter que permite clonar un objeto y modificar sus propiedades.
  // 👇 Devuelve una nueva instancia de AppTheme
  AppTheme copyWith({
    int? selectedColor,
    bool? isDarkmode,
  }) => AppTheme(
    selectedColor: selectedColor ?? this.selectedColor,
    isDarkmode: isDarkmode ?? this.isDarkmode,
  );
}
