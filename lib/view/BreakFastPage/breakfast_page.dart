import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class BreakFastPageView extends StatefulWidget {
  const BreakFastPageView({super.key});

  @override
  State<BreakFastPageView> createState() => _BreakFastPageViewState();
}

class _BreakFastPageViewState extends State<BreakFastPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Breakfast",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),
        ),
      ),
      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
                leading: IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
                trailing: IconButton(
                    onPressed: () {}, icon: Icon(Icons.refresh_outlined)),
                title: Text("List item $index"));
          }),
    );
  }
}
