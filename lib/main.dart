import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  Size size = Size(0, 0);
  bool isOpen = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    print("size width : ${size.width}");
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            child: Icon(Icons.menu),
            onTap: () {
              setState(() {
                isOpen = !isOpen;
              });
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Center(
            child: Text("Animation Screen"),
          ),
          AnimatedContainer(
            curve: Curves.easeInOutBack, // esseInOut
            duration: Duration(seconds: 2),
            height: double.infinity,
            width: size.width * (2 / 3),
            color: Colors.blue,
            transform: Matrix4.translationValues(isOpen ? size.width *(2/3) : size.width, 0, 0),
          ),
        ],
      ),
    );
  }
}
