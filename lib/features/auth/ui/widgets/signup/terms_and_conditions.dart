//
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
//
// import '../../../../../core/style/colors/colors.dart';
// import '../../../../../core/style/text_styles/text_styles.dart';
//
// class TermsAndConditions extends StatelessWidget {
//   const TermsAndConditions({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return RichText(
//       textAlign: TextAlign.center,
//       text: TextSpan(
//
//         children: [
//           TextSpan(
//             text: "ddd",
//             style: TextStyles.font14Black400,
//           ),
//           TextSpan(
//             text: "ddd",
//             style: TextStyles.font14Black400.copyWith(
//               color: ColorsManager.mainColor,
//             ),
//             recognizer: TapGestureRecognizer()
//               ..onTap = () {
//                 // Navigator.push(context, MaterialPageRoute(builder: (context) => TermsConditionsScreen()));
//
//                 // Handle Terms and Conditions click
//               },
//
//           ),
//           TextSpan(
//             text: context.translate(LangKeys.and),
//             style:TextStyles.font14Black400,
//           ),
//           TextSpan(
//             text: context.translate(LangKeys.privacyPolicy),
//             style: TextStyles.font14Black400.copyWith(
//               color: ColorsManager.mainColor,
//             ),
//             recognizer: TapGestureRecognizer()
//               ..onTap = () {
//                 // Navigator.push(context, MaterialPageRoute(builder: (context) => PrivacyPolicyScreen()));
//                 // Handle Privacy Policy click
//               },
//           ),
//         ],
//       ),
//     );
//   }
// }
