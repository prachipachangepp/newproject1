import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:newproject1/usermodal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  UserModel userObject = new UserModel(
      email: "prachi@gmail.com", fullname: "Prachi Pachange", id: "0001");

  String userJSON =
      '{"id":"0001", "email": "prachi@gmail.com", "fullname": "Prachi Pachange"}';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Row(
          children: [
            ElevatedButton(
                onPressed: () {
                  ///objec to map
                  Map<String, dynamic> userMap = userObject.toMap();
                  var json = jsonEncode(userMap);

                  ///map encode to json
                  print(json.toString());
                },
                child: Text("Serialize")),
            ElevatedButton(
                onPressed: () {
                  ///json decoded to map
                  ///map to usermodal(object)
                  var decoded = jsonDecode(userJSON);
                  Map<String, dynamic> userMap = decoded;
                  UserModel newUser = UserModel.fromMap(userMap);

                  ///json converted to object
                  print(newUser.fullname.toString());
                },
                child: Text("De-serialize"))
          ],
        ),
      )),
    );
  }
}
