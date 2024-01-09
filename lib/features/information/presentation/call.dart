import 'package:flutter/material.dart';
import 'package:unikc/features/information/presentation/message.dart';

class Contact {
  final String name;
  final String phoneNumber;
  final bool isMobile;

  Contact({
    required this.name,
    required this.phoneNumber,
    required this.isMobile,
  });
}

class CallUser extends StatefulWidget {
  const CallUser({Key? key}) : super(key: key);

  @override
  _CallUserState createState() => _CallUserState();
}

class _CallUserState extends State<CallUser> {
  TextEditingController _searchController = TextEditingController();
  FocusNode _searchFocusNode = FocusNode();

  List<Contact> contacts = [
    Contact(name: 'Pacho', phoneNumber: '1101', isMobile: true),
    Contact(name: 'Fernano Calderón', phoneNumber: '1101', isMobile: true),
    Contact(name: 'Rodrigo Moreno', phoneNumber: '1102', isMobile: true),
    Contact(name: 'Juan Álvarez', phoneNumber: '1102', isMobile: true),
    Contact(name: 'Luis Acosta', phoneNumber: '1103', isMobile: true),
    Contact(name: 'Julio Acosta', phoneNumber: '1103', isMobile: true),
    Contact(name: 'Alci Acosta', phoneNumber: '10101', isMobile: true),
    Contact(name: 'Abril Valdez', phoneNumber: '12121', isMobile: true),
    Contact(name: 'Alfredo Bautista', phoneNumber: '10102', isMobile: true),
    Contact(name: 'Sebastian Ramirez', phoneNumber: '101013', isMobile: true),
    Contact(name: 'Benjamin Maldonado', phoneNumber: '10104', isMobile: true),
    Contact(name: 'Pacho', phoneNumber: '1102', isMobile: true),
    Contact(name: 'Pacho', phoneNumber: '1103', isMobile: true),
    Contact(name: 'Pacho', phoneNumber: '1104', isMobile: true),
    Contact(name: 'Pacho', phoneNumber: '1105', isMobile: true),
    // Agrega otros contactos aquí
  ];

  List<Contact> filteredContacts = [];

  @override
  void initState() {
    super.initState();
    filteredContacts = contacts;
  }

  void _filterContacts(String query) {
    setState(() {
      filteredContacts = contacts
          .where((contact) =>
              contact.name.toLowerCase().contains(query.toLowerCase()) ||
              contact.phoneNumber.contains(query))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(240, 240, 216, 1),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 150,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("lib/features/media/img/bg_appvar.png"),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                padding: const EdgeInsets.all(60.0),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: filteredContacts.length,
                  itemBuilder: (context, index) {
                    return ContactBlock(contact: filteredContacts[index]);
                  },
                ),
              ),
            ],
          ),
          Positioned(
            top: 30,
            left: 0,
            right: 0,
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
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
            ),
          ),
          Positioned(
            top: 70,
            left: 50,
            right: 50,
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(_searchFocusNode);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      const Icon(Icons.search, color: Colors.grey),
                      const SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          focusNode: _searchFocusNode,
                          controller: _searchController,
                          onChanged: _filterContacts,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Buscar...',
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ContactBlock extends StatelessWidget {
  final Contact contact;

  const ContactBlock({Key? key, required this.contact}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 35),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                contact.name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(
                contact.phoneNumber,
                style: const TextStyle(
                  fontSize: 11,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Message(),
                    ),
                  );
                },
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue,
                  ),
                  child: const Icon(
                    Icons.message,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.green,
                  ),
                  child: Icon(
                    contact.isMobile ? Icons.phone_android : Icons.phone,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
