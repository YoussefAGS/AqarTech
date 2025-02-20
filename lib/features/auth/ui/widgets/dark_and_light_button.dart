//
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:aqartech/core/common/animations/animate_do.dart';
// import 'package:aqartech/core/common/custom_liner_button.dart';
// import '../../../../core/app/app_cubit/app_cubit.dart';
//
// class DarkAndLangButtons extends StatelessWidget {
//   const DarkAndLangButtons({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final cubit = context.read<AppCubit>();
//
//     return CustomFadeInRight(
//       duration: 400,
//       child: CustomLinearButton(
//           height: 100.sp,
//           width: 100.sp,
//           onPressed: () {
//             if (AppLocalizations.of(context)!.isEnLocale) {
//               cubit.toArabic();
//             } else {
//               cubit.toEnglish();
//             }
//           },
//           child: Text(
//              context.translate(LangKeys.language),
//             style:TextStyles.font16WhiteMedium,
//           )),
//     );
//   }
// }
