class Constants{
  static const APIKEY = "60c196580f8e4da29a578db7d661cf64";
  static const TopHeadLines = "https://newsapi.org/v2/everything?q=tesla&from=2021-09-11&sortBy=publishedAt&apiKey=API_KEY";

  static String headLinesFor(String country){
    return "https://newsapi.org/v2/everything?q=tesla&from=2021-09-11&sortBy=publishedAt&apiKey=API_KEY";

  }

  static const Map<String ,String> Countries = {
      "USA" : "us",
      "India" : "in",
      "Korea" : "kr",
      "China" : "cn"
  };
}