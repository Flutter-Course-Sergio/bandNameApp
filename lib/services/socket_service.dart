import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

enum ServerStatus { online, offline, connecting }

class SocketService with ChangeNotifier {
  ServerStatus _serverStatus = ServerStatus.connecting;
  late io.Socket _socket;

  SocketService() {
    _initConfig();
  }

  void _initConfig() {
    _socket = io.io('https://88g5wr91-3000.usw3.devtunnels.ms/', {
      'transports': ['websocket'],
      'autoConnect': true
    });
    _socket.onConnect((_) {
      _serverStatus = ServerStatus.online;
      notifyListeners();
    });

    _socket.onDisconnect((_) {
      _serverStatus = ServerStatus.offline;
      notifyListeners();
    });
  }

  ServerStatus get serverStatus => _serverStatus;
  io.Socket get socket => _socket;
  Function get emit => _socket.emit;
}
