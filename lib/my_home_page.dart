import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/todo_provider.dart';
import 'package:todo_app/style/theme.dart';
import 'package:todo_app/todo_list.dart';
class MyHomePage extends StatefulWidget {
 const MyHomePage({Key? key}) : super(key: key);
 @override
 _MyHomePageState createState() => _MyHomePageState();
}
 class _MyHomePageState extends State<MyHomePage> {
  final _textFieldController = TextEditingController();
    final _textFieldDiscController = TextEditingController();
  bool _validate = false,booleanCondition=false;

  String newTask = '',newTaskDisc='';
 //creating initState() for adding listener to controller
 @override
 void initState() {
   super.initState();
   _textFieldController.addListener(() {
     newTask = _textFieldController.text;
          newTaskDisc = _textFieldDiscController.text;

   });
   _textFieldDiscController.addListener(() {
     newTask = _textFieldDiscController.text;
          newTaskDisc = _textFieldDiscController.text;

   });
   
 }
 //disposing the controller
 @override
 void dispose() {
   _textFieldController.dispose();
   super.dispose();
 }
 void _submit() {
   setState(() {
                  _validate = _textFieldController.text.isEmpty;
                });
  //we aren't interested in updating our ui so listen will be false
  Provider.of<TodoProvider>(context, listen:    false).addTask(newTask,newTaskDisc);
  //cancelling the dialog
  Navigator.pop(context);
  _textFieldController.clear();
 }
@override
Widget build(BuildContext context) {
 Future<void> _showAddTextDialog() async {
  return showDialog(
   context: context,
   builder: (context) {
    return AlertDialog(
     title: const Text("Add a new Task"),
         backgroundColor: primary_color,

     content:
     Column(
      // mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,

      children: [
         TextField(
          
      autofocus: true,
        decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
            ),
            fillColor: Colors.grey.shade200,
            filled: true,
            hintText: 'Add New Task',
                            errorText: _validate ? "Value Can't Be Empty" : null,

            hintStyle: TextStyle(color: Colors.grey[500])),
      controller: _textFieldController,
      onSubmitted: (_) => _submit(),
      
    ),
    SizedBox(height: 25,),
 TextField(
      autofocus: true,
      controller: _textFieldDiscController,
 decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
            ),
            fillColor: Colors.grey.shade200,
            filled: true,
            hintText: 'Add New Task',
            hintStyle: TextStyle(color: Colors.grey[500])),      onSubmitted: (_) => _submit(),
    ),
      ],
     ),
    
    actions: [
     ElevatedButton(
      
      
      // onPressed: _submit,
      onPressed: 
     () => _submit(),
      child: const Text("Submit"),
      style: ElevatedButton.styleFrom(
       minimumSize: const Size(120, 40),
       backgroundColor:sec_color
       
       ),
       
      )
     ],
     shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
     ),
     actionsAlignment: MainAxisAlignment.center,
    );
   });
  }
return Scaffold(
        backgroundColor: Color.fromARGB(255, 198, 87, 79),

 appBar: AppBar(
  title: const Text("ToDo App"),
        backgroundColor: Color.fromARGB(255, 109, 21, 15),


 ),
 body: TodoAction(),
 floatingActionButton: FloatingActionButton(
  backgroundColor: sec_color,
  onPressed: (() {
   _showAddTextDialog();
  }),
 child: const Icon(Icons.add),
 tooltip: "Add a todo",
   ),
  );
 }
}