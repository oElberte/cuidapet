part of '../home_page.dart';

class _HomeCategoriesWidget extends StatelessWidget {
  const _HomeCategoriesWidget();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 15,
        itemBuilder: (context, index) {
          return const _CategoryItem();
        },
      ),
    );
  }
}

class _CategoryItem extends StatelessWidget {
  const _CategoryItem();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: context.primaryColorLight,
            radius: 30,
            child: const Icon(Icons.pets, size: 30, color: Colors.black),
          ),
          const Text('Petshop'),
        ],
      ),
    );
  }
}
