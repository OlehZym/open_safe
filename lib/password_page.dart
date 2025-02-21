import 'package:flutter/material.dart';
import 'package:open_safe/open_safe_page.dart';

class PasswordPage extends StatefulWidget {
  const PasswordPage({super.key});

  @override
  PasswordPageState createState() => PasswordPageState();
}

class PasswordPageState extends State<PasswordPage> {
  final TextEditingController _passwordController = TextEditingController();
  final String _correctPassword = "2104\$#@"; // Правильный пароль

  bool _obscureText = true;
  bool _isPasswordIncorrect = false; // Флаг ошибки

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _checkPassword() {
    if (_passwordController.text == _correctPassword) {
      setState(() {
        _isPasswordIncorrect = false; // Сбрасываем ошибку
      });

      _passwordController.clear();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => OpenSafePage()),
      );
    } else {
      setState(() {
        _isPasswordIncorrect = true; // Показываем ошибку
      });

      // Убираем ошибку через 2 секунды
      Future.delayed(Duration(seconds: 2), () {
        setState(() {
          _isPasswordIncorrect = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Введите пароль')),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 6, 175, 0),
            Color.fromARGB(255, 118, 255, 114),
            ],
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Stack(
                children: [
                  TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      hintText: 'Пароль',
                      hintStyle: const TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: _togglePasswordVisibility,
                      ),
                    ),
                    obscureText: _obscureText,
                    onSubmitted: (_) => _checkPassword(),
                    cursorColor: const Color.fromARGB(255, 0, 0, 0),
                  ),
                  if (_isPasswordIncorrect)
                    Positioned.fill(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                          12,
                        ), // Скругление краёв
                        child: Container(
                          color: Colors.red.withOpacity(0.9), // Красный фон
                          alignment: Alignment.center,
                          child: Text(
                            'Неправильный пароль!',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _checkPassword,
                child: Text('Войти', style: TextStyle(color: Colors.black)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
