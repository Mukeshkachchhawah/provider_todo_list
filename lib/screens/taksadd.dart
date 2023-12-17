import 'package:flutter/material.dart';
import 'package:provide_database_example/provider/database_provider.dart';
import 'package:provider/provider.dart';

class AddTaks extends StatefulWidget {
  const AddTaks({super.key});

  @override
  State<AddTaks> createState() => _AddTaksState();
}

class _AddTaksState extends State<AddTaks> {
  final formKey = GlobalKey<FormState>();
  TextEditingController titieController = TextEditingController();
  TextEditingController descController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Taks"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: titieController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter Your Titil";
                  }
                  return null;
                },
                decoration: InputDecoration(
                    hintText: "Title",
                    hintStyle: TextStyle(
                      // fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: descController,
                maxLines: null,
                decoration: InputDecoration(
                    hintText: "Desc.....",
                    hintStyle: TextStyle(
                      //  fontSize: 34,

                      fontWeight: FontWeight.bold,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter Your desc";
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Provider.of<UserDataProvider>(context, listen: false)
              .addData(titieController.text, descController.text);
          setState(() {});
          //if (formKey.currentState!.validate()) Navigator.pop(context);
          Navigator.pop(context);
        },
        child: Icon(Icons.save),
      ),
    );
  }
}
