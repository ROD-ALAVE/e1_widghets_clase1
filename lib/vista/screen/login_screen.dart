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
    return GestureDetector(
      onTap: () => _mostrarNotificacion(context, "Presión simple", Colors.blue),
      onLongPress: () => _mostrarNotificacion(context, "Mantenido presionado", Colors.green),
      onDoubleTap: () => _mostrarNotificacion(context, "Doble clic", Colors.orange),
      onPanUpdate: (details) {
        if (details.delta.dx > 20) {
          _mostrarNotificacion(context, "Deslizó hacia la derecha", Colors.amber);
        }
      },
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Login del Ejemplo 1'),
                const SizedBox(height: 32),
                TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Usuario',
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
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
                        duration: const Duration(seconds: 2),
                      ),
                    );

                    print('Email: $email, Password: $password');
                  },
                  child: const Text('Iniciar sesión'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Método para mostrar notificaciones de los gestos
  void _mostrarNotificacion(BuildContext context, String mensaje, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mensaje),
        backgroundColor: color,
        duration: const Duration(milliseconds: 500),
      ),
    );
  }
}