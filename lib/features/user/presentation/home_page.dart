import 'package:flutter/material.dart';
import 'package:unikc/features/user/presentation/home.dart';

import 'Components/button_guarda.dart';
import 'Components/button_residente.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(81, 78, 235, 50),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min, // Ajustar al tamaño mínimo verticalmente
              children: [
                const SizedBox(height: 50),
                const SizedBox(
                  width: 237,
                  height: 237,
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage('lib/features/media/img/Logo_white.png'),
                    radius: 220,
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  'UNIKC',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Citofonía virtual',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 246),
                Flexible(
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 35),
                    child: Column(
                      children: [
                        SizedBox(
                          child: MyButtonH(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => (Home())),
                              );
                            },  
                          ),
                        ),
                        const SizedBox(height: 50),
                        SizedBox(
                          child: MyButtonR(
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(builder: (context) => ),
                              // );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}