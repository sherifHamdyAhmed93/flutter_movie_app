class ApiConstants{
  static const String apiKey = '3c6220ddf01d59f85ef4534acf4f8084';
  static const String apiAccessToken = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzYzYyMjBkZGYwMWQ1OWY4NWVmNDUzNGFjZjRmODA4NCIsIm5iZiI6MTcyNDQzMDgyOC4wMzAzNTQsInN1YiI6IjY2YzI0N2U5Mjc0MjRlY2RiYjZlMWM0YiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.6JBbiE1j37Db2PxFDz3GMHRYeh8vP12_RxVgLvf2WZA';
  static const String imagesURL = "https://image.tmdb.org/t/p/w";
  static const String baseUrl = "https://api.themoviedb.org/3/movie";

  static Map<String,String> getHeaders(){
    return {
      'Authorization' : 'Bearer $apiAccessToken',
      "accept": "application/json"
    };
  }

}