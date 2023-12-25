import 'dart:io';

import 'package:favourite_places/main.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({Key? key, required this.onPickImage}) : super(key: key);
  final void Function(File image) onPickImage;
  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _image;
  void _takePic() async {
    ImagePicker imagePicker = ImagePicker();
    XFile? imageFile =
        await imagePicker.pickImage(source: ImageSource.camera, maxWidth: 600);
    if (imageFile != null) {
      setState(() {
        _image = File(imageFile.path);
      });
      widget.onPickImage(_image!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          border: Border.all(
              width: 1, color: colorScheme.primary.withOpacity(0.2))),
      child: _image == null
          ? TextButton.icon(
              onPressed: _takePic,
              icon: const Icon(Icons.camera),
              label: const Text("Take Pictuer"))
          : GestureDetector(
              onTap: _takePic,
              child: Image.file(
                _image!,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
    );
  }
}
