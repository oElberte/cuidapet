part of '../home_page.dart';

class _HomeCategoriesWidget extends StatelessWidget {
  final HomeController controller;

  const _HomeCategoriesWidget(this.controller);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130.h,
      child: Observer(
        builder: (_) {
          return Center(
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: controller.categories.length,
              itemBuilder: (context, index) {
                return _CategoryItem(controller.categories[index], controller);
              },
            ),
          );
        },
      ),
    );
  }
}

class _CategoryItem extends StatelessWidget {
  final SupplierCategoryModel _category;
  final HomeController _controller;

  static const categoriesIcons = {
    'P': Icons.pets,
    'V': Icons.local_hospital,
    'C': Icons.store_mall_directory,
  };

  const _CategoryItem(this._category, this._controller);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _controller.filterSupplierCategory(_category);
      },
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          children: [
            Observer(
              builder: (_) {
                return CircleAvatar(
                  backgroundColor: _controller.supplierCategoryFilterSelected?.id == _category.id
                      ? context.primaryColor
                      : context.primaryColorLight,
                  radius: 30,
                  child: Icon(
                    categoriesIcons[_category.type],
                    size: 30,
                    color: Colors.black,
                  ),
                );
              },
            ),
            const SizedBox(height: 10),
            Text(_category.name),
          ],
        ),
      ),
    );
  }
}
