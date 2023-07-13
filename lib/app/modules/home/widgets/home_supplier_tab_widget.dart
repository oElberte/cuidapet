part of '../home_page.dart';

class _HomeSupplierTab extends StatelessWidget {
  final HomeController controller;

  const _HomeSupplierTab(this.controller);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _HomeTabHeader(controller),
        Observer(
          builder: (_) {
            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 400),
              child: controller.supplierPageTypeSelected == SupplierPageType.list
                  ? const _HomeSupplierList()
                  : const _HomeSupplierGrid(),
            );
          },
        ),
      ],
    );
  }
}

class _HomeTabHeader extends StatelessWidget {
  final HomeController controller;

  const _HomeTabHeader(this.controller);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Observer(
        builder: (_) {
          return Row(
            children: [
              const Text('Estabelecimentos'),
              const Spacer(),
              InkWell(
                onTap: () => controller.changePageType(SupplierPageType.list),
                child: Icon(
                  Icons.view_headline,
                  color: controller.supplierPageTypeSelected == SupplierPageType.list ? Colors.black : Colors.grey,
                ),
              ),
              const SizedBox(width: 6),
              InkWell(
                onTap: () => controller.changePageType(SupplierPageType.grid),
                child: Icon(
                  Icons.view_comfy,
                  color: controller.supplierPageTypeSelected == SupplierPageType.grid ? Colors.black : Colors.grey,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _HomeSupplierList extends StatelessWidget {
  const _HomeSupplierList();

  @override
  Widget build(BuildContext context) {
    return const Text('Supplier List');
  }
}

class _HomeSupplierGrid extends StatelessWidget {
  const _HomeSupplierGrid();

  @override
  Widget build(BuildContext context) {
    return const Text('Supplier Grid');
  }
}
