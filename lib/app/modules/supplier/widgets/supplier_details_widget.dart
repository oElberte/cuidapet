import 'package:flutter/material.dart';

import '../../../core/ui/extensions/theme_extension.dart';
import '../../../models/supplier_model.dart';
import '../supplier_controller.dart';

class SupplierDetailsWidget extends StatelessWidget {
  final SupplierModel supplier;
  final SupplierController controller;

  const SupplierDetailsWidget({required this.supplier, required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
          child: Center(
            child: Text(
              supplier.name,
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
        ListTile(
          onTap: () => controller.goToGeoOrCopyAddressToClipboard(),
          leading: const Icon(Icons.location_city, color: Colors.black),
          title: Text(supplier.address),
        ),
        ListTile(
          onTap: () => controller.goToPhoneOrCopyPhoneToClipboard(),
          leading: const Icon(Icons.local_phone, color: Colors.black),
          title: Text(supplier.phone),
        ),
        Divider(thickness: 1, color: context.primaryColor),
      ],
    );
  }
}
