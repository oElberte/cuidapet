import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../core/life_cycle/page_life_cycle_state.dart';
import '../../entities/address_entity.dart';
import '../../services/address/address_service.dart';
import 'home_controller.dart';

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
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
              child: const Text('Logout'),
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
            ),
            TextButton(
              child: const Text('Ir para endereço'),
              onPressed: () async {
                await Modular.to.pushNamed('/address/');
              },
            ),
            TextButton(
              child: const Text('Buscar endereço'),
              onPressed: () async {
                final address = await Modular.get<AddressService>().getAddressSelected();
                setState(() {
                  addressEntity = address;
                });
              },
            ),
            Text(addressEntity?.address ?? 'Nenhum endereço selecionado'),
            Text(addressEntity?.additional ?? 'Nenhum complemento selecionado'),
          ],
        ),
      ),
    );
  }
}
