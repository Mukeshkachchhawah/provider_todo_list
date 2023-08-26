import 'package:flutter/material.dart';
import 'package:provide_database_example/provider/database_provider.dart';
import 'package:provider/provider.dart';

class HomaPage extends StatefulWidget {
  const HomaPage({super.key});

  @override
  State<HomaPage> createState() => _HomaPageState();
}

class _HomaPageState extends State<HomaPage> {
  List<Map<String, dynamic>> notes = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<DataBase_Provider>().getInitialData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider or DataBase"),
      ),
      body: Consumer<DataBase_Provider>(
        builder: (context, provider, child) {
          notes = provider.arrDataList;
          return ListView.builder(
            itemCount: notes.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  
                },
                child: ListTile(
                  leading: Text("${index+1}"),
                  title: Text("${notes[index]['title']}"),
                  subtitle: Text("${notes[index]['desc']}"),
                  trailing: InkWell(
                    onTap: () {
                      
                    },
                    child: Icon(Icons.delete)),
                ));
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<DataBase_Provider>().addData("Flutter", "Hkgjdg");
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
