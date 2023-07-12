import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../core/ui/extensions/size_screen_extension.dart';
import '../../../core/ui/extensions/theme_extension.dart';
import '../../../core/ui/widgets/cuidapet_default_button.dart';
import '../../../models/place_model.dart';

class AddressDetailsPage extends StatefulWidget {
  final PlaceModel place;

  const AddressDetailsPage({
    super.key,
    required this.place,
  });

  @override
  State<AddressDetailsPage> createState() => _AddressDetailsPageState();
}

class _AddressDetailsPageState extends State<AddressDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: context.primaryColorDark),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Text(
            'Confirme seu endereço',
            style: context.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(
                  widget.place.lat,
                  widget.place.lng,
                ),
                zoom: 16,
              ),
              markers: {
                Marker(
                  markerId: const MarkerId('Address'),
                  position: LatLng(
                    widget.place.lat,
                    widget.place.lng,
                  ),
                  infoWindow: InfoWindow(title: widget.place.address),
                ),
              },
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              readOnly: true,
              initialValue: widget.place.address,
              decoration: const InputDecoration(
                label: Text('Endereço'),
                suffix: Icon(Icons.edit),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: const InputDecoration(
                label: Text('Complemento'),
                suffix: Icon(Icons.edit),
              ),
            ),
          ),
          SizedBox(
            width: .9.sw,
            height: 60.h,
            child: CuidapetDefaultButton(
              label: 'Salvar',
              onPressed: () {},
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
