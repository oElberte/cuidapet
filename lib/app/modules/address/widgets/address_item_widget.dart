part of '../address_page.dart';

class _AddressItemWidget extends StatelessWidget {
  final AddressEntity entity;

  const _AddressItemWidget({required this.entity});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child:  ListTile(
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
