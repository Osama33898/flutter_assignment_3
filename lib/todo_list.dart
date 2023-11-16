import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/todo_provider.dart';
import 'package:todo_app/style/theme.dart';
class TodoAction extends StatelessWidget {
 const TodoAction({Key? key}) : super(key: key);
 @override
 Widget build(BuildContext context) {
 final task = Provider.of<TodoProvider>(context);
return ListView.builder(
  itemCount: task.allTasks.length,
  
  itemBuilder: ((context, index) => ListTile(
    shape: RoundedRectangleBorder(
    side: BorderSide(color: Colors.black, width: 1),
    borderRadius: BorderRadius.circular(5),
    
  ), 
  
  
     leading: Checkbox(
              activeColor: sec_color,

       value: task.allTasks[index].completed,
       onChanged: ((_) => task.toggleTask(task.allTasks[index])),
     ),
     title: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
       children: [
         Text(task.allTasks[index].todoTitle,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
        Text(task.allTasks[index].todoDisc),

       ],
     ),
     trailing: IconButton(
       onPressed: () {
          task.deleteTask(task.allTasks[index]);
       },
       icon: const Icon(Icons.delete)),
    )),
  );
 }
}