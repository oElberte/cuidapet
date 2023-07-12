import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../core/life_cycle/page_life_cycle_state.dart';
import '../../core/rest_client/rest_client.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends PageLifeCycleState<HomeController, HomePage> {
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
              child: Text('Logout'),
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
            ),
            TextButton(
              child: Text('Refresh Token'),
              onPressed: () async {
                final categoriesResponse = await Modular.get<RestClient>().auth().get('/categories/');
                print(categoriesResponse.data);
              },
            ),
          ],
        ),
      ),
    );
  }
}
