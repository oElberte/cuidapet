import 'package:flutter/material.dart';

import '../../../core/helpers/text_formatter.dart';
import '../../../core/ui/extensions/theme_extension.dart';
import '../../../models/supplier_services_model.dart';

class SupplierServiceWidget extends StatelessWidget {
  final SupplierServicesModel service;

  const SupplierServiceWidget(this.service, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        child: Icon(Icons.pets),
      ),
      title: Text(service.name),
      subtitle: Text(TextFormatter.formatReal(service.price)),
      trailing: Icon(
        Icons.add_circle,
        size: 30,
        color: context.primaryColor,
      ),
    );
  }
}
