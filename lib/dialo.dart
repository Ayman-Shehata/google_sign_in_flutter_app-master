import 'package:flutter/material.dart';
import 'package:legacy_progress_dialog/legacy_progress_dialog.dart';

class ExampleScreen extends StatefulWidget {
  @override
  _ExampleScreenState createState() => _ExampleScreenState();
}

class _ExampleScreenState extends State<ExampleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Progress Dialog'),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Center(
            child: ElevatedButton(
          child: Text('Show Progress Dialog'),
          style: ElevatedButton.styleFrom(
            primary: Colors.green,
            textStyle: TextStyle(color: Colors.amber),
          ),
          onPressed: () {
            ProgressDialog progressDialog = ProgressDialog(
              context: context,
              backgroundColor: Colors.blue,
              textColor: Colors.white,
            );

            progressDialog.show();
            Future.delayed(Duration(seconds: 3))
                .then((value) => progressDialog.dismiss());
          },
        )));
  }
}
