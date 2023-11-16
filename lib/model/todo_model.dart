class TodoModel {
String todoTitle;
String todoDisc;

bool completed;
TodoModel({required this.todoTitle, this.completed = false, required this.todoDisc});
void toggleCompleted() {
completed = !completed;
 }
}