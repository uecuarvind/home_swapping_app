import 'package:home_swipping/app/data/api_constants/api_key_constants.dart';
import 'package:home_swipping/app/data/api_constants/api_url_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;



import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketService {
  late IO.Socket _socket;
  bool _isConnected = false;

  // Initialize and connect the socket
  void connect(String url, String token) {
    if (_isConnected) return;

    _socket = IO.io(
      url,
      IO.OptionBuilder()
          .setTransports(['websocket']) // Use WebSocket transport
          .disableAutoConnect() // Disable auto-connect to handle it manually
          .setExtraHeaders({'Authorization': token}) // Pass token in headers
          .build(),
    );

    _socket.connect();

    _socket.on('connect', (_) {
      print('Connected to the WebSocket server');
      _isConnected = true;
    });

    _socket.on('disconnect', (_) {
      print('Disconnected from the WebSocket server');
      _isConnected = false;
    });

    _socket.on('connect_error', (err) {
      print('Connection error: $err');
    });
  }

  // Disconnect the socket
  void disconnect() {
    if (_isConnected) {
      _socket.disconnect();
      _isConnected = false;
    }
  }

  // Emit an event
  void emit(String event, dynamic data) {
    if (_isConnected) {
      _socket.emit(event, data);

    } else {
      print('Socket not connected. Unable to emit $event');
    }
  }

  // Listen to an event
  void on(String event, Function(dynamic) callback) {
    _socket.on(event, (data) {
      print('Data:----->${data.toString()}');
      callback(data);
    });
  }

  // Remove a listener
  void off(String event) {
    _socket.off(event);
  }

  // Specific handler for 'message' event
  void onMessage(Function(dynamic) callback) {
    on('message', (data) {
      print('Raw message data received: $data');
      callback(data);
    });
  }

  // Event-specific methods
  void onMessagePage(Function(dynamic) callback) => on('message-page', callback);
  void onMessageUser(Function(dynamic) callback) => on('message-user', callback);
  //void onMessage(Function(dynamic) callback) => on('message', callback);
  void onOnlineUser(Function(dynamic) callback) => on('onlineUser', callback);
  void onConversation(Function(dynamic) callback) => on('conversation', callback);

  void emitNewMessage(Map<String, dynamic> messageData) => emit('new message', messageData);
  void emitSeen(String msgByUserId) => emit('seen', msgByUserId);
  void emitJoinGroupRoom(String groupId) => emit('join-group-room', groupId);
}

