import 'package:flutter/material.dart';

class OpenSafePage extends StatelessWidget {
  const OpenSafePage({super.key});

  void _openSafe(BuildContext context) {
    final snackBar = SnackBar(
      content: Text('Сейф открыт'),
      //action: SnackBarAction(
      //label: 'OK',
      //onPressed: () {
      // Действие при нажатии на кнопку
      //},
      //),
    );
    // Показываем SnackBar
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Открыть сейф'),
    ),
    body: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 6, 175, 0),
            Color.fromARGB(255, 118, 255, 114),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: ElevatedButton(
          onPressed: () => _openSafe(context),
          child: Text('Открыть сейф'),
        ),
      ),
    ),
  );
}
  void main() {
    runApp(MaterialApp(home: OpenSafePage()));
  }
}
