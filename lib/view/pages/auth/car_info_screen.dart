import 'package:flutter/material.dart';

import 'sign_up_screen.dart';

class CarInfoScreen extends StatefulWidget {
  const CarInfoScreen({Key? key}) : super(key: key);

  @override
  State<CarInfoScreen> createState() => _CarInfoScreenState();
}

class _CarInfoScreenState extends State<CarInfoScreen> {
  TextEditingController carModelController = TextEditingController();
  TextEditingController carNumberController = TextEditingController();
  TextEditingController carColorController = TextEditingController();
  List<String> carTypeList = ["uber-x", "uber-go", "bike"];
  String? selectedCarType;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset("assets/logo1.png"),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Write Car Details",
                style: TextStyle(
                  fontSize: 26,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              FormRow(
                textInputType: TextInputType.text,
                isObs: false,
                title: "Car Model",
                editingController: carModelController,
              ),
              FormRow(
                textInputType: TextInputType.text,
                isObs: false,
                title: "Car Number",
                editingController: carNumberController,
              ),
              FormRow(
                textInputType: TextInputType.text,
                isObs: false,
                title: "Car Color",
                editingController: carColorController,
              ),
              SizedBox(
                height: 10,
              ),
              DropdownButton(
                iconSize: 26,
                dropdownColor: Colors.black,
                alignment: Alignment.center,
                value: selectedCarType,
                hint: Text(
                  "Please choose a car type",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                items: carTypeList
                    .map(
                      (car) => DropdownMenuItem(
                        child: Text(
                          car,
                          style: TextStyle(color: Colors.grey),
                        ),
                        value: car,
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedCarType = value.toString();
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => CarInfoScreen()),
                  );
                },
                child: Text(
                  "Save Info",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black54,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.red[900],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
