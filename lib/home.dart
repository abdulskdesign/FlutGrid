import 'package:flutgrid/usage.dart';
import 'package:flutgrid/widgets/flutgrid.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
 


class Home extends StatefulWidget {
  const Home({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        automaticallyImplyLeading: true, 
        title: Text(widget.title, 
        style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        ),
        actions: [
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.titleMedium,
              foregroundColor: Theme.of(context).colorScheme.onPrimary, 
            ),
            onPressed: (){ Navigator.push(context, MaterialPageRoute(builder: (context) => Usage(title: 'Usage')),); }, 
            child: Text('Usage'),
          ),
        ],
      ),
      body: SingleChildScrollView( 
        padding: EdgeInsets.all(10),
        child: Column( 
          children: [
              Text('Build fast, responsive sites with FlutGrid',
              style: Theme.of(context).textTheme.displayLarge, 
              ),
            ],
        ),
      ),
    );
  }
}
