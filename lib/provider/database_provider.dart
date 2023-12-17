import 'package:flutter/material.dart';
import 'package:provide_database_example/database/mydb_helper.dart';

class UserDataProvider extends ChangeNotifier {
  List<Map<String, dynamic>> arrDataList = [];

  /// function add data
  Future<void> addData(String title, String desc) async {
    bool chack = await MyDBHelper().addNote(title, desc);
    if (chack) {
      /// conditon is true
      ///  add data
      arrDataList = await MyDBHelper().fetchAllNotes();
      notifyListeners();
    } else {
      print("Data Not Added");
    }
  }

  /// function delet data
  Future<void> deletData(int id) async {
    var check = await MyDBHelper().deletNotes(id);
    if (check) {
      arrDataList = await MyDBHelper().fetchAllNotes();
      notifyListeners();
    } else {
      print("Remove data");
    }
  }

  /// function update data
  Future<void> updateData(int id, String title, String desc) async {
    var check = await MyDBHelper().updateNotes(id, title, desc);
    if (check) {
      arrDataList = await MyDBHelper().fetchAllNotes();
      notifyListeners();
    } else {
      print("Update Data");
    }
  }

  /// fucn InitialData
  Future<void> getInitialData() async {
    arrDataList = await MyDBHelper().fetchAllNotes();
    notifyListeners();
  }
}
