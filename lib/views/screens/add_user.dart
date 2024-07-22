import 'package:flutter/material.dart';

class AddUser extends StatelessWidget {
  AddUser({super.key});
  GlobalKey _formKey = GlobalKey<State>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber.shade700,
        title: Text("Add Product"),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextFormField(),
            ],
          ),
        ),
      ),
    );
  }
}
