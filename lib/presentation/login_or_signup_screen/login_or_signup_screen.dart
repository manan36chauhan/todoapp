import 'bloc/login_or_signup_bloc.dart';
import 'models/login_or_signup_model.dart';
import 'package:flutter/material.dart';
import 'package:tododo/core/app_export.dart';
import 'package:tododo/widgets/custom_elevated_button.dart';
import 'package:tododo/widgets/custom_icon_button.dart';

class LoginOrSignupScreen extends StatelessWidget {
  const LoginOrSignupScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<LoginOrSignupBloc>(
        create: (context) => LoginOrSignupBloc(
            LoginOrSignupState(loginOrSignupModelObj: LoginOrSignupModel()))
          ..add(LoginOrSignupInitialEvent()),
        child: LoginOrSignupScreen());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginOrSignupBloc, LoginOrSignupState>(
        builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              backgroundColor: appTheme.gray5001,
              body: Container(
                  width: double.maxFinite,
                  padding:
                      EdgeInsets.symmetric(horizontal: 32.h, vertical: 39.v),
                  child: Column(children: [
                    Padding(
                        padding: EdgeInsets.only(left: 17.h),
                        child: CustomIconButton(
                            height: 24.adaptSize,
                            width: 24.adaptSize,
                            padding: EdgeInsets.all(6.h),
                            alignment: Alignment.centerLeft,
                            onTap: () {
                              onTapBtnArrowLeft(context);
                            },
                            child: CustomImageView(
                                imagePath: ImageConstant.imgArrowLeft))),
                    SizedBox(height: 41.v),
                    _buildPageHeader(context),
                    SizedBox(height: 30.v),
                    CustomImageView(
                        imagePath: ImageConstant.imgLogoGray5001,
                        height: 105.v,
                        width: 117.h),
                    SizedBox(height: 33.v),
                    Text("lbl_get_in_through".tr,
                        style: theme.textTheme.titleMedium),
                    SizedBox(height: 33.v),
                    CustomElevatedButton(
                        text: "lbl_sign_up".tr,
                        onPressed: () {
                          onTapSignUp(context);
                        }),
                    SizedBox(height: 14.v),
                    CustomElevatedButton(
                        text: "lbl_login".tr,
                        buttonStyle: CustomButtonStyles.fillDeepOrange,
                        buttonTextStyle:
                            CustomTextStyles.titleSmallSecondaryContainer,
                        onPressed: () {
                          onTapLogin(context);
                        }),
                    SizedBox(height: 5.v)
                  ]))));
    });
  }

  /// Section Widget
  Widget _buildPageHeader(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(
          width: 208.h,
          child: Text("msg_welcome_to_our_community".tr,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.displaySmall!.copyWith(height: 1.18))),
      SizedBox(height: 2.v),
      Container(
          width: 281.h,
          margin: EdgeInsets.only(right: 29.h),
          child: Text("msg_our_community_is".tr,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodySmall!.copyWith(height: 1.67)))
    ]);
  }

  /// Navigates to the previous screen.
  onTapBtnArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }

  /// Navigates to the signupScreen when the action is triggered.
  onTapSignUp(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.signupScreen,
    );
  }

  /// Navigates to the loginScreen when the action is triggered.
  onTapLogin(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.loginScreen,
    );
  }
}
