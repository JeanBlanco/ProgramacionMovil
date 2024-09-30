import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:geolocator/geolocator.dart';

class Hardware extends StatefulWidget {
  const Hardware({super.key});

  @override
  State<StatefulWidget> createState() {
    return _Hardware();
  }
}

class _Hardware extends State<Hardware> {
  final ImagePicker _picker = ImagePicker();
  DecorationImage defaultImage = const DecorationImage(
      fit: BoxFit.cover,
      image: NetworkImage(
          "https://th.bing.com/th/id/OIP.uPorqYq6ft-IhMe6SFdnvwHaE8?rs=1&pid=ImgDetMain"));

  TextEditingController latitude = TextEditingController();
  TextEditingController longitude = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejemplo  Acceso a camara y GPS'),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    getImage(ImageSource.camera);
                  },
                  child: const Text("Camara"),
                ),
                const VerticalDivider(),
                ElevatedButton(
                  onPressed: () {
                    getImage(ImageSource.gallery);
                  },
                  child: const Text("Galeria"),
                )
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.6,
              height: MediaQuery.of(context).size.height * 0.5,
              decoration:
                  BoxDecoration(shape: BoxShape.rectangle, image: defaultImage),
            ),
            TextField(
              controller: latitude,
              decoration: const InputDecoration(
                  helperText: "Latitud", helperStyle: TextStyle(fontSize: 15)),
            ),
            TextField(
              controller: latitude,
              decoration: const InputDecoration(
                  helperText: "Longitud", helperStyle: TextStyle(fontSize: 15)),
            )
          ],
        ),
      ),
    );
  }

  void getImage(ImageSource camera) async {
    XFile? image = await _picker.pickImage(source: camera);

    if (image != null) {
      File localImage = File(image.path);

      bool locationIsActive = await Geolocator.isLocationServiceEnabled();

      if (locationIsActive) {
        LocationPermission permission = await Geolocator.checkPermission();

        if (permission == LocationPermission.always ||
            permission == LocationPermission.whileInUse) {}

        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.bestForNavigation);
        latitude.text = position.latitude.toString();
        longitude.text = position.longitude.toString();
      }
      setState(() {
        defaultImage = DecorationImage(image: FileImage(localImage));
      });
    }
  }
}
