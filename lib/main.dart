import 'dart:convert';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      title: 'json',
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
        backgroundColor: Colors.grey,
        body: FutureBuilder(
          future: DefaultAssetBundle.of(context).loadString("asset/data.json"),
          builder: (context, snapshot) {
            var mydata = json.decode(snapshot.data.toString());
            if (mydata == null) {
              return const Center(
                child: Text('loading'),
              );
            } else {
              return Container(
                color: Colors.blue,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        mydata["items"][0]["name"],
                        style: const TextStyle(fontSize: 20.0),
                      ),
                       Text(
                        mydata["items"][0]["surname"],
                        style: const TextStyle(fontSize: 20.0),
                      ),
                       Text(
                        mydata["items"][0]["fullname"],
                        style: const TextStyle(fontSize: 20.0),
                      ),
                       Text(
                        mydata["items"][0]["email"],
                        style: const TextStyle(fontSize: 20.0),
                      ),
                    ],
                  ),
                ),
              );
            }
          },
        ));
  }
}
