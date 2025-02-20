import 'package:aqartech/core/common/spacing.dart';
import 'package:aqartech/core/extensions/context_extension.dart';
import 'package:aqartech/core/style/text_styles/text_styles.dart';
import 'package:aqartech/core/utils/widgets/app_text_form_field.dart';
import 'package:aqartech/core/utils/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/widgets/logo_row_widget.dart';

import 'package:flutter/material.dart';

class AddPostScreen extends StatelessWidget {
  const AddPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isTrue =
        MediaQuery.of(context).size.width > MediaQuery.of(context).size.height;
    TextEditingController titleController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: isTrue ? 70.sp : 70.sp,
        flexibleSpace: FlexibleSpaceBar(
          background: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (!isTrue) SizedBox(height: 20.sp),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.all(10.sp),
                    decoration: BoxDecoration(
                      color: Color(0xFFEBEBEB),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios_new,
                        size: 20.sp,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        context.pop();
                      },
                    ),
                  ),
                  Text(
                    "Write post in the community",
                    style: TextStyles.font16Black500,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  horizontalSpace(10),
                ],
              ),
            ],
          ),
        ),
        automaticallyImplyLeading: false,
        elevation: 0,
        foregroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(10.sp),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    AppTextFormField(
                      hintText: "Write the main subject",
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please write subject";
                        }
                      },
                      backgroundColor: Color(0xFFF7F7F7),
                      inputTextStyle: TextStyles.font14Black400,
                      hintStyle: TextStyles.font14Black400.copyWith(color: Colors.grey),
                      controller: titleController,
                    ),
                    verticalSpace(10),
                    AppTextFormField(
                      keyboardType: TextInputType.multiline,
                      hintText: "Write your description you want to write about",
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please write description";
                        }
                      },
                      backgroundColor: Color(0xFFF7F7F7),
                      inputTextStyle: TextStyles.font14Black400,
                      hintStyle: TextStyles.font14Black400.copyWith(color: Colors.grey),
                      controller: descriptionController,
                      minLines: 8,
                    ),
                  ],
                ),
              ),
            ),
            /// Button at Bottom
            Padding(
              padding: EdgeInsets.only(bottom: 5.sp), // Adjust bottom padding
              child: CustomButton(
                text: "Post",
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
