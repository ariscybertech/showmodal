import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  MyHomePage(),
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({ Key? key }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _selectedItem = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              child: Text('Show'),
              onPressed: () => _onButtonPressed(),
            ),
            Text(
              _selectedItem,
              style: TextStyle(fontSize: 30),
            )
          ],
        ),
      ),
    );
  }

  void _onButtonPressed() {
    showModalBottomSheet(context: context, builder: (context) {
      return Column(
        children: [
          ListTile(
            leading: Icon(Icons.ac_unit),
            title: Text('Cooling'),
            onTap: () => _selectItem('Cooling'),
          ),
          ListTile(
            leading: Icon(Icons.accessibility_new),
            title: Text('People'),
            onTap: () => _selectItem('People'),
          ),
          ListTile(
            leading: Icon(Icons.assessment),
            title: Text('Stats'),
            onTap: () => _selectItem('Stats'),
          )
        ],
      );
    });
  }

  void _selectItem(String name) {
    Navigator.pop(context);

    setState(() {
      _selectedItem = name;
    });
  }
}