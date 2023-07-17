part of '../home_page.dart';

class _HomeSupplierTab extends StatelessWidget {
  final HomeController controller;

  const _HomeSupplierTab(this.controller);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _HomeTabHeader(controller),
        Expanded(
          child: Observer(
            builder: (_) {
              return AnimatedSwitcher(
                duration: const Duration(milliseconds: 400),
                child: controller.supplierPageTypeSelected == SupplierPageType.list
                    ? _HomeSupplierList(controller)
                    : _HomeSupplierGrid(controller),
              );
            },
          ),
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
  final HomeController controller;

  const _HomeSupplierList(this.controller);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        Observer(
          builder: (_) {
            return SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: controller.listSuppliersByAddress.length,
                (context, index) {
                  return _HomeSupplierListItemWidget(controller.listSuppliersByAddress[index]);
                },
              ),
            );
          },
        ),
      ],
    );
  }
}

class _HomeSupplierListItemWidget extends StatelessWidget {
  final SupplierNearByMeModel supplier;

  const _HomeSupplierListItemWidget(this.supplier);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 30),
            width: 1.sw,
            height: 80.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(supplier.name, overflow: TextOverflow.ellipsis),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            const Icon(Icons.location_on),
                            Text('${supplier.distance.toStringAsFixed(2)}km de distância'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: CircleAvatar(
                    backgroundColor: context.primaryColor,
                    maxRadius: 15,
                    child: const Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 5),
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(
                color: Colors.transparent,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                border: Border.all(
                  color: Colors.grey[100]!,
                  width: 5,
                ),
                borderRadius: BorderRadius.circular(100),
                image: DecorationImage(
                  image: NetworkImage(supplier.logo),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HomeSupplierGrid extends StatelessWidget {
  final HomeController controller;

  const _HomeSupplierGrid(this.controller);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        Observer(
          builder: (_) {
            return SliverGrid(
              delegate: SliverChildBuilderDelegate(
                childCount: controller.listSuppliersByAddress.length,
                (context, index) {
                  return _HomeSupplierGridItemWidget(controller.listSuppliersByAddress[index]);
                },
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.1,
              ),
            );
          },
        ),
      ],
    );
  }
}

class _HomeSupplierGridItemWidget extends StatelessWidget {
  final SupplierNearByMeModel supplier;

  const _HomeSupplierGridItemWidget(this.supplier);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          margin: const EdgeInsets.only(
            top: 40,
            left: 10,
            right: 10,
            bottom: 10,
          ),
          elevation: 5,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: SizedBox.expand(
            child: Padding(
              padding: const EdgeInsets.only(top: 40, left: 10, right: 10, bottom: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    supplier.name,
                    style: context.textTheme.titleSmall,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    '${supplier.distance.toStringAsFixed(2)}km de distância',
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage(supplier.logo),
            backgroundColor: Colors.grey[200],
          ),
        ),
        Positioned(
          top: 4,
          left: 0,
          right: 0,
          child: Center(
            child: CircleAvatar(
              radius: 35,
              backgroundImage: NetworkImage(supplier.logo),
            ),
          ),
        ),
      ],
    );
  }
}
