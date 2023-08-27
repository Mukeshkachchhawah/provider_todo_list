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
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: titieController,
                validator: (value) {
                  if (value == " ") {
                    return "Enter Your Titil";
                  }
                  return null;
                },
                decoration: InputDecoration(
                    hintText: "Title",
                    hintStyle: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: descController,
                maxLines: 10,
                decoration: InputDecoration(
                    hintText: "Title",
                    hintStyle: TextStyle(
                      //  fontSize: 34,

                      fontWeight: FontWeight.bold,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
                validator: (value) {
                  if (value == " ") {
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
          await Provider.of<DataBase_Provider>(context, listen: false)
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
