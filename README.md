# Neonpen

A Flutter package to add a Neon Pen effect on text.<br>
When it is built, list item is shown by sliding and bouncing.
<br><br>


# Preview
<img src="https://user-images.githubusercontent.com/24351423/176856029-1df732e2-8e93-4a38-b98d-6d416ca450a6.png" width="300">





# Installation

Add `neonpen: ^1.0.0` to your `pubspec.yaml` dependecies. And import it:

```
import 'package:neonpen/neonpen.dart';
```
<br>

# How to use
Simply add a Animation List widget with required params.

```
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
              emphasisWidth: 10,
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
```
<br>

# Properties
| Attribute | Data type | Description | Default |
|--|--|--|--|
| text | Text | A Text widget that will be covered by neonpen effect | - |
| color | Color | A color of neonpen style | - |
| opacity | double | An opacity of neonpen style | 0.5 |
| padding | EdgeInsets | A padding of between Text widget and neonpen style | EdgeInsets.symmetric(horizontal: 5) |
| emphasisWidth | double | The start and end's neonpen style thickness | 5.0 |
| emphasisOpacity | double | An opacity of the start and end's neonpen style | 0.55 |
| emphasisAngleDegree | double | An angle degree of the start and end's neonpen style | 1 |
| enableLineZiggle | bool | Add a ziggle style to neonpen line | false |
| lineZiggleLevel | double | A level of ziggle style to neonpen line | 1 |
| isDoubleLayer | bool | Add a two neopen style on Text widget | false |
