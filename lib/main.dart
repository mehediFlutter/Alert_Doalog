import 'package:flutter/material.dart';
import 'package:modiul5/fromVi.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        accentColor: Color.fromARGB(255, 181, 255, 183),
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // snackbar message method
  MySnackBar(context, message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  // Alert Dialog method

  MyAlertDialog(context) {
    return showDialog(
        context: context,
        builder: (context) {
          return Expanded(
              child: AlertDialog(
            title: Text('Alert !'),
            content: Text("Do you want to delete"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  MySnackBar(context, 'Delete Success');
                },
                child: Text("Yes"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  MySnackBar(context, 'Canceled');
                },
                child: Text('No'),
              ),
            ],
          ));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            MyAlertDialog(context);
          },
          child: Text("Alart Dialog"),
        ),
      ),
    );
  }
}
