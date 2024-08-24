import 'package:flutter/material.dart';
import 'package:flutter_movie_app/my_theme/app_colors.dart';

class SearchTab extends StatelessWidget {

  var formKEY =GlobalKey<FormState>() ;
  String title = '';
  late String actor ;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width ;
    var height = MediaQuery.of(context).size.height ;
    return Container(
      height: double.infinity,
      width: double.infinity,
      margin: const EdgeInsets.all(13),
      child: Container(
        color: AppColors.backgroundColor,
        child: Column(

          children: [
            Form(
              key: formKEY,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  //// Name Input Field
                  children: [
                    SizedBox(height: 20,),
                    TextFormField(
                      style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        color: AppColors.white,
                        fontSize: 19
                      ),
                      decoration: InputDecoration(
                        hintText: 'Search',
                        labelStyle: Theme.of(context).textTheme.displaySmall?.copyWith(
                          color: AppColors.white
                        ) ,//TextStyle(color: AppColors.whitegray ,),
                        prefixIcon: Icon(Icons.search, color: AppColors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide(color: AppColors.blackgray),
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),

                      ),
                    ),
                  ],

            )),
            SizedBox(height: 220,),
            Image.asset('assets/images/Nfound.png'),
            SizedBox(height: 10,),
            Text('No movies found' , style: Theme.of(context).textTheme.displayMedium?.copyWith(
              color: AppColors.whitegray,
              fontSize: 17
            ),)
          ],
        ),
      ),
    );
  }
}





/*
* Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          child: TextFormField(
            inputFormatters: [

            ],
          ),
        ),
        Image.asset('assets/images/.png')
      ],
    );
*
*
*
* */