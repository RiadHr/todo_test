import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app_test/models/task.dart';
import 'package:to_do_app_test/provider/task_provider.dart';

class AddTaskPage extends StatefulWidget {
  AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  String title="";
  String description = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Center(child: Text("Add Task",style: TextStyle(fontSize: 32,fontWeight: FontWeight.w700),)),
          const SizedBox(height: 16,),
          TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                label: const Text("title")
            ),
            onChanged: (value) {
              setState(() {
                title = value;
              });
            },
          ),
          const SizedBox(height: 16,),
          TextField(
            onChanged: (value) {
              setState(() {
                description = value;
              });
            },
            maxLines: 3,
            decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              label: const Text("description"),
            ),
          ),
          const SizedBox(height: 16,),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.black),
                    elevation: MaterialStateProperty.all(5),
                    backgroundColor: MaterialStateProperty.all(Colors.deepPurpleAccent)),
                onPressed: () {
                  context.read<TaskProvider>().addTask(Task(title: title,description:description));
                },
                child: const Text("Add",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500),)
            ),
          ),
        ],
      ),
    );
  }
}