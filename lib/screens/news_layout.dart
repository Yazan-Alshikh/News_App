import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/cubit.dart';
import 'package:news_app/bloc/mode_cubit/cubit_dark.dart';
import 'package:news_app/bloc/status.dart';
import 'package:news_app/local_cache/cash_helper.dart';
import 'package:news_app/screens/search_screen.dart';

class NewsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStatu>(
      listener: (context, state) {},
      builder: (context, state) {
        NewsCubit cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text("News"),
            actions: [
              IconButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchScreen()));
              }, icon: Icon(Icons.search)),
              IconButton(
                  onPressed: () {
                    DarkCubit.get(context).ChangeMode();

                  },
                  icon: Icon(Icons.brightness_4_outlined))
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.curentindex,
            items: cubit.item,
            onTap: (index) {
              cubit.changenav(index);
            },
          ),
          body: cubit.screen[cubit.curentindex],
        );
      },
    );
  }
}
