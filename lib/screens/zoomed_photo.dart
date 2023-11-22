import 'package:flutter/material.dart';
import 'package:zoom_widget/zoom_widget.dart';

class ZoomedFotoScreen extends StatelessWidget {
  final String url;

  const ZoomedFotoScreen({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Center(
        child: Zoom(child: Image.network(url)),
      )),
    );
  }
}
