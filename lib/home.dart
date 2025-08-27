import 'package:flutgrid/demo.dart';
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
        title: Text(
          widget.title,
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        ),
        actions: [
           
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.titleMedium,
              foregroundColor: Theme.of(context).colorScheme.onPrimary,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Demo(title: 'Demo Usage')),
              );
            },
            child: Text('Demo Usage'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 550,
              padding: EdgeInsets.all(20),
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                colors: [
                  Color(0xff85b1f1),
                  Color(0xffdfeaf7),
                  Color(0xffe8dbef)
                ],
                stops: [0.1, 0.5, 0.9],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Big logo/icon
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      "FG",
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  // Title
                  Text(
                    "Build fast, responsive sites with FlutGrid",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  const SizedBox(height: 10),
                  // Subtitle
                  Text(
                    "A powerful grid system for Flutter. Customize, extend, and build responsive apps faster.",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 30),
                  // Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 16),
                        ),
                        icon: const Icon(Icons.book),
                        label: const Text("Read the Docs"),
                      ),
                      SizedBox(width: 20),
                      OutlinedButton.icon(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 16),
                          side: BorderSide(
                              color: Theme.of(context).colorScheme.secondary),
                          foregroundColor:
                              Theme.of(context).colorScheme.secondary,
                        ),
                        icon: Icon(Icons.file_download),
                        label: Text("Download"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(15),
              child: FlutGrid(
                spacing: 10.0, // Horizontal space between grid items
                runSpacing: 10.0, // Vertical space between rows of grid items
                children: [
                  FlutGridItem(
                    xs: 12,
                    sm: 6,
                    md: 4,
                    lg: 4,
                    xl: 4,
                    child: Container(
                      height: 150,
                      color: Colors.red.shade200,
                      alignment: Alignment.center,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Item 1', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold),),
                          Text('(xs-12)(sm-6)(md-4)(lg-4)(xl-4)', textAlign: TextAlign.center),
                        ],
                      ), 
                    ),
                  ),
                  FlutGridItem(
                    xs: 12,
                    sm: 6,
                    md: 4,
                    lg: 4,
                    xl: 4,
                    child: Container(
                      height: 150,
                      color: Colors.green.shade200,
                      alignment: Alignment.center,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Item 2', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),),
                          Text('(xs-12)(sm-6)(md-4)(lg-4)(xl-4)', textAlign: TextAlign.center),
                        ],
                      ), 
                    ),
                  ),
                  FlutGridItem(
                    xs: 12,
                    sm: 12, // Full width on SM to force new row
                    md: 4,
                    lg: 4,
                    xl: 4,
                    child: Container(
                      height: 150,
                      color: Colors.blue.shade200,
                      alignment: Alignment.center,
                      child:  Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Item 3', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),),
                          Text('(xs-12)(sm-12)(md-4)(lg-4)(xl-4)', textAlign: TextAlign.center),
                        ],
                      ),  
                    ),
                  ),

                  // Example 2: Different spans for different items
                  FlutGridItem(
                    xs: 12,
                    sm: 4,
                    md: 3,
                    child: Container(
                      height: 150,
                      color: Colors.purple.shade200,
                      alignment: Alignment.center,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Item 4', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),),
                          Text('(xs-12)(sm-4)(md-3)', textAlign: TextAlign.center),
                        ],
                      ),   
                    ),
                  ),
                  FlutGridItem(
                    xs: 12,
                    sm: 8,
                    md: 9,
                    child: Container(
                      height: 150,
                      color: Colors.orange.shade200,
                      alignment: Alignment.center,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Item 5', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),),
                          Text('(xs-12)(sm-8)(md-9)', textAlign: TextAlign.center),
                        ],
                      ),   
                    ),
                  ),

                  // Example 3: Items with fixed size on larger screens
                  FlutGridItem(
                    xs: 6,
                    sm: 6,
                    md: 3,
                    lg: 2,
                    child: Container(
                      height: 150,
                      color: Colors.teal.shade200,
                      alignment: Alignment.center,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Item 6', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),),
                          Text('(xs-6)(sm-6)(md-3)(lg-2)', textAlign: TextAlign.center),
                        ],
                      ),    
                    ),
                  ),
                  FlutGridItem(
                    xs: 6,
                    sm: 6,
                    md: 3,
                    lg: 2,
                    child: Container(
                      height: 150,
                      color: Colors.indigo.shade200,
                      alignment: Alignment.center,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Item 7', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),),
                          Text('(xs-6)(sm-6)(md-3)(lg-2)', textAlign: TextAlign.center),
                        ],
                      ),     
                    ),
                  ),
                  FlutGridItem(
                    xs: 12,
                    sm: 12,
                    md: 6,
                    lg: 8,
                    child: Container(
                      height: 150,
                      color: Colors.brown.shade200,
                      alignment: Alignment.center,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Item 8', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),),
                          Text('(xs-12)(sm-12)(md-6)(lg-8)', textAlign: TextAlign.center),
                        ],
                      ),    
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
