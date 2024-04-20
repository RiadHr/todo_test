import 'package:flutter/material.dart';

class AddTaskPage extends StatelessWidget {
   AddTaskPage({super.key});
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
            const Center(child: Text("Add Task")),
            const SizedBox(height: 16,),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                label: const Text("title")
              ),
            ),
            const SizedBox(height: 16,),
            TextField(
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
                  onPressed: () {

                  },
                  child: Text("Add")
              ),
            )
        ],
      ),
    );
  }
}
