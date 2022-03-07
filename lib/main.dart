import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/apis/dio/dio_helper.dart';
import 'package:news_app/bloc/cubit.dart';
import 'package:news_app/bloc/mode_cubit/cubit_dark.dart';
import 'package:news_app/bloc/mode_cubit/state_dark.dart';
import 'package:news_app/bloc/observer.dart';
import 'package:news_app/local_cache/cash_helper.dart';
import 'package:news_app/screens/news_layout.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  bool isDark =  CacheHelper.Getbool(key: 'Dark');
  Bloc.observer = MyBlocObserver();
  runApp(MyApp(IsDark: isDark,));
}







class MyApp extends StatelessWidget {
  final bool IsDark;

  MyApp ({this.IsDark});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
        create: (context) => DarkCubit()..ChangeMode(
        shared: IsDark)),
    BlocProvider(
    create: (context) => NewsCubit()
    ..getBusiness()
    ..getSport()
    ..getScience(),
    )],
      child: BlocConsumer<DarkCubit, DarkStatu>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Directionality(
                textDirection: TextDirection.rtl, child: NewsLayout()),
            theme: ThemeData(
                textTheme: TextTheme(
                    bodyText1: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
                primaryColor: Colors.deepOrange,
                primarySwatch: Colors.deepOrange,
                appBarTheme: AppBarTheme(
                  iconTheme: IconThemeData(
                    color: Colors.black,
                  ),
                  backwardsCompatibility: false,
                  backgroundColor: Colors.white,
                  elevation: 0,
                  titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.white,
                    statusBarIconBrightness: Brightness.dark,
                    statusBarBrightness: Brightness.dark,
                  ),
                ),
                scaffoldBackgroundColor: Colors.white,
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  unselectedItemColor: Colors.grey,
                  backgroundColor: Colors.white,
                  selectedItemColor: Colors.deepOrange,
                  elevation: 20,
                )),
            darkTheme: ThemeData(
                textTheme: TextTheme(
                    bodyText1: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                primaryColor: Colors.deepOrange,
                primarySwatch: Colors.deepOrange,
                appBarTheme: AppBarTheme(
                  iconTheme: IconThemeData(
                    color: Colors.white,
                  ),
                  backwardsCompatibility: false,
                  backgroundColor: Colors.grey[800],
                  elevation: 0,
                  titleTextStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.grey[800],
                    statusBarIconBrightness: Brightness.light,
                    statusBarBrightness: Brightness.light,
                  ),
                ),
                scaffoldBackgroundColor: Colors.grey[800],
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.deepOrange,
                  backgroundColor: Colors.grey[800],
                  unselectedItemColor: Colors.grey,
                  elevation: 20,
                )),
            themeMode: DarkCubit.get(context).isDark
                ? ThemeMode.dark
                : ThemeMode.light,
          );
        },
      ),
    );
  }
}


