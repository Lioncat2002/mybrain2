import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mybrain2/data.dart';
import 'components/result_card.dart';
import 'dart:convert' as convert;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyBrain2',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

Future<http.Response> fetchData(String data) {
  return http.get(Uri.parse('https://mybrain2.fly.dev/$data'));
}

class _MyHomePageState extends State<MyHomePage> {
  var data = [];

  void updateData(String q) async {
    var d1 = await fetchData(q);
    var d = convert.jsonDecode(d1.body);
    setState(() {
      data = d["data"]["Get"]["Result"].map((m) => Data.fromJson(m)).toList();
    });
  }

  String d2 = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('My Brain 2'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Search...',
                      ),
                      onSubmitted: (value) {
                        d2 = value;
                        updateData(value);
                      },
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () => updateData(d2),
                      child: const Text("Search"))
                ],
              ),
              Center(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ResultCard(
                      title: data[index].title,
                      url: data[index].url,
                    );
                  },
                ),
              )
            ],
          ),
        ));
  }
}
