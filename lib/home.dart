//


import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _titleTEcontroller = TextEditingController();
  final TextEditingController _descriptionTEcontroller = TextEditingController();

  List<ToDo> todos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(onPressed: (){
            todos.clear();
            if(mounted){
              setState(() {});
            }
          }, icon: const Icon(Icons.playlist_remove)),

        ],
      ),
      body: ListView.separated(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return ListTile(
            onLongPress: (){
              todos[index].isDone = !todos[index].isDone;
              if(mounted){
                setState(() {});
              }
            },
            leading: todos[index].isDone
                ? const Icon(Icons.done)
                : const Icon(Icons.close),
            title: Text(todos[index].title),
            subtitle: Text(todos[index].description),
            trailing: IconButton(
              icon: const Icon(Icons.delete_forever),
              onPressed: () {
                todos.removeAt(index);
                if (mounted) {
                  setState(() {});
                }

              },
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const Divider(
            height: 0,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddNewToDoModalSheet();

          // todos.add(ToDo('Title', 'Desc', false));
          // if (mounted) {
          //   setState(() {});
          // }
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void showAddNewToDoModalSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const Text('Add New ToDo'),
                TextField(
                  controller: _titleTEcontroller,
                  decoration: const InputDecoration(hintText: 'Title'),
                ),
                TextField(
                  controller: _descriptionTEcontroller,
                  decoration: const InputDecoration(hintText: 'Description'),
                ),
                ElevatedButton(
                    onPressed: () {
                      if (_titleTEcontroller.text.trim().isNotEmpty &&
                          _descriptionTEcontroller.text.trim().isNotEmpty) {
                        todos.add(ToDo(_titleTEcontroller.text.trim(),
                            _descriptionTEcontroller.text.trim(), false));
                        if (mounted) {
                          setState(() {});
                          _titleTEcontroller.clear();
                          _descriptionTEcontroller.clear();
                          Navigator.pop(context);
                        }
                      }
                    },
                    child: const Text('Add'))
              ],
            ),
          );
        });
  }
}

class ToDo {
  String title, description;
  bool isDone;
  ToDo(this.title, this.description, this.isDone);
}
