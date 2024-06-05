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
        onPressed: () {},
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
      onTap: () {},
    );
  }
}
