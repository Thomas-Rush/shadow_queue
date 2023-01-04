import 'package:flex_color_scheme/flex_color_scheme.dart';
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
      title: 'Shadow Queue',
      theme: FlexThemeData.light(
        scheme: FlexScheme.sakura,
        useMaterial3: true,
      ),
      darkTheme:
          FlexThemeData.dark(scheme: FlexScheme.sakura, useMaterial3: true),
      home: const MyHomePage(title: 'Shadow Queue'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> _queueList = [];

  final TextEditingController _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Add to queue'),
                      content: TextField(
                        controller: _textFieldController,
                        decoration: const InputDecoration(hintText: "Username"),
                      ),
                      actions: [
                        ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _queueList.add(_textFieldController.text);
                                Navigator.pop(context);
                              });
                            },
                            child: const Text('Add'))
                      ],
                    );
                  },
                );
              },
              icon: const Icon(Icons.add))
        ],
        title: Text(widget.title),
      ),
      body: _queueList.isEmpty
          ? const Center(child: Text('Empty'))
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListView.builder(
                itemCount: _queueList.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Text(
                            _queueList[index],
                            style: const TextStyle(fontSize: 20),
                          ),
                          const Spacer(),
                          IconButton(onPressed: () {
                            setState(() {
                              _queueList.removeAt(index);
                            });
                          }, icon: const Icon(Icons.backspace))
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
