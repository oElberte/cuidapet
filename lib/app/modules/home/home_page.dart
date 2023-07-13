import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../core/life_cycle/page_life_cycle_state.dart';
import '../../core/ui/extensions/size_screen_extension.dart';
import '../../core/ui/extensions/theme_extension.dart';
import '../../entities/address_entity.dart';
import '../../models/supplier_category_model.dart';
import 'home_controller.dart';
import 'widgets/home_app_bar.dart';

part 'widgets/home_address_widget.dart';
part 'widgets/home_categories_widget.dart';
part 'widgets/home_supplier_tab_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends PageLifeCycleState<HomeController, HomePage> {
  AddressEntity? addressEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      backgroundColor: Colors.grey[100],
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            HomeAppBar(controller),
            SliverToBoxAdapter(
              child: _HomeAddressWidget(controller),
            ),
            SliverToBoxAdapter(
              child: _HomeCategoriesWidget(controller),
            ),
          ];
        },
        body: _HomeSupplierTab(controller),
      ),
    );
  }
}
