import 'package:flutter/material.dart';
import 'package:legacy_progress_dialog/legacy_progress_dialog.dart';

class HomePage extends StatefulWidget {
  final String userMail;

  const HomePage({this.userMail});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Store"),
        centerTitle: true,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.userMail),
            ElevatedButton(
                onPressed: () {
                  ProgressDialog progressDialog = ProgressDialog(
                    loadingText: "جاري التحميل",
                    context: context,
                    backgroundColor: Colors.white,
                    textColor: Colors.black,
                  );

                  progressDialog.show();

                  Future.delayed(Duration(seconds: 5))
                      .then((value) => progressDialog.dismiss());
                },
                child: Text("press"))
          ],
        ),
      ),
    );
  }
}
