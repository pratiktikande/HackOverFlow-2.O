import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class addPost extends StatefulWidget {
  @override
  _addPostState createState() => _addPostState();
}

class _addPostState extends State<addPost> {
  File? _image;
  final picker = ImagePicker();
  TextEditingController _captionController = TextEditingController();

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  void _postNow() {
    // Add your logic to post the content (photo and caption) here
    // For example, you can upload the photo to a server and save the caption
    // You may use packages like http or dio for network requests.

    // Reset state after posting
    setState(() {
      _image = null;
      _captionController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Now'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _image == null
                ? Placeholder(
              fallbackHeight: 200,
              fallbackWidth: double.infinity,
            )
                : Image.file(_image!),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: getImage,
              child: Text('Select Photo'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _captionController,
              decoration: InputDecoration(
                hintText: 'Enter your caption...',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _postNow,
              child: Text('Post Now'),
            ),
          ],
        ),
      ),
    );
  }
}
