import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({
    super.key,
    this.detailId,
  });

  final String? detailId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details Screen'),
      ),
      body: Center(
        child: Text(
          'Detail ID: $detailId',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
