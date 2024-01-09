import 'package:flutter/material.dart';

class EditData extends StatelessWidget {
  const EditData({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 231),
        appBar: AppBar(
          title: const Text(
            'Crear registro',
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          backgroundColor: Colors.transparent,
          toolbarHeight: 100.0,
          leading: IconButton(
            color: const Color.fromARGB(255, 255, 255, 255),
            icon: const Icon(
              Icons.keyboard_arrow_left_sharp,
              size: 40,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/features/media/img/bg_appvar.png'),
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
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              _buildEditField("Código", Icons.code),
              _buildEditField("Nombre del Residente", Icons.person),
              _buildEditField("Número de Teléfono", Icons.phone),
              _buildEditField("Email", Icons.email),
              const SizedBox(height: 40.0),
              _buildSendButton(context),
            ],
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }

  Widget _buildEditField(String labelText, IconData icon) {
    return GestureDetector(
      onTap: () {
        //
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 20.0),
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        decoration: BoxDecoration(
          color: Colors.white, 
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(width: 10.0),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  labelText: labelText,
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSendButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          //
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue, // í
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0), 
          ),
        ),
        child: const Text(
          "Enviar",
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}
