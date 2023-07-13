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
                    ? const _HomeSupplierList()
                    : const _HomeSupplierGrid(),
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
  const _HomeSupplierList();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: 10,
            (context, index) {
              return const _HomeSupplierListItemWidget();
            },
          ),
        ),
      ],
    );
  }
}

class _HomeSupplierGrid extends StatelessWidget {
  const _HomeSupplierGrid();

  @override
  Widget build(BuildContext context) {
    return const Text('Supplier Grid');
  }
}

class _HomeSupplierListItemWidget extends StatelessWidget {
  const _HomeSupplierListItemWidget();

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
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Clinica Central ABC', overflow: TextOverflow.ellipsis),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Icon(Icons.location_on),
                            Text('2.84km de distância'),
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
                image: const DecorationImage(
                  image: NetworkImage(
                      'https://encrypted-tbn1.gstatic.com/licensed-image?q=tbn:ANd9GcREj22c-wMNL5IDmU99v8G7voUl17Yxm0JJqMLqttdPT4DnaB99zqVK7HWiNzjP3aZnzCEf-ikAqb2yiDk'),
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
