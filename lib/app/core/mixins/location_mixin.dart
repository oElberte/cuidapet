import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

typedef TryAgain = void Function();

mixin LocationMixin<E extends StatefulWidget> on State<E> {
  void showDialogLocationServiceUnavailable() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Precisamos da sua localização'),
          content: const Text('Para realizar a busca da sua localização, precisamos que você ative o GPS'),
          actions: [
            TextButton(
              onPressed: Navigator.of(context).pop,
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Geolocator.openLocationSettings();
              },
              child: const Text('Abrir configurações'),
            ),
          ],
        );
      },
    );
  }

  void showDialogLocationDenied({TryAgain? tryAgain}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Precisamos da sua autorização'),
          content: const Text('Para realizar a busca da sua localização, precisamos que você autorize a utilização'),
          actions: [
            TextButton(
              onPressed: Navigator.of(context).pop,
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                if (tryAgain != null) {
                  tryAgain();
                }
              },
              child: const Text('Tentar novamente'),
            ),
          ],
        );
      },
    );
  }

  void showDialogLocationDeniedForever() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Precisamos da sua autorização'),
          content: const Text(
              'Para realizar a busca da sua localização, precisamos que você autorize a utilização, clique no botão abrir configurações e autorize a utilização e clique novamente no botão localização atual'),
          actions: [
            TextButton(
              onPressed: Navigator.of(context).pop,
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Geolocator.openAppSettings();
              },
              child: const Text('Abrir configurações'),
            ),
          ],
        );
      },
    );
  }
}
