import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_movie_app/my_theme/app_colors.dart';

class TryAgainWidget extends StatelessWidget {
  TryAgainWidget({super.key,required this.errorMessage,required this.onError});

  String errorMessage;
  Function onError;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(errorMessage,textAlign: TextAlign.center,),
            SizedBox(height: 10,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.gold,
                  foregroundColor: AppColors.white
              ),
              onPressed: () {
                onError.call();
              },
              child: Text('tryAgain'),
            ),
          ],
        ),
      ),
    );
  }
}