import 'package:flutgrid/widgets/flutgrid.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Demo extends StatefulWidget {
  const Demo({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  // List of items that user adds
  final List<FlutGridItem> _gridItems = [];

  // Controllers for dialog input
  final TextEditingController xsController = TextEditingController(text: "12");
  final TextEditingController smController = TextEditingController(text: "6");
  final TextEditingController mdController = TextEditingController(text: "4");
  final TextEditingController lgController = TextEditingController(text: "3");
  final TextEditingController xlController = TextEditingController(text: "3");

  void _showAddItemDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Add Grid Item",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _numberField("XS", xsController),
              SizedBox(height: 20),
              _numberField("SM", smController),
              SizedBox(height: 20),
              _numberField("MD", mdController),
              SizedBox(height: 20),
              _numberField("LG", lgController),
              SizedBox(height: 20),
              _numberField("XL", xlController),
            ],
          ),
          actions: [
            OutlinedButton(
              onPressed: () => Navigator.pop(context),
              style: OutlinedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                side:
                    BorderSide(color: Theme.of(context).colorScheme.secondary),
                foregroundColor: Theme.of(context).colorScheme.secondary,
              ),
              child: Text("Cancel"),
            ),
            ElevatedButton(
              child: Text('Save'),
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
              ),
              onPressed: () {
                final xs = int.tryParse(xsController.text) ?? 12;
                final sm = int.tryParse(smController.text) ?? 12;
                final md = int.tryParse(mdController.text) ?? 12;
                final lg = int.tryParse(lgController.text) ?? 12;
                final xl = int.tryParse(xlController.text) ?? 12;

                setState(() {
                  _gridItems.add(
                    FlutGridItem(
                      xs: xs,
                      sm: sm,
                      md: md,
                      lg: lg,
                      xl: xl, // optional: mirror lg for xl
                      child: Container(
                        height: 150,
                        alignment: Alignment.center,
                        color: Colors
                            .primaries[
                                _gridItems.length % Colors.primaries.length]
                            .shade200,
                        child: Text(
                          "Item ${_gridItems.length + 1}\n($xs/$sm/$md/$lg/$xl)",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  );
                });
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  Widget _numberField(String label, TextEditingController controller) {
    return TextField(
      controller: controller,
      style: Theme.of(context).textTheme.bodyMedium,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly, // allow only digits
      ],
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        labelText: label,
        hintText: 'enter number here',
        hintStyle: Theme.of(context).textTheme.labelMedium,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: Theme.of(context).colorScheme.outline,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
      onChanged: (value) {
        if (value.isEmpty) return;
        final num = int.tryParse(value) ?? 1;

        if (num < 1) {
          controller.text = "1";
          controller.selection = TextSelection.fromPosition(
            TextPosition(offset: controller.text.length),
          );
        } else if (num > 12) {
          controller.text = "12";
          controller.selection = TextSelection.fromPosition(
            TextPosition(offset: controller.text.length),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: _gridItems.isEmpty
            ? ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height -
                      kToolbarHeight -
                      MediaQuery.of(context).padding.top,
                ),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 35,
                        backgroundColor: Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(0.1),
                        child: Icon(
                          Icons.info_outline,
                          size: 40,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "No Item Added",
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "No griditem have been added yet.\nClick on + button to add a new griditem.",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Colors.grey[600],
                            ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: _showAddItemDialog,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepPurple,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 16),
                            ),
                            child: Text("Add GridItem"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            : FlutGrid(
                spacing: 10.0,
                runSpacing: 10.0,
                children: _gridItems, // dynamic grid items
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddItemDialog,
        tooltip: 'Add Item',
        child: const Icon(Icons.add, color: Colors.white),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
