import 'package:flutter/material.dart';
import 'package:provide_database_example/provider/database_provider.dart';
import 'package:provide_database_example/screens/taksadd.dart';
import 'package:provide_database_example/screens/update.dart';
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
    context.read<UserDataProvider>().getInitialData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider or DataBase"),
      ),
      body: Consumer<UserDataProvider>(
        //ctx = contex
        builder: (ctx, provider, child) {
          notes = provider.arrDataList;
          return Card(
            child: ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                var currNote = notes[index];
                return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Update(
                              id: currNote['note_id'],
                              desc: currNote['desc'],
                              name: currNote['title'],
                            ),
                          ));
                    },
                    child: ListTile(
                      leading: Text("${index + 1}"),
                      title: Text("${currNote['title']}"),
                      subtitle: Text("${currNote['desc']}"),
                      trailing: InkWell(
                          onTap: () async {
                            await provider.deletData(currNote["note_id"]);
                          },
                          child: Icon(Icons.delete)),
                    ));
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Provider.of<DataBase_Provider>(context, listen: false)
          //     .addData("Flutter", "Hkgjdg");
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddTaks(),
              ));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
