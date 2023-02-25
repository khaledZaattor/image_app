// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'data-structure/provences.dart';

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
      theme: ThemeData.dark(),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double height = 0;
  double width = 0;
  double imageWidth = 0;
  double imageHeight = 0;
  int provence = 0;
  String image2 = '';
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      if (provence < 13) provence++;
    });
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    imageWidth = width * (2 / 3); // flex
    imageHeight = imageWidth * (9 / 12); // aspec ratio
    image2 = 'syria';

    return Scaffold(
        // appBar: AppBar(
        //     title: const Text("Set Aspect Ratio on Image Size"), //appbar title
        //     backgroundColor: Colors.redAccent //appbar background color
        //     ),
        body: Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 2,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: AspectRatio(
                  aspectRatio: 12 / 9,
                  // fit: BoxFit.fill, //aspect ratio for Image
                  child: Image.asset(
                      'images/${provences.values.elementAt(provence)}'),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Container 2'),
              Text('Height: $height'),
              Text('Width: $width'),
              Text('Image'),
              Text('Height: $imageHeight'),
              Text('Width: $imageWidth'),
              RawMaterialButton(
                onPressed: _incrementCounter,
                shape: const StadiumBorder(),
                fillColor: Color.fromARGB(255, 19, 112, 189),
                padding: const EdgeInsets.all(12.0),
                elevation: 0.0,
                child: Text(
                  'clear',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}

Positioned region({
  required BuildContext context,
  double topPosition = 185,
  double leftPosition = 560,
  double regionHight = 130,
  double regionwidth = 350,
  int regionAnswerNumber = 1,
  String boxAnswerText = 'الكبين',
  double originalWidth = 1920,
  double originalHight = 960,
  Color color = Colors.greenAccent,
}) {
  double newWidth = (MediaQuery.of(context).size.width) * (2 / 3);
  double newHight = (newWidth) * (9 / 12);
  return Positioned(
    top: topPosition * (newHight / originalHight),
    left: leftPosition * (newWidth / originalWidth),
    child: MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (event) {},
      child: GestureDetector(
        onTap: () {},
        child: SizedBox(
          width: regionwidth * (newWidth / originalWidth),
          height: regionHight * (newHight / originalHight),
          child: Container(
            color: Colors.greenAccent,
            child: Text(
              boxAnswerText,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    ),
  );
}
