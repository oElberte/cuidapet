import 'package:flutter/material.dart';

import '../../../core/helpers/text_formatter.dart';
import '../../../core/ui/extensions/theme_extension.dart';
import '../../../models/supplier_services_model.dart';
import '../supplier_controller.dart';

class SupplierServiceWidget extends StatelessWidget {
  final SupplierServicesModel service;
  final SupplierController controller;

  const SupplierServiceWidget({required this.service, required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        child: Icon(Icons.pets),
      ),
      title: Text(service.name),
      subtitle: Text(TextFormatter.formatReal(service.price)),
      trailing: InkWell(
        onTap: () {
          controller.addOrRemoveService(service);
        },
        child: controller.isServiceSelected(service)
            ? const Icon(
                Icons.remove_circle,
                size: 30,
                color: Colors.red,
              )
            : Icon(
                Icons.add_circle,
                size: 30,
                color: context.primaryColor,
              ),
      ),
    );
  }
}
