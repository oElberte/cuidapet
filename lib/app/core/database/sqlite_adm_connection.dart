import 'package:flutter/material.dart';

import 'sqlite_connection_factory.dart';

class SqliteAdmConnection with WidgetsBindingObserver {
  final connection = SqliteConnectionFactory.instance;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        break;
      case AppLifecycleState.inactive:
      case AppLifecycleState.paused:
      case AppLifecycleState.detached:
        connection.closeConnection();
        break;
    }

    super.didChangeAppLifecycleState(state);
  }
}
