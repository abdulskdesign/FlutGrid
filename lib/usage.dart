import 'package:flutgrid/widgets/flutgrid.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
 


class Usage extends StatefulWidget {
  const Usage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Usage> createState() => _UsageState();
}

class _UsageState extends State<Usage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        title: Text(widget.title,
        style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),),
        actions: [
        ],
      ),
      body: SingleChildScrollView( 
        padding: EdgeInsets.all(10),
        child: Column( 
          children: [
              FlutGrid(
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
                    child: const Text('Item 1 (12/6/4/4/4)', textAlign: TextAlign.center),
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
                    child: const Text('Item 2 (12/6/4/4/4)', textAlign: TextAlign.center),
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
                    child: const Text('Item 3 (12/12/4/4/4)', textAlign: TextAlign.center),
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
                    child: const Text('Item 4 (12/4/3)', textAlign: TextAlign.center),
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
                    child: const Text('Item 5 (12/8/9)', textAlign: TextAlign.center),
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
                    child: const Text('Item 6 (6/6/3/2)', textAlign: TextAlign.center),
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
                    child: const Text('Item 7 (6/6/3/2)', textAlign: TextAlign.center),
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
                    child: const Text('Item 8 (12/12/6/8)', textAlign: TextAlign.center),
                  ),
                ),
              ],
            ),




            
            ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        tooltip: 'Increment',
        child: const Icon(Icons.add, color: Colors.white,),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
