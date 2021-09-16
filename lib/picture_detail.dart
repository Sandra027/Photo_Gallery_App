 import 'package:flutter/material.dart';

class PictureDetailScreen extends StatelessWidget {
  final String imageUrl;
  PictureDetailScreen(this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
        title: Text("Picture Detail"),
      ),
      body: Container(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(imageUrl,
          fit:BoxFit.cover,
            height: double.infinity,
            width: double.infinity
          ),
        ),
      ),
    );
  }
}
