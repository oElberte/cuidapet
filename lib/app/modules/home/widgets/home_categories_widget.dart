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
                return _CategoryItem(controller.categories[index]);
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

  static const categoriesIcons = {
    'P': Icons.pets,
    'V': Icons.local_hospital,
    'C': Icons.store_mall_directory,
  };

  const _CategoryItem(this._category);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: context.primaryColorLight,
            radius: 30,
            child: Icon(
              categoriesIcons[_category.type],
              size: 30,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10),
          Text(_category.name),
        ],
      ),
    );
  }
}
