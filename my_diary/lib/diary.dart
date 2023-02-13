import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class Diary extends StatefulWidget {
  const Diary({Key? key}) : super(key: key);

  @override
  State<Diary> createState() => _DiaryState();
}

class _DiaryState extends State<Diary> {
  late String _userToDO;
  List todoList = [];
  final todaydate = DateFormat('dd-MM-yyyy, KK:mm').format(DateTime.now());

  @override
  void initState() {
    super.initState();

    todoList.addAll([]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 34, 10, 130),
      appBar: AppBar(
        title: const Text('Мій щоденник'),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
                key: Key(todoList[index]),
                child: Card(
                  child: ListTile(
                    title: Text(todoList[index]),
                    subtitle: Text(todaydate),
                  ),
                ),
                onDismissed: (direction) {
                  //if (direction == DismissDirection.endToStart );
                  setState(() {
                    todoList.removeAt(index);
                  });
                });
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.greenAccent,
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Додати запис'),
                  content: TextField(
                    onChanged: (String value) {
                      _userToDO = value;
                    },
                  ),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            todoList.add(_userToDO);
                          });

                          Navigator.of(context).pop();
                        },
                        child: const Text('Зберегти'))
                  ],
                );
              });
        },
        child: const Icon(
          Icons.add_box,
          color: Colors.white,
        ),
      ),
    );
  }
}
