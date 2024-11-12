import 'package:barikoi/features/core/path/file_path.dart';
import 'package:flutter/material.dart';

class ShowDestinationInDetails extends StatelessWidget {
  final Reverce reverceGeocodingDataResponse;

  const ShowDestinationInDetails({
    required this.reverceGeocodingDataResponse,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Destination Details'),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Place Name: ${reverceGeocodingDataResponse.place}'),
          Text('Address: ${reverceGeocodingDataResponse.status}'),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Close'),
        ),
      ],
    );
  }
}