import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:blood_donate_app/screens/update.dart';

class AddUser extends StatefulWidget {
  const AddUser({super.key});

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  final _bloodGroups = ['A+', 'A-', 'B+', 'B-', 'AB-', 'AB+', 'O+', 'O-', 'B+'];
  String? _selectedbloodGroup;
  final CollectionReference donor =
      FirebaseFirestore.instance.collection('donor');

  TextEditingController donorName = TextEditingController();
  TextEditingController donorPhone = TextEditingController();

  void addDonor() {
    final data = {
      'name': donorName.text,
      'phone': donorPhone.text,
      'group': _selectedbloodGroup
    };
    donor.add(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Donors",
          style: TextStyle(
              color: const Color.fromARGB(255, 204, 197, 196),
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromARGB(255, 196, 12, 12),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              controller: donorName,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), label: Text("Donor Name")),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              controller: donorPhone,
              keyboardType: TextInputType.number,
              maxLength: 10,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), label: Text("Phone Number")),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: DropdownButtonFormField(
              value: _selectedbloodGroup,
                decoration: InputDecoration(label: Text("Select Blood Group")),
                items: _bloodGroups
                    .map((e) => DropdownMenuItem(
                          child: Text(e),
                          value: e,
                        ))
                    .toList(),
                onChanged: (val) {
                  _selectedbloodGroup = val as String?;
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
                style: ButtonStyle(
                    minimumSize:
                        MaterialStatePropertyAll(Size(double.infinity, 50)),
                    backgroundColor: MaterialStatePropertyAll(Colors.red)),
                onPressed: () {
                  addDonor();
                  Navigator.pop(context);
                },
                child: Text("Submit")),
          )
        ],
      ),
    );
  }
}
