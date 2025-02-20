part of 'app_cubit.dart';

@freezed
class AppState with _$AppState {
  const factory AppState.initial() = _Initial;

  const factory AppState.themeChangeMode({required bool isDark}) =
      ThemeChangModeStat;

  const factory AppState.languageChangeMode({required Locale locale}) =
      languageChangeModeStat;
}
