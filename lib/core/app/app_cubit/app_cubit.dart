import 'dart:ui';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../common/constants.dart';
import '../../common/shared_pref_helper.dart';
part 'app_state.dart';

part 'app_cubit.freezed.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(const AppState.initial());
  Locale locale = const Locale('en');
  String currentLangCode = 'en';

  //Language Change
  void getSavedLanguage() async{
    final result =  SharedPrefHelper.containPreference(SharedPrefKeys.language)
        ? await SharedPrefHelper.getString(SharedPrefKeys.language)
        : 'en';
    if(!SharedPrefHelper.containPreference(SharedPrefKeys.language)){
      await SharedPrefHelper.setData(SharedPrefKeys.language, "en");
    }

    currentLangCode = result!;

    emit(AppState.languageChangeMode(locale: Locale(currentLangCode)));
  }

  Future<void> _changeLang(String langCode) async {
    await SharedPrefHelper.setData(SharedPrefKeys.language, langCode);
    currentLangCode = langCode;
    emit(AppState.languageChangeMode(locale: Locale(currentLangCode)));
  }

  void toArabic() => _changeLang('ar');

  void toEnglish() => _changeLang('en');
}
