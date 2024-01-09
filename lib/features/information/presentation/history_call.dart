import 'package:flutter/material.dart';

class Call {
  final String callerName;
  final String callTime;

  Call({required this.callerName, required this.callTime});
}

class HistoryCall extends StatelessWidget {
  final List<Call> callList = [
    Call(callerName: 'John Doe', callTime: '10:30 AM'),
    Call(callerName: 'Jane Smith', callTime: '11:45 AM'),
    // Agrega más llamadas según sea necesario
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
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
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Text(
                'Historial de llamadas',
                style: TextStyle(
                  fontSize: 20, 
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 156, 156, 156)
                  ),
              ),
              const SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                itemCount: callList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(callList[index].callerName),
                    subtitle: Text('Hora: ${callList[index].callTime}'),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
