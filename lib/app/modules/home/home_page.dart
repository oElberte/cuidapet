import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../core/rest_client/rest_client.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
