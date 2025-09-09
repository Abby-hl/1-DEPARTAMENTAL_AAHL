import 'package:flutter/material.dart';
import 'app_scaffold.dart';

class RegistroPage extends StatefulWidget {
  const RegistroPage({super.key});

  @override
  State<RegistroPage> createState() => _RegistroPageState();
}

class _RegistroPageState extends State<RegistroPage> {
  final _formKey = GlobalKey<FormState>();
  final _nombreController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _confirmPassController = TextEditingController();
  bool _obscurePass = true;
  bool _obscureConfirmPass = true;
  bool _aceptoTerminos = false;

  @override
  void dispose() {
    _nombreController.dispose();
    _emailController.dispose();
    _passController.dispose();
    _confirmPassController.dispose();
    super.dispose();
  }

  void _enviar() {
    if (!_aceptoTerminos) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Debes aceptar los términos"),
          backgroundColor: Colors.redAccent,
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    if (_formKey.currentState!.validate()) {
      final nombre = _nombreController.text;
      final email = _emailController.text;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Registrado: $nombre ($email)"),
          duration: const Duration(seconds: 2),
          backgroundColor: Colors.deepPurple,
        ),
      );
    }
  }

  void _limpiar() {
    _formKey.currentState!.reset();
    _nombreController.clear();
    _emailController.clear();
    _passController.clear();
    _confirmPassController.clear();
    _aceptoTerminos = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "Formulario de Registro",
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nombreController,
                decoration: const InputDecoration(
                  labelText: "Nombre",
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return "El nombre es obligatorio";
                  if (value.length < 3) return "Mínimo 3 caracteres";
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: "Email",
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return "El email es obligatorio";
                  final regex = RegExp(r'^[\w\.-]+@[\w\.-]+\.\w+$');
                  if (!regex.hasMatch(value))
                    return "Formato de email inválido";
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _passController,
                obscureText: _obscurePass,
                decoration: InputDecoration(
                  labelText: "Contraseña",
                  prefixIcon: const Icon(Icons.lock),
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePass ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePass = !_obscurePass;
                      });
                    },
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return "La contraseña es obligatoria";
                  if (value.length < 6) return "Mínimo 6 caracteres";
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _confirmPassController,
                obscureText: _obscureConfirmPass,
                decoration: InputDecoration(
                  labelText: "Confirmar Contraseña",
                  prefixIcon: const Icon(Icons.lock_outline),
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureConfirmPass
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureConfirmPass = !_obscureConfirmPass;
                      });
                    },
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return "Debe confirmar la contraseña";
                  if (value != _passController.text)
                    return "Las contraseñas no coinciden";
                  return null;
                },
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Checkbox(
                    value: _aceptoTerminos,
                    onChanged: (value) {
                      setState(() {
                        _aceptoTerminos = value ?? false;
                      });
                    },
                    activeColor: Colors.pinkAccent,
                  ),
                  const Expanded(
                    child: Text(
                      "Acepto los términos y condiciones",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: _enviar,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pinkAccent,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text("Enviar"),
                  ),
                  OutlinedButton(
                    onPressed: _limpiar,
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.white),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text(
                      "Limpiar",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
