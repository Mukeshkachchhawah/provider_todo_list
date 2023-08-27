import 'package:flutter/material.dart';
import 'package:provide_database_example/provider/database_provider.dart';
import 'package:provider/provider.dart';

var ID;
var NAME;
var DECSE;

class Update extends StatefulWidget {
  var id;
  var name;
  var desc;
  Update({required this.id, required this.desc, required this.name}) {
    ID = id;
    NAME = name;
    DECSE = desc;
  }

  @override
  State<Update> createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  final formKey = GlobalKey<FormState>();
  TextEditingController titieController = TextEditingController();
  TextEditingController descController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    titieController.text = NAME;
    descController.text = DECSE;
    return Scaffold(
      appBar: AppBar(
        title: Text("Update"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 20),
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
              .updateData(ID, titieController.text, descController.text);
          setState(() {});
          //if (formKey.currentState!.validate()) Navigator.pop(context);
          Navigator.pop(context);
        },
        child: Icon(Icons.update),
      ),
    );
  }
}
