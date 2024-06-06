import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

enum ServerStatus { online, offline, connecting }

class SocketService with ChangeNotifier {
  ServerStatus _serverStatus = ServerStatus.connecting;

  SocketService() {
    _initConfig();
  }

  void _initConfig() {
    io.Socket socket = io.io('https://88g5wr91-3000.usw3.devtunnels.ms/', {
      'transports': ['websocket'],
      'autoConnect': true
    });
    socket.onConnect((_) {
      _serverStatus = ServerStatus.online;
      notifyListeners();
    });

    socket.onDisconnect((_) {
      _serverStatus = ServerStatus.offline;
      notifyListeners();
    });

    socket.on('new-message', (payload) {
      final name = payload.containsKey('name') ? payload['name'] : 'No name';
      final message =
          payload.containsKey('message') ? payload['message'] : 'No message';

      print('name: $name');
      print('message: $message');
    });
  }

  get serverStatus => _serverStatus;
}
