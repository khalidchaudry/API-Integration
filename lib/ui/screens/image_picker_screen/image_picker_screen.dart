import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({Key? key}) : super(key: key);

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  File? image;
  final picker = ImagePicker();
  bool isLoading = false;
  getImage() async {
    final pickImage = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickImage != null) {
      setState(() {
        image = File(pickImage.path);
      });
    } else {
      debugPrint('Failed to upload image');
    }
  }

  uploadImage() async {
    var stream = http.ByteStream(image!.openRead());
    stream.cast();
    var length = image!.length();
    var uri = Uri.parse('http://fakestoreapi.com/products');
    var request = http.MultipartRequest('POST', uri);
    request.fields['title'] = 'Khalid Ali';
    var multiport = http.MultipartFile('image', stream, 5);
    request.files.add(multiport);
    var response = await request.send();
    if (response.statusCode == 200) {
      setState(() {
        isLoading = true;
      });
      debugPrint('Image Uploaded');
      setState(() {
        isLoading = true;
      });
    } else {
      debugPrint('Image Uploading Failed');
    }
    setState(() {
      isLoading = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: getImage,
              child: Container(
                  child: image == null
                      ? const Text('Pick Image')
                      : Image.file(
                          File(image!.path).absolute,
                          fit: BoxFit.cover,
                        )),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton.icon(
                onPressed: () {
                  getImage();
                },
                icon: const Icon(Icons.upload_file),
                label: const Text('Upload'))
          ],
        ),
      ),
    );
  }
}
