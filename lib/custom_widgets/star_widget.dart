import 'package:flutter/material.dart';

class RatingWidget extends StatelessWidget {
  final double rating; // Pass the rating as a parameter

  const RatingWidget({
    Key? key,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(Icons.star, color: Colors.amber, size: 20), // Customize as needed
        SizedBox(width: 2),
        Text(
          rating.toStringAsFixed(2),
          style: Theme.of(context).textTheme.displaySmall?.copyWith(fontSize: 13),
        ),
      ],
    );
  }
}
