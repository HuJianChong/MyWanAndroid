import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///通用弹窗父组件
class ParentDialog extends Dialog {
  //是否可以点击空白处消失
  final bool? touchOutsideDismiss;

  //弹窗外部区域背景色
  final Color? outsideBackgroundColor;

  //弹窗圆角
  final double? borderRadius;

  //宽度
  final double? width;

  //高度
  final double? height;

  //外边距
  final EdgeInsetsGeometry? margin;

  //内边距
  final EdgeInsetsGeometry? padding;

  //弹窗外部区域点击事件
  final GestureTapCallback? outsideOnTap;

  //弹窗子布局
  final Widget childWidget;

  //底部透明消失按钮事件
  final GestureTapCallback? dismissClick;

  //是否显示底部透明消失按钮
  final bool? showTransparenceButton;

  //是否点击空白区域关闭软键盘
  final bool? touchOutsideCloseKeyboard;

  //子布局背景色
  final Color? bodyBgColor;

  const ParentDialog(
      {this.bodyBgColor,
      this.touchOutsideDismiss,
      this.outsideBackgroundColor,
      this.borderRadius,
      this.width,
      this.height,
      this.margin,
      this.padding,
      this.outsideOnTap,
      required this.childWidget,
      this.dismissClick,
      this.showTransparenceButton,
      this.touchOutsideCloseKeyboard,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: outsideBackgroundColor ?? const Color(0x00000000),
        body: WillPopScope(
            onWillPop: () async {
              //有软键盘也隐藏软键盘
              if (touchOutsideCloseKeyboard == true) {
                FocusScope.of(context).unfocus();
              }
              return touchOutsideDismiss ?? false;
            },
            child: GestureDetector(
                onTap: () {
                  //有软键盘也隐藏软键盘
                  if (touchOutsideCloseKeyboard == true) {
                    FocusScope.of(context).unfocus();
                  }
                  if (touchOutsideDismiss != null && touchOutsideDismiss == true) {
                    Navigator.pop(context);
                  }
                  if (outsideOnTap != null) {
                    outsideOnTap?.call();
                  }
                },
                child: Center(child: _showDialogBody(context)))));
  }

  ///如果显示底部透明按钮需要 showTransparenceButton=true
  Widget _showDialogBody(BuildContext context) {
    if (showTransparenceButton == true) {
      return ListView(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: [_dialogBody(context), SizedBox(height: 20.h), _dismissBtnWidget(context)]);
    } else {
      return _dialogBody(context);
    }
  }

  ///弹窗内容
  Widget _dialogBody(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 10.r)),
            color: bodyBgColor ?? Theme.of(context).listTileTheme.tileColor),
        width: width ?? double.infinity,
        height: height,
        margin: margin ?? EdgeInsets.symmetric(horizontal: 37.w),
        padding: padding ?? EdgeInsets.zero,
        child: IntrinsicHeight(child: childWidget));
  }

  ///底部透明弹窗关闭按钮
  Widget _dismissBtnWidget(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
              if (dismissClick != null && showTransparenceButton == true) {
                dismissClick?.call();
              }
            },
            child: Image.asset("assets/wt_res/images/icon_survey_dialog_dismiss.png",
                width: 45.r, height: 45.r)));
  }
}

enum DialogContentType {
  //正常标题与内容样式
  Normal,
  //标题与富文本内容样式
  RichText,
  //没有标题只有内容样式
  NormalNoTitle,
  //没有标题内容是富文本样式
  RichTextNoTitle
}

enum DialogButtonType {
  //双文本按钮
  DoubleButton,
  //单个文本按钮
  SingleTextButton,
  //单个圆角按钮
  SingleRadiusButton,
  //两个圆角按钮
  DoubleRaidusButton,
  //使用开发者自己定义的
  Customer
}

///普通标题与内容，富文本内容、双按钮与单按钮通用提示弹窗样式
class TipsCommonDialog extends StatelessWidget {
  //内容样式
  final DialogContentType dialogContentType;

  //按钮样式
  final DialogButtonType dialogButtonType;

  //标题
  final String? title;

  //标题样式
  final TextStyle? titleStyle;

  //标题下内容
  final String? content;

  //自定义标题下内容组件：自定义优先级高
  final Widget? customContentWidget;

  //标题下内容样式
  final TextStyle? contentStyle;

  //标题与内容高度
  final double? contentHeight;

  //标题与内容宽度
  final double? contentWidth;

  //富文本内容
  final List<InlineSpan>? richChildren;

  //标题与内容内边距
  final EdgeInsetsGeometry? contentPadding;

  //标题与内容外边距
  final EdgeInsetsGeometry? contentMargin;

  //左边按钮文本
  final String? leftBtnText;

