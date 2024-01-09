import 'package:flutter/material.dart';
import 'package:unikc/features/information/presentation/call.dart';
import 'package:unikc/features/information/presentation/history_call.dart';
import 'package:unikc/features/user/presentation/create_register.dart';
import 'package:unikc/features/user/presentation/edit_data.dart';
import 'package:unikc/features/user/presentation/home.dart';

class CreateResident extends StatelessWidget {
  double screenWidth = 0.0;

  CreateResident({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;

    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 231),
        appBar: AppBar(
          title: const Text(
            'Crear residente',
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          backgroundColor: Colors.transparent,
          toolbarHeight: 100.0,
          elevation: 0,
          leading: Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/features/media/img/bg_appvar.png'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(224, 174, 255, 1),
                  ),
                  child: Image(
                      image:
                          AssetImage('lib/features/media/img/Logo_black.png'))),
              ListTile(
                title: const Text('Historial de llamadas'),
                leading: const Icon(Icons.history),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HistoryCall(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Editar datos'),
                leading: const Icon(Icons.edit),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EditData(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Crear nuevo registro'),
                leading: const Icon(Icons.add),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CreateRegister(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 430),
              ListTile(
                title: const Text('Cerrar sesión'),
                leading: const Icon(Icons.keyboard_return, color: Colors.red),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Home(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(35.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildTextField('Código', Icons.home),
                _buildTextField('Nombre', Icons.person),
                _buildTextField('Email', Icons.alternate_email_rounded),
                const SizedBox(height: 20.0),
                const Text('Tipo de Teléfono:'),
                const Row(
                  children: [
                    RadioGroup(),
                  ],
                ),
                const SizedBox(height: 16.0),
                _buildTextField('Teléfono', Icons.phone),
                const SizedBox(height: 25.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CallUser(),
                          ),
                        );
                      },
                      icon: const Icon(Icons.phone),
                      label: const Text('Local'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(84, 111, 255, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 45, vertical: 8),
                      ),
                    ),
                    const SizedBox(width: 14),
                    ElevatedButton.icon(
                      onPressed: () {
                        // Acción para el botón 'Nube'
                      },
                      icon: const Icon(Icons.cloud),
                      label: const Text('Nube'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(255, 84, 84, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 45, vertical: 8),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }

  Widget _buildTextField(String labelText, IconData icon) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 240, 240, 240),
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              color: Colors.black,
            ),
          ),
          child: TextField(
            decoration: InputDecoration(
              labelText: labelText,
              prefixIcon: Icon(
                icon,
                color: const Color.fromARGB(255, 120, 120, 120),
              ),
              border: InputBorder.none,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
            ),
          ),
        ),
        const SizedBox(height: 8.0),
        Text(
          'Ingresar el $labelText',
          style: const TextStyle(color: Color.fromARGB(255, 209, 209, 209)),
        ),
      ],
    );
  }
}

class RadioGroup extends StatefulWidget {
  const RadioGroup({Key? key}) : super(key: key);

  @override
  _RadioGroupState createState() => _RadioGroupState();
}

class _RadioGroupState extends State<RadioGroup> {
  String selectedOption = 'Fijo';

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Radio(
              value: 'Fijo',
              groupValue: selectedOption,
              onChanged: (value) {
                setState(() {
                  selectedOption = value!;
                });
              },
              activeColor: const Color.fromRGBO(84, 111, 255, 1),
            ),
            const Text('Teléfono Fijo'),
          ],
        ),
        const SizedBox(width: 20.0), // Ajusta el espacio entre los elementos
        Row(
          children: [
            Radio(
              value: 'Móvil',
              groupValue: selectedOption,
              onChanged: (value) {
                setState(() {
                  selectedOption = value!;
                });
              },
              activeColor: const Color.fromRGBO(84, 111, 255, 1),
            ),
            const Text('Teléfono Móvil'),
          ],
        ),
      ],
    );
  }
}
