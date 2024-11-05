import 'package:fetch_api_flutter_example/api_code.dart';
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
  String searchtext = "";
  filter() {
    return comments.where((comment) {
      return comment["name"].toLowerCase().contains(searchtext.toLowerCase());
    }).toList();
  }

  List<dynamic> comments = [];
  Future<void> getcomments() async {
    try {
      final data = await ApiCode.fetchData();
      setState(() {
        comments = data;
      });
    } catch (e) {}
  }

  @override
  void initState() {
    getcomments();
  }

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
              Padding(
                padding:
                    EdgeInsets.only(top: 5, left: 15, right: 15, bottom: 15),
                child: SearchBar(
                  onChanged: (value) {
                    setState(() {
                      searchtext = value;
                    });
                  },
                  leading: Icon(Icons.search),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: filter().length,
                  itemBuilder: (context, index) {
                    final comment = filter()[index];
                    return Card(
                        elevation: 5,
                        child: Padding(
                          padding: EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                comment["name"],
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueAccent),
                              ),
                              Text(
                                comment["email"],
                                style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    color:
                                        const Color.fromARGB(255, 92, 88, 88)),
                              ),
                              Text(comment["body"]),
                            ],
                          ),
                        ));
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
