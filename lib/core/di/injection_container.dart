
import 'package:aqartech/features/home/data/data_source/api_home_services.dart';
import 'package:aqartech/features/home/data/data_source/home_data_source.dart';
import 'package:aqartech/features/home/data/repo/home_repo.dart';
import 'package:aqartech/features/home/logic/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../../features/auth/data/data_source/api_loing_services.dart';
import '../../features/auth/data/data_source/login_data_source.dart';
import '../../features/auth/data/repos/login_repo.dart';
import '../../features/auth/logic/cubit/login_cubit.dart';
import '../../features/auth/logic/sign_up_cubit/sign_up_cubit.dart';
import '../../features/booking/data/data_source/api_booking_services.dart';
import '../../features/booking/data/data_source/booking_data_source.dart';
import '../../features/booking/data/repo/booking_repo.dart';
import '../../features/booking/logic/add_delete_card_cubit/add_delete_card_cubit.dart';
import '../../features/booking/logic/booking_date_cubit/booking_date_cubit.dart';
import '../../features/booking/logic/checkout_cubit/check_out_cubit.dart';
import '../../features/booking/logic/saved_card_cubit/saved_card_cubit.dart';
import '../app/app_cubit/app_cubit.dart';
import '../networking/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  final dio =  DioFactory.getDio();
  // final dioWithoutToken =  DioFactory.getDioWithToken();

  final navigationkey =  GlobalKey<NavigatorState>();
  getIt.registerLazySingleton(() => dio);
  getIt.registerFactory(AppCubit.new);

  getIt.registerLazySingleton<GlobalKey<NavigatorState>>(() => navigationkey);

  getIt.registerLazySingleton<AuthDataSource>(() => ApiAuthServices(dio));
  getIt.registerLazySingleton<AuthRepo>(() => AuthRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
  getIt.registerFactory<SignUpCubit>(() => SignUpCubit(getIt()));


  getIt.registerLazySingleton<BookingDataSource>(() => ApiBookingServices(dio));
  getIt.registerLazySingleton<BookingRepo>(() => BookingRepo( bookingDataSource: getIt(),));
  getIt.registerFactory<BookingDateCubit>(() => BookingDateCubit(getIt()));
  getIt.registerFactory<CheckOutCubit>(() => CheckOutCubit(getIt()));
  getIt.registerFactory<AddDeleteCardCubit>(() => AddDeleteCardCubit(getIt()));
  getIt.registerFactory<SavedCardCubit>(() => SavedCardCubit(getIt()));
  //
  //
  //
  // //forgotPassword
  // getIt.registerLazySingleton<ApiForgotPasswordService>(() => ApiForgotPasswordService(dio));
  // getIt.registerLazySingleton<ForgotPasswordRepo>(() => ForgotPasswordRepo(getIt()));
  // getIt.registerFactory<ForgotPasswordCubit>(() => ForgotPasswordCubit(getIt()));
  //
  // // configurations
  // getIt.registerLazySingleton<ConfigurationsDataSource>(() => ApiConfigurationsServices(dio));
  // getIt.registerLazySingleton<ConfigurationsRepo>(() => ConfigurationsRepo(getIt()));
  // getIt.registerFactory<ConfigurationsCubit>(() => ConfigurationsCubit(getIt()));
  //
  //
  //
  //
  // // projectsOverview
  // getIt.registerLazySingleton<ProjectDataSource>(() => ApiProjectOverviewServices(dio));
  // getIt.registerLazySingleton<ProjectOverviewRepo>(() => ProjectOverviewRepo(projectDataSource: getIt()));
  // getIt.registerFactory<AllProjectCubit>(() => AllProjectCubit(getIt()));
  // getIt.registerFactory<ProjectDetailsCubit>(() => ProjectDetailsCubit(getIt()));
  //
  //
  // // chat
  // getIt.registerLazySingleton<ChatDataSource>(() => ApiChatServices(dio));
  // getIt.registerLazySingleton<ChatRepo>(() => ChatRepo(chatDataSource:getIt()));
  // getIt.registerFactory<ProjectChatCubit>(() => ProjectChatCubit(getIt()));
  //  getIt.registerFactory<TeamChatCubit>(() => TeamChatCubit(getIt()));
  // getIt.registerFactory<SocketCubit>(() => SocketCubit());
  //
  //
  // // profile
  // getIt.registerLazySingleton<ProfileDataSource>(() => ApiProfileService(dio));
  // getIt.registerLazySingleton<ProfileRepo>(() => ProfileRepo(getIt()));
  // getIt.registerFactory<ClientCubit>(() => ClientCubit(getIt(), getIt()));
  // getIt.registerFactory<LangAndBussinseCubit>(() => LangAndBussinseCubit(getIt()));
  //
  //
  //
  //

  //home
  getIt.registerLazySingleton<HomeDataSource>(() => ApiHomeService(dio));
  getIt.registerLazySingleton<HomeRepository>(() => HomeRepository(getIt()));
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));




}