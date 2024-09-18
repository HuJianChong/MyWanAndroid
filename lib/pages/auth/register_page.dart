import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';

import '../../common_ui/common_styles.dart';
import 'auth_view_model.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _RegisterPageState();
  }
}

class _RegisterPageState extends State<RegisterPage> {
  var model = AuthViewModel();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) {
          return model;
        },
        child: Scaffold(
            backgroundColor: Colors.teal,
            body: SafeArea(
                child: Expanded(
                    child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 15.w),
                        width: double.infinity,
                        height: double.infinity,
                        alignment: Alignment.center,
                        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                          commonInputText(
                              labelText: '输入账号',
                              onChanged: (value) {
                                model.inputUserName = value;
                              }),
                          SizedBox(height: 15.h),
                          commonInputText(
                              labelText: '输入密码',
                              obscureText: true,
                              onChanged: (value) {
                                model.inputPassword = value;
                              }),
                          SizedBox(height: 15.h),
                          commonInputText(
                              labelText: '再次输入密码',
                              obscureText: true,
                              onChanged: (value) {
                                model.inputPasswordTwice = value;
                              }),
                          SizedBox(height: 45.h),
                          outlineWhiteButton("点我注册", onTap: () {
                            model.register().then((value) {
                              if (value) {
                                Navigator.pop(context);
                                showToast("注册成功");
                              } else {
                                showToast("注册失败");
                              }
                            });
                            log("${model.inputUserName}");
                            log("${model.inputPassword}");
                          })
                        ]))))));
  }
}
