import 'package:flutter/material.dart';

/*
TODO this widget is NOT COMPLETED SO please wait
*/
/*
 TODO ONLY Prototype
*/

class MovieDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                'None', // Replace image URL
                width: 100,
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 10),

              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Alita Battle Angel',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),


                    Text('2019'),
                    SizedBox(height: 10),
                    Text('Rosa Salazarrr'),

                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          const Divider(
            color: Colors.white,
            thickness: 1,
            height: 20,
          ),
        ],
      ),
    );
  }
}
