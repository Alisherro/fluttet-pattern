import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FactoryMethodExample extends StatefulWidget {
  const FactoryMethodExample({super.key});

  @override
  _FactoryMethodExampleState createState() => _FactoryMethodExampleState();
}

class _FactoryMethodExampleState extends State<FactoryMethodExample> {
  final List<CustomDialog> customDialogList = [
    AndroidAlertDialog(),
    IosAlertDialog(),
  ];

  int _selectedDialogIndex = 0;

  Future _showCustomDialog(BuildContext context) async {
    final selectedDialog = customDialogList[_selectedDialogIndex];

    await selectedDialog.show(context);
  }

  void _setSelectedDialogIndex(int? index) {
    setState(() {
      _selectedDialogIndex = index!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Test factory'),),
      body: ScrollConfiguration(
        behavior: const ScrollBehavior(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 10),
              TextButton(
                onPressed: () => _showCustomDialog(context),
                child: const Text('Show Dialog'),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedDialogIndex,
        onTap: _setSelectedDialogIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'a'),
          BottomNavigationBarItem(icon: Icon(Icons.minimize),label: 'b'),
        ],
      ),
    );
  }
}

abstract class CustomDialog {
  String getTitle();

  Widget create(BuildContext context);

  Future<void> show(BuildContext context) async {
    final dialog = create(context);

    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return dialog;
      },
    );
  }
}

class AndroidAlertDialog extends CustomDialog {
  @override
  String getTitle() {
    return 'Android Alert Dialog';
  }

  @override
  Widget create(BuildContext context) {
    return AlertDialog(
      title: Text(getTitle()),
      content: const Text('This is the material-style alert dialog!'),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Close'),
        ),
      ],
    );
  }
}

class IosAlertDialog extends CustomDialog {
  @override
  String getTitle() {
    return 'iOS Alert Dialog';
  }

  @override
  Widget create(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(getTitle()),
      content: const Text('This is the cupertino-style alert dialog!'),
      actions: <Widget>[
        CupertinoButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Close'),
        ),
      ],
    );
  }
}
