import 'package:flutter/material.dart';

class ViewPostNew extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.close),
              onPressed: () { Navigator.of(context).pop(); },
            );
          },
        ),
      ),
      body: Center(
        child: Text('Post New Page'),
      ),
    );
  }
}