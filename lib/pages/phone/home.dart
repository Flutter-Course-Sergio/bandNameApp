import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/models.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Band> bands = [
    Band(id: "1", name: "Metallica", votes: 5),
    Band(id: "2", name: "Queen", votes: 1),
    Band(id: "3", name: "Héroes del Silencio", votes: 2),
    Band(id: "4", name: "Bon Jovi", votes: 5),
  ];

  @override
  Widget build(BuildContext context) {
    const textStyle1 = TextStyle(color: Colors.black87);

    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: const Text(
          'BandNames',
          style: textStyle1,
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
          itemCount: bands.length,
          itemBuilder: (context, i) => bandTile(bands[i])),
      floatingActionButton: FloatingActionButton(
        elevation: 1,
        onPressed: addNewBand,
        child: const Icon(Icons.add),
      ),
    );
  }

  ListTile bandTile(Band band) {
    const votesStyle = TextStyle(fontSize: 20);

    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.blue[100],
        child: Text(band.name!.substring(0, 2)),
      ),
      title: Text(band.name!),
      trailing: Text(
        '${band.votes}',
        style: votesStyle,
      ),
      onTap: () {
        print(band.name!);
      },
    );
  }

  addNewBand() {
    final textController = TextEditingController();

    if (Platform.isAndroid) {
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('New Band name: '),
              content: TextField(
                controller: textController,
              ),
              actions: [
                MaterialButton(
                  elevation: 5,
                  onPressed: () => addBandToList(textController.text),
                  textColor: Colors.blue,
                  child: const Text('Add'),
                )
              ],
            );
          });
    }

    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
            title: const Text('New Band name: '),
            content: TextField(
              controller: textController,
            ),
            actions: [
              CupertinoDialogAction(
                isDefaultAction: true,
                onPressed: () => addBandToList(textController.text),
                child: const Text('Add'),
              ),
              CupertinoDialogAction(
                isDestructiveAction: true,
                onPressed: () => Navigator.pop(context),
                child: const Text('Dismiss'),
              )
            ]);
      },
    );
  }

  void addBandToList(String name) {
    if (name.length > 1) {
      bands.add(Band(id: DateTime.now.toString(), name: name, votes: 0));
      setState(() {});
    }

    Navigator.pop(context);
  }
}
