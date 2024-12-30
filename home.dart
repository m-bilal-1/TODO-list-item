//home.dart
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_list/todo_list.dart';
import 'package:todo_list/todo.dart';
import 'package:todo_list/todo.dart';

class todo_list extends StatefulWidget {
  todo_list({super.key});

  @override
  State<todo_list> createState() => _todo_listState();
}

class _todo_listState extends State<todo_list> {
  final todoList = Todo.todo_item();
  List<Todo> _foundToDo = [];
  final _todoController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    _foundToDo = todoList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue.shade100, Colors.purple.shade700], // Gradient colors
          begin: Alignment.topLeft,            // Gradient start point
          end: Alignment.bottomRight,          // Gradient end point
        ),),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: _buildAppBar(),
        body: Stack(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 15,
                ),
                child: Column(
                  children: [
                    searchbox(),
                    SizedBox(height: 30),
                    Divider(color: Colors.black, thickness: 1.5),
                    Expanded(
                      child: ListView(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 10, bottom: 20),
                            child: Text(
                              'ALL TO DO LIST',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.blueGrey.shade800,
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.5,
                              ),
                            ),
                          ),
                          for (Todo todoo in _foundToDo)
                            todo_item(
                              todo: todoo,
                              onToDoChange: _handleToDoChange,
                              onDeleteItem: _deleteToDoItem,
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(bottom: 20, right: 10, left: 20),
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blue.shade400,
                              offset: Offset(0, 4),
                              blurRadius: 8.0,
                              spreadRadius: 1.0,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: TextField(
                          controller: _todoController,
                          style: TextStyle(fontSize: 16),
                          decoration: InputDecoration(
                            hintText: 'Add a new To Do',
                            hintStyle: TextStyle(color: Colors.grey.shade600),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 20, right: 20),
                      child: ElevatedButton(
                        onPressed: () {
                          _addToDoItem(_todoController.text);
                        },
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(15),
                          backgroundColor: Colors.blueAccent,
                          elevation: 5,
                        ),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

      ),
    );
  }


  void _handleToDoChange(Todo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _deleteToDoItem(String id) {
    setState(() {
      todoList.removeWhere((item) => item.id == id);
    });
  }

  void _addToDoItem(String toDo) {
    setState(() {
      todoList.add(Todo(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          todotext: toDo));
    });
    _todoController.clear();
  }

  void _runFilter (String enteredkeyword) {
    List<Todo> results = [];
    if (enteredkeyword.isEmpty) {
      results = todoList;
    } else {
      results = todoList
          .where((item) => item.todotext!
              .toLowerCase()
              .contains(enteredkeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _foundToDo = results;
    });
  }
  Widget searchbox() {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          side: BorderSide(color: Colors.black,width: 1)
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            color: Colors.grey.shade300,
            child: TextField(
              onChanged: (value) => _runFilter(value),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(20),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  prefixIconConstraints:
                  BoxConstraints(maxHeight: 20, minWidth: 25),
                  hintText: 'Search'),
            ),
          )
        ],
      ),
    );
  }

}

AppBar _buildAppBar() {
  return AppBar(
    backgroundColor: Colors.transparent,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          Icons.menu,
          size: 25,
          color: Colors.black,
        ),
        Container(
          height: 50,
          width: 50,
          child: ClipRRect(child: Image.asset('assets/Images/bussiness-man.png',fit: BoxFit.fill,)),
        )
      ],
    ),
  );
}



