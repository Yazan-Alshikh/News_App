
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/cubit.dart';
import 'package:news_app/bloc/status.dart';
import 'package:news_app/widget/componants.dart';


class BusinessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context)  {
    return BlocConsumer<NewsCubit, NewsStatu>(
      listener: (context, state) {},
      builder: (context, state)
      {
        var list = NewsCubit.get(context).business;

        return articleBuilder(list,context);
      },
    );
  }
}
