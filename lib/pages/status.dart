import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/services.dart';

class StatusPage extends StatelessWidget {
  const StatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    final socketService = Provider.of<SocketService>(context);

    return Scaffold(
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('Server Status: ${socketService.serverStatus}')],
        )),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.message),
            onPressed: () {
              socketService.emit('emit-new-message',
                  {'name': 'Flutter', 'message': 'Hello from Flutter'});
            }));
  }
}
