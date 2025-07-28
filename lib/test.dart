
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title, required this.onThemeChanged,}) : super(key: key);
  final String title;
  final ValueChanged<ThemeMode> onThemeChanged;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ThemeMode _themeMode = ThemeMode.system;
   bool isDark = false;

  // void _toggleTheme(ThemeMode themeMode) {
  //   setState(() {
  //     _themeMode = themeMode;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          Switch(
            value: isDarkMode,
            onChanged: (bool value) {
              widget.onThemeChanged(
                  value ? ThemeMode.dark : ThemeMode.light);
              setState(() {
                isDark = value;
              });}
          ),
        ],
      ),
    );
  }
}
