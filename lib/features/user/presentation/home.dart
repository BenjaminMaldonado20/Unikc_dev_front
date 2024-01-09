import 'package:flutter/material.dart';
import 'package:unikc/features/information/presentation/create_resident.dart';
import 'package:unikc/features/user/presentation/Components/my_button.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _showPassword = false;
  FocusNode _usernameFocus = FocusNode();
  FocusNode _passwordFocus = FocusNode();

  @override
  void dispose() {
    _usernameFocus.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 231),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 300,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image:
                          AssetImage("lib/features/media/img/img_bg_home.png"),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                ),
                Positioned(
                  top: 75,
                  left: 100,
                  child: Container(
                    height: 71,
                    width: 186,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image:
                            AssetImage("lib/features/media/img/Logo_white.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const Positioned(
                  top: 200,
                  left: 25,
                  child: Text(
                    'Acceso',
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 30,
                    ),
                  ),
                ),
                const Positioned(
                  top: 241,
                  left: 25,
                  child: Text(
                    'Usuario registrado',
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Ingresa tu correo y contraseña para continuar.',
              style: TextStyle(color: Colors.black, fontSize: 17),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 10),
                  _buildTextField(
                    'Usuario',
                    Icons.person,
                    _usernameFocus,
                  ),
                  const SizedBox(height: 10),
                  _buildPasswordTextField(
                    'Contraseña',
                    Icons.lock,
                    _passwordFocus,
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    child: MyButton(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CreateResident()),
                        );
                      }),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(
    String labelText,
    IconData icon,
    FocusNode focusNode,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          focusNode: focusNode,
          decoration: InputDecoration(
            labelText: labelText,
            filled: true,
            fillColor: focusNode.hasFocus
                ? Colors.white
                : const Color.fromARGB(255, 240, 240, 240),
            prefixIcon: Icon(
              icon,
              color: focusNode.hasFocus ? Colors.blue : Colors.grey,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: focusNode.hasFocus
                    ? Colors.transparent
                    : Colors.transparent,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: focusNode.hasFocus ? Colors.blue : Colors.transparent,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8.0),
        Text(
          'Ingresar el $labelText',
          style: TextStyle(
            color: focusNode.hasFocus
                ? Color.fromARGB(255, 0, 0, 0)
                : Color.fromARGB(255, 0, 0, 0),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordTextField(
    String labelText,
    IconData icon,
    FocusNode focusNode,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          focusNode: focusNode,
          obscureText: !_showPassword,
          decoration: InputDecoration(
            labelText: labelText,
            filled: true,
            fillColor: focusNode.hasFocus
                ? const Color.fromARGB(255, 0, 0, 0)
                : const Color.fromARGB(255, 240, 240, 240),
            prefixIcon: Icon(
              icon,
              color: focusNode.hasFocus ? Colors.blue : Colors.grey,
            ),
            suffixIcon: InkWell(
              onTap: () {
                setState(() {
                  _showPassword = !_showPassword;
                });
              },
              child: Icon(
                _showPassword ? Icons.visibility : Icons.visibility_off,
                color: focusNode.hasFocus ? Colors.blue : Colors.grey,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: focusNode.hasFocus
                    ? Color.fromARGB(255, 202, 14, 199)
                    : Colors.transparent,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: focusNode.hasFocus ? Colors.blue : Colors.transparent,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8.0),
        Text(
          'Ingresar la $labelText',
          style: TextStyle(
            color: focusNode.hasFocus
                ? const Color.fromARGB(255, 0, 0, 0)
                : Color.fromARGB(255, 0, 0, 0),
          ),
        ),
      ],
    );
  }
}
