import 'package:flutter/material.dart';

class OpenSafePage extends StatelessWidget {
  const OpenSafePage({super.key});

  void _openSafe(BuildContext context) {
    final snackBar = SnackBar(
      content: Text('Сейф открыт'),
      duration: Duration(milliseconds: 500),
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

  void _closeSafe(BuildContext context) {
    final snackBar = SnackBar(
      content: Text('Сейф закрыт'),
      duration: Duration(milliseconds: 500),
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
        automaticallyImplyLeading: false,
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => _openSafe(context),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(
                    200,
                    60,
                  ), // Устанавливает ширину и высоту кнопки
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ), // Внутренние отступы
                  textStyle: TextStyle(
                    fontSize: 20,
                  ), // Увеличение шрифта текста
                ),
                child: Text('Открыть сейф'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _closeSafe(context),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(
                    200,
                    60,
                  ), // Устанавливает ширину и высоту кнопки
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ), // Внутренние отступы
                  textStyle: TextStyle(
                    fontSize: 20,
                  ), // Увеличение шрифта текста
                ),
                child: Text('Закрыть сейф'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void main() {
    runApp(MaterialApp(home: OpenSafePage()));
  }
}
