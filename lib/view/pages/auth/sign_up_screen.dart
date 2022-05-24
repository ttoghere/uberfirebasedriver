import 'package:flutter/material.dart';

import 'login_screen.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  validateForm() {
    if (nameTextEditingController.text.length < 3) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Enter more than 3 characters")));
    } else if (!emailTextEditingController.text.contains("@")) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Enter a valid email")));
    } else if (phoneTextEditingController.text.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Enter a phone number")));
    } else if (passwordTextEditingController.text.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Password must be more than 6 characters")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset("assets/logo1.png"),
              ),
              Text(
                "Register as a Driver",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              FormRow(
                textInputType: TextInputType.name,
                editingController: nameTextEditingController,
                title: "Name",
                isObs: false,
              ),
              FormRow(
                textInputType: TextInputType.emailAddress,
                editingController: emailTextEditingController,
                title: "Email",
                isObs: false,
              ),
              FormRow(
                textInputType: TextInputType.phone,
                editingController: phoneTextEditingController,
                title: "Phone",
                isObs: false,
              ),
              FormRow(
                textInputType: TextInputType.text,
                editingController: passwordTextEditingController,
                title: "Password",
                isObs: true,
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  validateForm();
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(builder: (context) => CarInfoScreen()),
                  // );
                },
                child: Text(
                  "Create Account",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black54,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.red[900],
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                child: Text(
                  "Already have an account? Login Here",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FormRow extends StatelessWidget {
  const FormRow({
    Key? key,
    required this.textInputType,
    required this.isObs,
    required this.title,
    required this.editingController,
  }) : super(key: key);

  final TextInputType textInputType;
  final bool isObs;
  final String title;
  final TextEditingController editingController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: textInputType,
      obscureText: isObs,
      style: TextStyle(
        color: Colors.grey,
      ),
      controller: editingController,
      decoration: InputDecoration(
        labelText: title,
        hintText: title,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 10,
        ),
        labelStyle: TextStyle(
          color: Colors.grey,
          fontSize: 10,
        ),
      ),
    );
  }
}
