import 'package:flutter/material.dart';
import 'utilities.dart' as util;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shared Preference Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Shared Preference Demo'),
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
  int groupValue = 0;
  String outPutText = 'No Data';

  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    util.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: <Widget>[
            TextField(
              controller: nameController,
              decoration: InputDecoration(hintText: 'Enter Name here'),
            ),
            TextField(
              controller: ageController,
              decoration: InputDecoration(hintText: 'Enter Age here'),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(
                  'Are you a Graduate?',
                  style: new TextStyle(fontSize: 16.0),
                ),
                new Radio(
                  value: 1,
                  groupValue: groupValue,
                  onChanged: onValueChanged,
                ),
                new Text(
                  'YES',
                  style: new TextStyle(fontSize: 16.0),
                ),
                new Radio(
                  value: 2,
                  groupValue: groupValue,
                  onChanged: onValueChanged,
                ),
                new Text(
                  'NO',
                  style: new TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: Text(outPutText),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100.0),
            ),
            RaisedButton(
              child: Text(
                'Save Data',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
              onPressed: () {
                util.saveData('name', nameController.text);
                util.saveData('age', int.parse(ageController.text));

                bool isGraduate = groupValue == 1 ? true : false;
                print(isGraduate);

                util.saveData('isGraduate', isGraduate);

                setState(() {
                  outPutText = 'Saved to Shared Preference';
                });
              },
            ),
            RaisedButton(
              child: Text(
                'Read Data',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
              onPressed: () {
                //Since reading from SharedPreference in Async
                String name = util.getSaveData('name') ?? 'NA';
                int age = util.getSaveData('age') ?? 0;

                groupValue = util.getSaveData('isGraduate') ?? false ? 1 : 2;
                String graduate = groupValue==1 ? 'Graduates' : 'Not a Graduate';

                nameController.text = name;
                ageController.text = age.toString();

                setState(() {
                  outPutText = 'Data from Shared Preference \n'
                      'Name: $name \n'
                      'Age: $age \n'
                      '$graduate \n';
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  /// Will set Radio Button selection and change selection on radio button
  onValueChanged(var i) {
    groupValue = i;
    setState(() {});
  }
}
