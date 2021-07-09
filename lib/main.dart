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
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: Text('Child Hold'),
              backgroundColor: Colors.black,
              //centerTitle: true,
            ),
            body: Home()));
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var ctrlWidth = TextEditingController();
  var ctrlLength = TextEditingController();
  var info = 'Detail';
  var total = '';

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'SA',
                style: TextStyle(fontSize: 65, fontFamily: 'raleway'),
              ),
              Text(
                'Square Area',
                style: TextStyle(fontSize: 20),
              ),
              Padding(
                padding: EdgeInsets.all(25),
                child: Image.asset('assets/logoAppL.png', width: 160),
              ),
              TextField(
                controller: ctrlWidth,
                decoration: InputDecoration(
                    labelText: 'Width', border: OutlineInputBorder()),
              ),
              Padding(padding: EdgeInsets.all(15)),
              TextField(
                controller: ctrlLength,
                decoration: InputDecoration(
                    labelText: 'Length', border: OutlineInputBorder()),
              ),
              Padding(padding: EdgeInsets.all(15)),
              ElevatedButton(
                  style: style1,
                  onPressed: () {
                    var v1 = int.parse(ctrlWidth.text);
                    var v2 = int.parse(ctrlLength.text);
                    var calculate = v1 * v2;
                    print("Cal: $calculate Units");

                    setState(() {
                      info = "Widht: $v1    Length: $v2";
                      total = "Area: $calculate";
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.done,
                          size: 35,
                        ),
                        Padding(padding: EdgeInsets.all(4)),
                        Text(
                          'Done',
                          style: TextStyle(fontSize: 28),
                        ),
                      ],
                    ),
                  )),
              Padding(padding: EdgeInsets.all(20)),
              Text(info, style: TextStyle(fontSize: 18)),
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(total, style: TextStyle(fontSize: 30)),
              )
            ],
          ),
        )
      ],
    );
  }
}

final ButtonStyle style1 = ElevatedButton.styleFrom(
    onPrimary: Colors.white,
    primary: Colors.black,
    maximumSize: Size(170, 60),
    padding: EdgeInsets.symmetric(horizontal: 30),
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(4))));
