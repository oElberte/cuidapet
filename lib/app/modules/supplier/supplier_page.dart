import 'package:flutter/material.dart';

import '../../core/ui/extensions/theme_extension.dart';
import 'widgets/supplier_details_widget.dart';
import 'widgets/supplier_service_widget.dart';

class SupplierPage extends StatelessWidget {
  const SupplierPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.schedule),
        label: const Text('Fazer agendamento'),
        onPressed: () {},
        backgroundColor: context.primaryColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: const [
                StretchMode.zoomBackground,
                StretchMode.fadeTitle,
              ],
              background: Image.network(
                'https://encrypted-tbn1.gstatic.com/licensed-image?q=tbn:ANd9GcREj22c-wMNL5IDmU99v8G7voUl17Yxm0JJqMLqttdPT4DnaB99zqVK7HWiNzjP3aZnzCEf-ikAqb2yiDk',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => const SizedBox.shrink(),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SupplierDetailsWidget(),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Serviços (0 selecionados)',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 200,
              (context, index) {
                return const SupplierServiceWidget();
              },
            ),
          ),
        ],
      ),
    );
  }
}
