import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../core/life_cycle/page_life_cycle_state.dart';
import '../../core/ui/extensions/theme_extension.dart';
import 'supplier_controller.dart';
import 'widgets/supplier_details_widget.dart';
import 'widgets/supplier_service_widget.dart';

class SupplierPage extends StatefulWidget {
  final int _supplierId;

  const SupplierPage({super.key, required int supplierId}) : _supplierId = supplierId;

  @override
  State<SupplierPage> createState() => _SupplierPageState();
}

class _SupplierPageState extends PageLifeCycleState<SupplierController, SupplierPage> {
  late ScrollController _scrollController;
  final sliverCollapsedVN = ValueNotifier(false);

  @override
  Map<String, dynamic>? get params => {'supplierId': widget._supplierId};

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.offset > 180 && !_scrollController.position.outOfRange) {
        sliverCollapsedVN.value = true;
      } else if (_scrollController.offset <= 180 && !_scrollController.position.outOfRange) {
        sliverCollapsedVN.value = false;
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

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
      body: Observer(
        builder: (_) {
          final supplier = controller.supplier;

          if (supplier == null) {
            return const Center(
              child: Text('Buscando dados do fornecedor'),
            );
          }

          return CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverAppBar(
                expandedHeight: 200,
                pinned: true,
                title: ValueListenableBuilder(
                  valueListenable: sliverCollapsedVN,
                  builder: (_, sliverCollapsedVNValue, child) {
                    return Visibility(
                      visible: sliverCollapsedVNValue,
                      child: Text(supplier.name),
                    );
                  },
                ),
                flexibleSpace: FlexibleSpaceBar(
                  stretchModes: const [
                    StretchMode.zoomBackground,
                    StretchMode.fadeTitle,
                  ],
                  background: Image.network(
                    supplier.logo,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => const SizedBox.shrink(),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SupplierDetailsWidget(supplier),
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
                  childCount: controller.supplierServices.length,
                  (context, index) {
                    return SupplierServiceWidget(controller.supplierServices[index]);
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
