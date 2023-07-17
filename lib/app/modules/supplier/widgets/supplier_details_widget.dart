import 'package:flutter/material.dart';

import '../../../core/ui/extensions/theme_extension.dart';

class SupplierDetailsWidget extends StatelessWidget {
  const SupplierDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
          child: Center(
            child: Text(
              'Clinica Central ABC',
              style: context.textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Divider(thickness: 1, color: context.primaryColor),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Informações do estabelecimento',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            textAlign: TextAlign.center,
          ),
        ),
        const ListTile(
          leading: Icon(Icons.location_city, color: Colors.black),
          title: Text('Av. Paulista 2000'),
        ),
        const ListTile(
          leading: Icon(Icons.local_phone, color: Colors.black),
          title: Text('11999999999'),
        ),
        Divider(thickness: 1, color: context.primaryColor),
      ],
    );
  }
}
