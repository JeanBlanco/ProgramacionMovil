import 'package:ejemplo5/contactList.dart';
import 'package:ejemplo5/createContact.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(routes: {
    "/": (BuildContext context) => const ContactList(),
    "/createcontact": (BuildContext) => const CreateContact()
  }));
}
