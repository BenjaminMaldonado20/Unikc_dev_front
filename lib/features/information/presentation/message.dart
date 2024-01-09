import 'package:flutter/material.dart';

class Message extends StatefulWidget {
  const Message({Key? key}) : super(key: key);

  @override
  _MessageState createState() => _MessageState();
}

class _MessageState extends State<Message> {
  final TextEditingController _messageController = TextEditingController();
  final List<String> _messages = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          toolbarHeight: 100.0,
          elevation: 0,
          leading: IconButton(
            color: const Color.fromARGB(255, 255, 255, 231),
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
        body: Column(
          children: [
            const SizedBox(
              height: 35,
            ),
            Image.asset(
              'lib/features/media/img/message_bg.png',
              width: 141,
              height: 141,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 25,
            ),
            const Text(
              'Título',
              style: TextStyle(fontSize: 30),
            ),
            const Text(
              'Subtítulo',
              style: TextStyle(fontSize: 25, color: Colors.grey),
            ),
            const SizedBox(
              height: 50,
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(10),
                height: 50, // Ajusta la altura según tus necesidades
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.black),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: ListView.builder(
                          itemCount: _messages.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(_messages[index]),
                            );
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _messageController,
                              decoration: const InputDecoration(
                                hintText: 'Escribe un mensaje...',
                              ),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.send,
                              color: Colors.green,
                            ),
                            onPressed: () {
                              _sendMessage();
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _sendMessage() {
    String message = _messageController.text.trim();
    if (message.isNotEmpty) {
      setState(() {
        _messages.add(message);
        _messageController.clear();
      });
    }
  }
}

void main() {
  runApp(const Message());
}
