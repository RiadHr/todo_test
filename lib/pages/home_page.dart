import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app_test/provider/task_provider.dart';

import '../models/task.dart';
import 'add_task_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Task> tasks =[Task()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child:Consumer<TaskProvider>(
          builder:(context, value, child) {
               return ListView.builder(
                 // itemCount: context<TaskProvider>,
                 itemBuilder:(context, index) {
                 return const Text("slm");
               },);
        },)
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:() => showModalBottomSheet(context: context,
            builder: (context) => AddTaskPage(),),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
