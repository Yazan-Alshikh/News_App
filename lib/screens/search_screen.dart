
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/cubit.dart';
import 'package:news_app/bloc/status.dart';
import 'package:news_app/widget/componants.dart';

class SearchScreen extends StatelessWidget {
var searchcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStatu>(
      listener: (context,state){} ,
      builder: (context, state) {
       var list = NewsCubit.get(context).search;

        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  onChanged: (String value){
                    NewsCubit.get(context).getSearch(value);
                  },
                  controller: searchcontroller,
                  keyboardType: TextInputType.text,
                  autofocus: true,
                  validator: (String value){
                    if (value.isEmpty){
                      return "search must no be Empty";
                    }
                    return null;
                  },
                  decoration:InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                    label: Text("Search"),
                    prefixIcon: Icon(Icons.search),
                  ) ,
                ),
              ),
              Expanded(child: articleBuilder(list,context,IsSearch: true)),

            ],

          ),
        );
      },
    );
  }
}
