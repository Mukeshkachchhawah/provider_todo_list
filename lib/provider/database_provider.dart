import 'package:flutter/material.dart';
import 'package:provide_database_example/database/mydb_helper.dart';

class DataBase_Provider extends ChangeNotifier {
  List<Map<String, dynamic>> arrDataList = [];

  /// function add data
  Future<void> addData(String title, String desc) async {
    bool chack = await MyDBHelper().addNote(title, desc);
    if (chack) {
      arrDataList = await MyDBHelper().fetchAllNotes();
      notifyListeners();
    } else {
      print("Data Not Added");
    }
  }

  void deletData(int index){   
  }

  Future<void> getInitialData() async {
    arrDataList = await MyDBHelper().fetchAllNotes();
    notifyListeners();
  }
}
