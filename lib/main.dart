import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("AppBar"),
        ),
        body: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              SearchBar(),
              Expanded(
                child: ListView.builder(
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text("Hi"),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