  //右边按钮文本
  final String? rightBtnText;

  //左边按钮事件
  final GestureTapCallback? leftOnTap;

  //右边按钮事件
  final GestureTapCallback? rightOnTap;

  //按钮区域高度
  final double? buttonAreaHeight;

  //左边按钮文本样式
  final TextStyle? leftTextStyle;

  //右边按钮文本样式
  final TextStyle? rightTextStyle;

  //单按钮文本
  final String? singleButtonText;

  //单按钮事件
  final GestureTapCallback? singleButtonOnTap;

  //单按钮文本样式
  final TextStyle? singleTextButtonStyle;

  //单个圆角按钮自定义样式
  final Widget? radiusButton;

  //自定义底部按钮布局：自定义底部布局不为空时内置按钮组件会失效，自定义优先级高
  final Widget? customBottomButtonWidget;

  //背景颜色
  final Color? backgroundColor;

  //圆角，默认10
  final BorderRadius? borderRadius;

  const TipsCommonDialog({
    super.key,
    this.title,
    required this.dialogContentType,
    required this.dialogButtonType,
    this.titleStyle,
    this.contentHeight,
    this.contentWidth,
    this.richChildren,
    this.contentPadding,
    this.contentMargin,
    this.content,
    this.contentStyle,
    this.leftBtnText,
    this.rightBtnText,
    this.leftOnTap,
    this.rightOnTap,
    this.buttonAreaHeight,
    this.leftTextStyle,
    this.rightTextStyle,
    this.singleButtonText,
    this.singleButtonOnTap,
    this.singleTextButtonStyle,
    this.radiusButton,
    this.customContentWidget,
    this.customBottomButtonWidget,
    this.backgroundColor,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: backgroundColor ?? Colors.white,
            borderRadius: borderRadius ?? BorderRadius.all(Radius.circular(10.r))),
        child: Column(children: [
          getContentWidget(),

          //自定义底部布局不为空时内置按钮组件会失效
          customBottomButtonWidget ?? getButtons()
        ]));
  }

  Widget getContentWidget() {
    if (dialogContentType == DialogContentType.Normal) {
      //普通标题内容样式
      return normalTitleContent(
          title: title,
          titleStyle: titleStyle,
          contentHeight: contentHeight,
          contentWidth: contentWidth,
          content: content,
          contentStyle: contentStyle,
          customContentWidget: customContentWidget,
          contentPadding: contentPadding,
          contentMargin: contentMargin);
    } else if (dialogContentType == DialogContentType.RichText) {
      //带有富文本样式的内容
      return richTextContent(
          title: title,
          titleStyle: titleStyle,
          contentHeight: contentHeight,
          contentWidth: contentWidth,
          richChildren: richChildren,
          contentPadding: contentPadding,
          contentMargin: contentMargin);
    } else if (dialogContentType == DialogContentType.NormalNoTitle) {
      //没有标题的内容样式
      return noTitleContent(
          content: content,
          contentStyle: contentStyle,
          customContentWidget: customContentWidget,
          contentHeight: contentHeight,
          contentWidth: contentWidth,
          contentPadding: contentPadding,
          contentMargin: contentMargin);
    } else if (dialogContentType == DialogContentType.RichTextNoTitle) {
      //没有标题的富文本内容样式
      return noTitleRichContent(
          contentHeight: contentHeight,
          contentWidth: contentWidth,
          richChildren: richChildren,
          contentPadding: contentPadding,
          contentMargin: contentMargin);
    }
    return const SizedBox();
  }

  Widget getButtons() {
    if (dialogButtonType == DialogButtonType.DoubleButton) {
      //底部两个文本按钮样式
      return doubleButtons(
          leftBtnText: leftBtnText,
          rightBtnText: rightBtnText,
          leftOnTap: leftOnTap,
          rightOnTap: rightOnTap,
          buttonAreaHeight: buttonAreaHeight,
          leftTextStyle: leftTextStyle,
          rightTextStyle: rightTextStyle);
    } else if (dialogButtonType == DialogButtonType.SingleTextButton) {
      //单个文本按钮样式
      return singleTextButton(
          singleButtonText: singleButtonText,
          singleButtonOnTap: singleButtonOnTap,
          buttonAreaHeight: buttonAreaHeight,
          singleTextButtonStyle: singleTextButtonStyle);
    } else if (dialogButtonType == DialogButtonType.SingleRadiusButton) {
      //单个圆角按钮样式
      return singleRadiusButton(
        singleButtonText: singleButtonText,
        singleButtonOnTap: singleButtonOnTap,
        buttonAreaHeight: buttonAreaHeight,
        radiusButton: radiusButton,
      );
    } else if (dialogButtonType == DialogButtonType.DoubleRaidusButton) {
      //两个圆角按钮样式
      return doubleRadiusButton(
          leftBtnText: leftBtnText,
          rightBtnText: rightBtnText,
          leftOnTap: leftOnTap,
          rightOnTap: rightOnTap);
    }
    return const SizedBox();
  }

  /// 普通标题内容样式
  ///[title]             标题
  ///[titleStyle]        标题样式
  ///[contentHeight]     内容高度
  ///[contentWidth]      内容宽度
  ///[content]           内容
  ///[contentStyle]      内容样式
  ///[contentPadding]    内边距
  ///[contentMargin]     外边距
  ///
  Widget normalTitleContent(
      {String? title,
      TextStyle? titleStyle,
      double? contentHeight,
      double? contentWidth,
      String? content,
      TextStyle? contentStyle,
      Widget? customContentWidget,
      EdgeInsetsGeometry? contentPadding,
      EdgeInsetsGeometry? contentMargin}) {
    return Container(
        padding: contentPadding ?? EdgeInsets.all(20.w),
        margin: contentMargin ?? EdgeInsets.zero,
        width: contentWidth ?? double.infinity,
        height: contentHeight,
        child: Column(children: [
          Text(title ?? '',
              style: titleStyle ?? TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600)),
          SizedBox(height: 8.h),
          customContentWidget ??
              Text(content ?? '', style: contentStyle ?? TextStyle(fontSize: 14.sp))
        ]));
  }

  /// 带有富文本样式的内容
  ///[title]             标题
  ///[titleStyle]        标题样式
  ///[contentHeight]     内容高度
  ///[contentWidth]      内容宽度
  ///[richChildren]      富文本组 TextSpan
  ///[contentPadding]    内边距
  ///[contentMargin]     外边距
  ///
  Widget richTextContent(
      {String? title,
      TextStyle? titleStyle,
      double? contentHeight,
      double? contentWidth,
      List<InlineSpan>? richChildren,
      EdgeInsetsGeometry? contentPadding,
      EdgeInsetsGeometry? contentMargin}) {
    return Container(
        padding: contentPadding ?? EdgeInsets.all(20.w),
        margin: contentMargin ?? EdgeInsets.zero,
        width: contentWidth ?? double.infinity,
        height: contentHeight,
        child: Column(children: [
          Text(title ?? '',
              style: titleStyle ??
                  TextStyle(
                      fontSize: 16.sp, fontWeight: FontWeight.w600, color: Color(0xFF333333))),
          SizedBox(height: 8.h),
          RichText(
              text: TextSpan(
                  text: '',
                  style: TextStyle(fontSize: 14.sp, color: Color(0xFF666666)),
                  children: richChildren))
        ]));
  }

  ///没有标题的内容样式
  Widget noTitleContent(
      {String? content,
      TextStyle? contentStyle,
      Widget? customContentWidget,
      double? contentHeight,
      double? contentWidth,
      EdgeInsetsGeometry? contentPadding,
      EdgeInsetsGeometry? contentMargin}) {
    return Container(
        padding: contentPadding ?? EdgeInsets.all(20.w),
        margin: contentMargin ?? EdgeInsets.zero,
        width: contentWidth ?? double.infinity,
        height: contentHeight,
        child: Center(
            child: customContentWidget ??
                Text(content ?? '', style: contentStyle ?? TextStyle(fontSize: 14.sp))));
  }

  ///没有标题的富文本内容样式
  Widget noTitleRichContent(
      {double? contentHeight,
      double? contentWidth,
      List<InlineSpan>? richChildren,
      EdgeInsetsGeometry? contentPadding,
      EdgeInsetsGeometry? contentMargin}) {
    return Container(
        padding: contentPadding ?? EdgeInsets.all(20.w),
        margin: contentMargin ?? EdgeInsets.zero,
        width: contentWidth ?? double.infinity,
        height: contentHeight,
        child: Center(
            child: RichText(
                text: TextSpan(
                    text: '',
                    style: TextStyle(fontSize: 14.sp, color: Color(0xFF666666)),
                    children: richChildren))));
  }

  ///底部两个文本按钮样式
  ///[leftBtnText]      左边按钮文字
  ///[rightBtnText]     右边按钮文字
  ///[leftOnTap]        左边按钮事件
  ///[rightOnTap]       右边按钮事件
  ///[buttonAreaHeight] 按钮区域高度
  ///[leftTextStyle]    左边按钮样式
  ///[rightTextStyle]   右边按钮样式
  Widget doubleButtons({
    String? leftBtnText,
    String? rightBtnText,
    GestureTapCallback? leftOnTap,
    GestureTapCallback? rightOnTap,
    double? buttonAreaHeight,
    TextStyle? leftTextStyle,
    TextStyle? rightTextStyle,
  }) {
    double height = 50.h;
    if (buttonAreaHeight != null) {
      height = buttonAreaHeight + 0.5.h;
    }
    double verticalLineHeight = height - 0.5.h;
    return SizedBox(
        width: double.infinity,
        height: height,
        child: Column(children: [
          Container(width: double.infinity, height: 0.5.h, color: const Color(0xFFEEEEEE)),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            GestureDetector(
                onTap: leftOnTap,
                child: Text(leftBtnText ?? '取消',
                    style: leftTextStyle ?? TextStyle(fontSize: 16.sp, color: Color(0xFF666666)))),
            Container(width: 0.5.w, height: verticalLineHeight, color: const Color(0xFFEEEEEE)),
            GestureDetector(
                onTap: rightOnTap,
                child: Text(rightBtnText ?? '确定',
                    style: rightTextStyle ??
                        TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.w600, color: Colors.teal)))
          ])
        ]));
  }

  ///单个文本按钮样式
  ///[singleButtonText]       按钮文字
  ///[singleButtonOnTap]      按钮事件
  ///[buttonAreaHeight]       按钮高度
  ///[singleTextButtonStyle]  按钮样式
  Widget singleTextButton({
    String? singleButtonText,
    GestureTapCallback? singleButtonOnTap,
    double? buttonAreaHeight,
    TextStyle? singleTextButtonStyle,
  }) {
    return SizedBox(
        width: double.infinity,
        height: buttonAreaHeight ?? 50.h,
        child: GestureDetector(
            onTap: singleButtonOnTap,
            child: Column(children: [
              Container(width: double.infinity, height: 0.5.h, color: const Color(0xFFEEEEEE)),
              Expanded(
                  child: Center(
                      child: Text(singleButtonText ?? '我知道了',
                          style: singleTextButtonStyle ??
                              TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFFF74350)))))
            ])));
  }

  ///单个圆角按钮样式
  ///[singleButtonText]     按钮文字
  ///[singleButtonOnTap]    按钮事件
  ///[buttonAreaHeight]     按钮高度
  ///[radiusButton]         按钮自定义
  Widget singleRadiusButton({
    String? singleButtonText,
    GestureTapCallback? singleButtonOnTap,
    double? buttonAreaHeight,
    Widget? radiusButton,
  }) {
    return SizedBox(
        width: double.infinity,
        height: buttonAreaHeight ?? 64.h,
        child: Column(children: [
          radiusButton ??
              baseButton(
                  width: double.infinity,
                  child: Text(singleButtonText ?? "确定",
                      style: TextStyle(fontSize: 18.sp, color: Colors.white)),
                  margin: EdgeInsets.only(left: 20.w, right: 20.w),
                  onTap: singleButtonOnTap),
          SizedBox(height: 20.h)
        ]));
  }

  ///两个圆角按钮样式
  Widget doubleRadiusButton({
    String? leftBtnText,
    String? rightBtnText,
    GestureTapCallback? leftOnTap,
    GestureTapCallback? rightOnTap,
  }) {
    return Column(children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        smallRadiusButton(isLeft: true, title: leftBtnText ?? '取消', onTap: leftOnTap),
        smallRadiusButton(isLeft: false, title: rightBtnText ?? '同意', onTap: rightOnTap)
      ]),
      SizedBox(height: 20.h)
    ]);
  }

  Widget smallRadiusButton(
      {required bool isLeft, required String title, GestureTapCallback? onTap}) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          width: 125.w,
          height: 44.h,
          decoration: BoxDecoration(
              border: Border.all(width: 0.5.r, color: const Color(0xFFF74350)),
              borderRadius: BorderRadius.all(Radius.circular(22.r)),
              color: isLeft ? Colors.white : const Color(0xFFF74350)),
          child: Center(
              child: Text(title,
                  style: TextStyle(
                      fontSize: 16.sp, color: isLeft ? const Color(0xFFF74350) : Colors.white))),
        ));
  }

  ///项目通用按钮布局
  static Widget baseButton(
      {String? butStr,
      double? width,
      double? height,
      EdgeInsetsGeometry? padding,
      EdgeInsetsGeometry? margin,
      Color? color,
      AlignmentGeometry? alignment,
      GestureTapCallback? onTap,
      Widget? child}) {
    return InkWell(
        onTap: onTap,
        child: Container(
            alignment: alignment ?? Alignment.center,
            width: width ?? ScreenUtil().screenWidth,
            height: height ?? 44.r,
            padding: padding,
            margin: margin,
            decoration: BoxDecoration(
                color: color ?? const Color(0xFFF74350), borderRadius: BorderRadius.circular(22.r)),
            child: child ??
                Text(butStr ?? "", style: TextStyle(fontSize: 18.sp, color: Colors.white))));
  }
}
