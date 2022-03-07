import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/apis/dio/dio_helper.dart';
import 'package:news_app/bloc/status.dart';
import 'package:news_app/screens/business_screen.dart';
import 'package:news_app/screens/science_screen.dart';
import 'package:news_app/screens/sport_screen.dart';


class NewsCubit extends Cubit<NewsStatu> {
  NewsCubit() : super(NewsInitialStatu());

 static NewsCubit get(context) => BlocProvider.of(context);

  int curentindex = 0;

  List<BottomNavigationBarItem> item = [
    BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: "Business",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: "Sports",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: "Science",
    ),
  ];

  List<Widget> screen = [
    BusinessScreen(),
    SportScreen(),
    ScienceScreen(),
  ];

  void changenav (int index)
  {
    curentindex = index;
    emit(NewsChangeNavBarStatu());
  }
  
  List<dynamic> business = [];
  List<dynamic> sport = [];
  List<dynamic> science = [];
  List<dynamic> search = [];




  void getBusiness ()
  {
    emit(NewsBusinessLoadingStatu());
    DioHelper.GetData
    (
      url:"v2/top-headlines",
      query:
      {
      'country' : 'eg',
      'category' : 'business',
      'apikey' : 'ad9bb919e6cc4d9293172f80b9f843bf',
      },
    ).then((value) {
      business = value.data['articles'];
      emit(NewsBusinessSeccssesStatu());
    }).catchError((error){
      print(error.toString());
      emit(NewsBusinessErrorStatu(error.toString()));
    });
  }

  void getSport ()
  {
    emit(NewsSportLoadingStatu());
    DioHelper.GetData
      (
      url:"v2/top-headlines",
      query:
      {
        'country' : 'eg',
        'category' : 'sports',
        'apikey' : 'ad9bb919e6cc4d9293172f80b9f843bf',
      },
    ).then((value) {
      sport = value.data['articles'];
      emit(NewsSportSeccssesStatu());
    }).catchError((error){
      print(error.toString());
      emit(NewsSportErrorStatu(error.toString()));
    });
  }

  void getScience ()
  {
    emit(NewsScienceLoadingStatu());
    DioHelper.GetData
      (
      url:"v2/top-headlines",
      query:
      {
        'country' : 'eg',
        'category' : 'science',
        'apikey' : 'ad9bb919e6cc4d9293172f80b9f843bf',
      },
    ).then((value) {
      science = value.data['articles'];
      emit(NewsScienceSeccssesStatu());
    }).catchError((error){
      print(error.toString());
      emit(NewsScienceErrorStatu(error.toString()));
    });
  }

  void getSearch (String value)
  {
    emit(NewsSearchLoadingStatu());
    DioHelper.GetData
      (
      url:"v2/everything",
      query:
      {
        'q' : '$value',
        'apikey' : 'ad9bb919e6cc4d9293172f80b9f843bf',
      },
    ).then((value) {
      search = value.data['articles'];
      emit(NewsSerachSeccssesStatu());
    }).catchError((error){
      print(error.toString());
      emit(NewsSearchErrorStatu(error.toString()));
    });
  }

  
}
