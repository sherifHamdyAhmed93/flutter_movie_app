import 'package:flutter/material.dart';
import 'package:flutter_movie_app/custom_widgets/horizontal_movie_item.dart';
import 'package:flutter_movie_app/custom_widgets/recommended_movie_item.dart';
import 'package:flutter_movie_app/my_theme/app_colors.dart';

class MovieDetailsScreen extends StatefulWidget {
  static const String routeName = 'movie_details';
  const MovieDetailsScreen({super.key});

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dora and the lost city of gold'),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildTopWidget(),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildMovieNameAndDate(),
                  _buildMovieWithTypesAndDesc()
                ],
              ),
            ),
            _buildHorizontalRecommendedMoviesList()
          ],
        ),
      ),
    );
  }

  Widget _buildTopWidget() {
    return Container(
      height: MediaQuery.of(context).size.width * 1/2,
      width: MediaQuery.of(context).size.width,
      child: Stack(alignment: AlignmentDirectional.bottomStart, children: [
        Image.network('https://cdn.marvel.com/content/1x/deadpoolandwolverine_lob_crd_03.jpg',
          fit: BoxFit.cover, // Ensure the image covers the container
          width: double.infinity,
          height: double.infinity,
        ),
        Positioned(
          top: 0,
          bottom: 0,
          left: 0,
          right: 0,
          child: Center(
            child: IconButton(
              icon: Icon(Icons.play_circle_fill, color: Colors.white, size: 60),
              onPressed: () {
                // Add your onPressed logic here
              },
            ),
          ),
        ),
      ]),
    );
  }

  Widget _buildMovieNameAndDate(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Dora and the lost city of gold',style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontSize: 18),),
        SizedBox(height: 4,),
        Text('2019  PG-13  2h 7m',style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 10)),
        SizedBox(height: 10,),
      ],
    );
  }

  Widget _buildMovieWithTypesAndDesc() {
    return  Container(
      color: Colors.transparent,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          //HorizontalMovieItem(),
          const SizedBox(width: 10,),
          Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  // Here you get the available width for the Expanded widget
                  double remainingWidth = constraints.maxWidth;
                  return  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildChips(remainingWidth),
                        SizedBox(height: 10),
                        Text(
                          'Having spent most of her life exploring the jungle, nothing could prepare Dora for her most dangerous adventure yet — high school. ',
                          textAlign: TextAlign.justify,
                          style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontSize: 13),
                        ),
                        SizedBox(height: 10,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.star,color: AppColors.gold,size: 18,),
                            SizedBox(width: 2,),
                            Text('7.7',style: Theme.of(context).textTheme.displaySmall?.copyWith(fontSize: 18),)
                          ],
                        ),
                      ],
                  );
                }
              )
          ),
        ],
      ),
    );
  }

  Widget _buildChips(double availableWidth) {
    const double spacing = 10;
    const int chipsPerRow = 3;

    // Calculate the width of each chip considering the spacing
    double chipWidth = (availableWidth - (spacing * (chipsPerRow - 1))) / chipsPerRow;

    return Wrap(
      spacing: spacing, // Horizontal space between chips
      runSpacing: 4, // Vertical space between chips
      children: List.generate(4, (index) {
        return Container(
          width: chipWidth, // Force the width of the chip container
          child: Chip(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            side: BorderSide(color: AppColors.blackgray),
            label: Center(
              child: Text(
                'Hello',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 10),
              ),
            ),
          ),
        );
      }),
    );
  }


  Widget _buildHorizontalRecommendedMoviesList(){
    return Container(
      height: MediaQuery.of(context).size.height*0.27,
      padding: EdgeInsets.all(15),
      color: AppColors.containerBackgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Recomended', style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 10,),
          Expanded(
            child: ListView.separated(
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container();//RecommendedMovieItem();
              },
              separatorBuilder: (context,index){
                return SizedBox(width: 10,);
              },
            ),
          ),
        ],
      ),
    );
  }


}
