//todo_item.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/todo.dart';

class todo_item extends StatelessWidget {
  final Todo todo;
  final onToDoChange;
  final onDeleteItem;
  const todo_item({super.key,required this.todo, this.onToDoChange, this.onDeleteItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
        child: ListTile(
              onTap: () {
                onToDoChange(todo);

        print('CLicked on to do item');
              },
              shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
              ),
          contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
              tileColor: Colors.white,
              leading: Icon(
                todo.isDone?  Icons.check_box: Icons.check_box_outline_blank_sharp ,
        color: Colors.black,
              ),
              title: Text(
        todo.todotext!,
        style: TextStyle(
            fontSize: 16,
            color: Colors.black,
            decoration: todo.isDone? TextDecoration.lineThrough:null,
        ),
              ),
          trailing: Container(
            padding: EdgeInsets.all(0),
            margin: EdgeInsets.symmetric(vertical: 12,),
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(5)
            ),
            child: IconButton(
              color: Colors.white,
              iconSize: 18,
              icon: Icon(Icons.delete),
              onPressed: (){
                onDeleteItem(todo.id);
                print('CLicked on to delete item');
              },
        
            ),
          ),
            ));
  }
}
