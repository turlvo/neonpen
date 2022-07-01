import 'package:flutter/material.dart';
import 'package:neonpen/neonpen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Neonpen(
              text: Text(
                'Hello World!',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              color: Colors.red,
              opacity: 0.3,
              emphasisWidth: 5,
              emphasisOpacity: 0.3,
              emphasisAngleDegree: 0.5,
              enableLineZiggle: true,
              lineZiggleLevel: 0,
              isDoubleLayer: false,
            ),
            SizedBox(height: 30),
            Neonpen(
              text: Text(
                'Hello World!',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              color: Colors.yellow,
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              opacity: 0.3,
              emphasisWidth: 5,
              emphasisOpacity: 0.3,
              emphasisAngleDegree: 0.5,
              enableLineZiggle: true,
              lineZiggleLevel: 1,
              isDoubleLayer: false,
            ),
            SizedBox(height: 30),
            Neonpen(
              text: Text(
                'Hello World!',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              color: Colors.orange,
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              opacity: 0.3,
              emphasisWidth: 5,
              emphasisOpacity: 0.3,
              emphasisAngleDegree: 0.5,
              enableLineZiggle: true,
              lineZiggleLevel: 1,
              isDoubleLayer: false,
            ),
            SizedBox(height: 30),
            Neonpen(
              text: Text(
                'Hello World!',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              color: Colors.grey,
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              opacity: 0.7,
              emphasisWidth: 5,
              emphasisOpacity: 0.5,
              emphasisAngleDegree: 0.5,
              enableLineZiggle: true,
              lineZiggleLevel: 1,
              isDoubleLayer: false,
            ),
            SizedBox(height: 30),
            Neonpen(
              text: Text(
                'Hello World!',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              color: Colors.blue,
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              opacity: 0.3,
              emphasisWidth: 15,
              emphasisOpacity: 0.3,
              emphasisAngleDegree: 2,
              enableLineZiggle: true,
              lineZiggleLevel: 1,
              isDoubleLayer: false,
            ),
            SizedBox(height: 30),
            Neonpen(
              text: Text(
                'Hello World!',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              color: Colors.purple,
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              opacity: 0.3,
              emphasisWidth: 10,
              emphasisOpacity: 0.3,
              emphasisAngleDegree: 2,
              enableLineZiggle: true,
              lineZiggleLevel: 2,
              isDoubleLayer: false,
            ),
            SizedBox(height: 30),
            Neonpen(
              text: Text(
                'Hello World!',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              color: Colors.green,
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              opacity: 0.3,
              emphasisWidth: 5,
              emphasisOpacity: 0.3,
              emphasisAngleDegree: 0.5,
              enableLineZiggle: true,
              lineZiggleLevel: 1,
              isDoubleLayer: true,
            ),
            SizedBox(height: 30),
            Neonpen(
              text: Text(
                'Hello World!',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              color: Colors.lime,
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              opacity: 0.3,
              emphasisWidth: 5,
              emphasisOpacity: 0.3,
              emphasisAngleDegree: 2,
              enableLineZiggle: true,
              lineZiggleLevel: 1,
              isDoubleLayer: true,
            ),
            SizedBox(height: 30),
            Neonpen(
              text: Text(
                'Hello World!',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              color: Colors.amber,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              opacity: 0.3,
              emphasisWidth: 5,
              emphasisOpacity: 0.3,
              emphasisAngleDegree: 0.5,
              enableLineZiggle: true,
              lineZiggleLevel: 1,
              isDoubleLayer: true,
            ),
            SizedBox(height: 30),
            Neonpen(
              text: Text(
                'Hello World!',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              color: Colors.indigo,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              opacity: 0.3,
              emphasisWidth: 8,
              emphasisOpacity: 0.1,
              emphasisAngleDegree: 0.8,
              enableLineZiggle: true,
              lineZiggleLevel: 1,
              isDoubleLayer: true,
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
