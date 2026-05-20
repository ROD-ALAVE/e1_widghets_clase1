import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Controladores para capturar el texto de los campos
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:Padding(padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Login del Ejemplo 1'),
              const SizedBox(height: 32),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Usuario',
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                ),
                obscureText: true,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  // Aquí irá la lógica de login después
                  String email = _emailController.text;
                  String password = _passwordController.text;

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Bienvenido, ${_emailController.text}'),
                      backgroundColor: Colors.green,
                      duration: Duration(seconds: 2),
                    ),
                  );

                  print('Email: $email, Password: $password');
                },
                child: Text('Iniciar sesión'),
              ),
            ],
          ),
        )
      )
    );
  }
}