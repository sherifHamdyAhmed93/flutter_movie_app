import 'package:flutter/material.dart';

class MovieDetails extends StatelessWidget {
  final String title;
  final String year;
  final String actor;
  final String urlimage;

  MovieDetails({
    required this.title,
    required this.year,
    required this.actor,
    required this.urlimage,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        color: Colors.transparent,
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  urlimage,
                  width: 100,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(year),
                      SizedBox(height: 10),
                      Text(actor),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Divider(
              color: Colors.white,
              thickness: 1,
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
