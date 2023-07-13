part of '../address_page.dart';

class _AddressItemWidget extends StatelessWidget {
  final AddressEntity entity;
  final VoidCallback onTap;

  const _AddressItemWidget({
    required this.entity,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        onTap: onTap,
        leading: const CircleAvatar(
          radius: 30,
          backgroundColor: Colors.white,
          child: Icon(
            Icons.location_on,
            color: Colors.black,
          ),
        ),
        title: Text(entity.address),
        subtitle: Text(entity.additional),
      ),
    );
  }
}
