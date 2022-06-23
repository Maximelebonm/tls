import 'package:flutter/material.dart';
//import 'package:flutter/scaf';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Formulaire tuto';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 46, 44, 44),
        appBar: AppBar(
          title: const Text(appTitle),
          backgroundColor: Color.fromARGB(255, 143, 134, 134),
        ),
        body: const AuthForm(),
      ),
    );
  }
}

class AuthForm extends StatefulWidget {
  const AuthForm({super.key});

  @override
  AuthFormState createState() {
    return AuthFormState();
  }
}

class AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          // Add TextFormFields and ElevatedButton here.
          TextFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.person),
              hintText: 'ton pseudo',
              labelText: 'Pseudo',
            ),

            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'pseudo incorect';
              }
              return null;
            },
          ),
          TextFormField(
            // The validator receives the text that the user has entered.
            decoration: const InputDecoration(
              icon: Icon(Icons.mail),
              hintText: 'email',
              labelText: 'email',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'email incorrect';
              }
              return null;
            },
          ),
          TextFormField(
            // The validator receives the text that the user has entered.
            decoration: const InputDecoration(
              icon: Icon(Icons.lock),
              hintText: 'Mot de passe',
              labelText: 'Mot de passe',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'mot de passe incorrect';
              }
              return null;
            },
          ),
          ElevatedButton(
            onPressed: () {
              // Validate returns true if the form is valid, or false otherwise.
              if (_formKey.currentState!.validate()) {
                // If the form is valid, display a snackbar. In the real world,
                // you'd often call a server or save the information in a database.
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Processing Data')),
                );
              }
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}

