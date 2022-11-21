import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app_with_clean_architecture/core/service/service_locator.dart';
import 'package:shop_app_with_clean_architecture/features/theme/cubit/states.dart';

class ThemeModeCubit extends Cubit<ThemeModeStates>
{
  ThemeModeCubit(): super(InitialThemeModeState());

  static ThemeModeCubit get(context)=>BlocProvider.of(context);

  bool isDark = true;

  void changeThemeMode({bool? fromShared})async
  {
    if(fromShared != null){
      isDark = fromShared;
      emit(ChangeThemeModeState());
    }else{
      isDark = !isDark;
      sl<SharedPreferences>().setBool('isDark', isDark).then((value)
      {
        emit(ChangeThemeModeState());
      });
    }
  }

  bool isEnglish = false;

  void getLang()async
  {
    isEnglish = !isEnglish;
    sl<SharedPreferences>().setBool('isEnglish', isEnglish).then((value)
    {
      emit(ChangeLangState());
    });
  }

}