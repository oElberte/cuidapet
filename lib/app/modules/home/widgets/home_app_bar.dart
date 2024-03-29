import 'package:flutter/material.dart';

import '../../../core/helpers/debouncer.dart';
import '../../../core/ui/extensions/size_screen_extension.dart';
import '../../../core/ui/extensions/theme_extension.dart';
import '../home_controller.dart';

class HomeAppBar extends SliverAppBar {
  HomeAppBar(HomeController controller, {super.key})
      : super(
          expandedHeight: 100,
          collapsedHeight: 100,
          elevation: 0,
          flexibleSpace: _CuidapetAppBar(controller),
          pinned: true,
          iconTheme: const IconThemeData(color: Colors.black),
        );
}

class _CuidapetAppBar extends StatelessWidget {
  final HomeController controller;

  const _CuidapetAppBar(this.controller);

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide(color: Colors.grey[200]!),
    );

    final debouncer = Debouncer(milliseconds: 600);

    return AppBar(
      backgroundColor: Colors.grey[100],
      centerTitle: true,
      title: const Padding(
        padding: EdgeInsets.only(bottom: 12),
        child: Text('Cuidapet'),
      ),
      actions: [
        IconButton(
          onPressed: () {
            controller.goToAddressPage();
          },
          icon: const Icon(Icons.location_on, color: Colors.black),
        ),
      ],
      elevation: 0,
      flexibleSpace: Stack(
        children: [
          Container(
            height: 110.h,
            color: context.primaryColor,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: .9.sw,
              child: Material(
                elevation: 4,
                borderRadius: BorderRadius.circular(30),
                child: TextFormField(
                  onChanged: (name) {
                    debouncer.run(() => controller.filterSupplierByName(name));
                  },
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    suffixIcon: const Icon(
                      Icons.search,
                      size: 25,
                      color: Colors.grey,
                    ),
                    border: border,
                    focusedBorder: border,
                    enabledBorder: border,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
