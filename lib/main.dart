import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ThemeChanger(),
    );
  }
}

class ThemeChanger extends StatefulWidget {
  const ThemeChanger({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ThemeChangerState createState() => _ThemeChangerState();
}

class _ThemeChangerState extends State<ThemeChanger> {
  bool isDarkTheme = false;

  void _toggleTheme() {
    setState(() {
      isDarkTheme = !isDarkTheme;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: isDarkTheme ? AppTheme.darkTheme : AppTheme.lightTheme,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Theme Changer'),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                isDarkTheme ? Colors.black : Colors.blueGrey,
                isDarkTheme ? Colors.grey : Colors.white,
              ],
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Example theme text',
                  style: AppTheme.textStyle(isDarkTheme),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _toggleTheme,
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: isDarkTheme ? Colors.indigo : Colors.blue, // Text color
                    elevation: 10, // Shadow depth
                    shadowColor: isDarkTheme ? Colors.indigoAccent : Colors.blueAccent, // Shadow color
                  ),
                  child: const Text('Change Theme'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.indigo,
  );

  static TextStyle textStyle(bool isDarkTheme) {
    return TextStyle(
      fontSize: 20,
      color: isDarkTheme ? Colors.white : Colors.black,
    );
  }
}
