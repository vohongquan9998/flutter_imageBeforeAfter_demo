import 'package:flutter/material.dart';
import 'package:flutter_before_after/src/customWidget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double angle = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Angle(%)",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    angle = 0.0;
                    if (double.parse(value) <= 100)
                      angle = double.parse(value);
                    else
                      angle = 0.0;
                  });
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: BeforeAfter(
                beforeImage: Image.asset('assets/after.png'),
                afterImage: Image.asset('assets/before.png'),
                angle: angle / 100,
              ),
            ),
            // Expanded(
            //   flex: 1,
            //   child: BeforeAfter(
            //     beforeImage: Image.asset('assets/after.png'),
            //     afterImage: Image.asset('assets/before.png'),
            //     isVertical: true,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
