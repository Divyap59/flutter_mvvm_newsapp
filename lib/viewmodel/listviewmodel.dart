// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter_mvvm_newsapp/model/modelfile.dart';
import 'package:flutter_mvvm_newsapp/services/service.dart';
import 'package:flutter_mvvm_newsapp/viewmodel/viewmodel.dart';

enum LoadingStatus{
  Completed,
  Searching,
  Empty
}

class ListViewModel with ChangeNotifier{
  LoadingStatus loadingStatus = LoadingStatus.Empty;
      List<ViewModel> articles = <ViewModel>[];

      void getTopNewsHeadLines() async{
        List<ModelNewsArticle> _newsArticle = <ModelNewsArticle>[];
        loadingStatus = LoadingStatus.Searching;
        notifyListeners();
        this.articles = _newsArticle.map((article) => ViewModel(article: article)).toList();

        if(this.articles.isEmpty){
          loadingStatus = LoadingStatus.Empty;
        }
        else{
          loadingStatus = LoadingStatus.Completed;
        }
        notifyListeners();
      }

      ///methods for news from each country
  void fetchTopNewsHeadLines(String country) async{
    List<ModelNewsArticle> _newsArticle = await WebService().getTopHeadLines(country);
    loadingStatus = LoadingStatus.Searching;
    notifyListeners();
    this.articles = _newsArticle.map((article) => ViewModel(article: article)).toList();

    if(this.articles.isEmpty){
      loadingStatus = LoadingStatus.Empty;
    }
    else{
      loadingStatus = LoadingStatus.Completed;
    }
    notifyListeners();
  }

  void fetchNewsByCountry(String country) async{
    List<ModelNewsArticle> _newsArticle = await WebService().getNewsByCountry(country);
    loadingStatus = LoadingStatus.Searching;
    notifyListeners();
    this.articles = _newsArticle.map((article) => ViewModel(article: article)).toList();

    if(this.articles.isEmpty){
      loadingStatus = LoadingStatus.Empty;
    }
    else{
      loadingStatus = LoadingStatus.Completed;
    }
    notifyListeners();
  }


}