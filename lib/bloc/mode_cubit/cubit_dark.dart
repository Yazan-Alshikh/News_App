import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/mode_cubit/state_dark.dart';
import 'package:news_app/local_cache/cash_helper.dart';

class DarkCubit extends Cubit<DarkStatu> {
  DarkCubit() : super(NewsDarkInitialStatu());

  static DarkCubit get(context) => BlocProvider.of(context);

  bool isDark = false;

  void ChangeMode( {bool shared}) {

      if (shared != null)
      {
        isDark = shared;
        emit(NewsDarkChangeStatu());
      } else {
        isDark = !isDark;
        CacheHelper.setBoll(key: 'Dark', value: isDark).then((value) {
          emit(NewsDarkChangeStatu());
        });
      }


  }
}
