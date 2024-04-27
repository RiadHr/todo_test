import 'package:flutter/widgets.dart';
import '../models/task.dart';

class TaskProvider extends ChangeNotifier{
  List<Task> tasks=[Task(title: "first task",description: "go gym")];


  void addTask(Task task){
    tasks.add(task);
    notifyListeners();
  }

  void deleteTask(Task task){
    tasks.remove(task);
    notifyListeners();
  }

  void editTask(String title,String description,bool isDone,int index){
    tasks[index].title = title;
    tasks[index].description = description;
    tasks[index].isDone = isDone;
    notifyListeners();
  }
}