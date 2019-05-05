import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/gestures.dart';

///给第二个输入框focusNode赋值，可以主动获取焦点
///
///TextInputType.text（普通完整键盘）
///TextInputType.number（数字键盘）
///TextInputType.emailAddress（带有“@”的普通键盘）
///TextInputType.datetime（带有“/”和“：”的数字键盘）
///TextInputType.multiline（带有选项以启用有符号和十进制模式的数字键盘）
///
///TextCapitalization.sentences : 这是我们期望的正常类型的大写，每个句子的首字母大写
///TextCapitalization.characters:大写句子中的所有字符。
///TextCapitalization.words : 将每个单词的首字母大写。
///TextCapitalization.none
///
///TextAlign.justify拉伸以软换行符结尾的文本行，以填充容器,以硬换行符结尾的行与[开始]边缘对齐
///
///
void main() {
  TextEditingController _controller = TextEditingController();
  FocusNode secondFocusNode = FocusNode();
  List<TextInputFormatter> formatters = [
    BlacklistingTextInputFormatter('123'),
    LengthLimitingTextInputFormatter(5),
//    WhitelistingTextInputFormatter(_PatternImpl()),
  ];

  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          TextField(
            controller: _controller,
            focusNode: null,
            keyboardType: TextInputType.number,
            //软键盘上确认键的类型
            textInputAction: TextInputAction.go,
            //如何使输入中的字母大写的选项
            textCapitalization: TextCapitalization.none,
            style: TextStyle(),
            strutStyle: StrutStyle(
                //...
                ),
            textAlign: TextAlign.justify,
            //文字从右向左写
            textDirection: TextDirection.rtl,
            autofocus: false,
            //是否隐藏输入,密码等用
            obscureText: false,
            //是否自动更正???
            autocorrect: true,
            maxLines: 1,
            maxLength: 4,
            //false:当输入超过最大长度时，会显示输入内容，true:不会
            maxLengthEnforced: false,
            onChanged: (text) {
              print(text);
            },
            //按回车时调用
            onEditingComplete: () {
              print('onEditingComplete');
            },
            //内容提交(按回车)的回调
            onSubmitted: (text) {
              print('onSubmitted:$text');
            },
            //匹配输入的字符，在黑名单中的直接删除，超出长度的不能再输入，白名单
            inputFormatters: formatters,
            enabled: true,
            cursorColor: Colors.red,
            cursorWidth: 3,
            //光标圆角弧度
            cursorRadius: Radius.circular(5),
            //亮色主题还是暗色主题
            keyboardAppearance: Brightness.light,
            //滚动时ui效果???
            scrollPadding: EdgeInsets.all(20),
            dragStartBehavior: DragStartBehavior.start,
            //是否允许互动，如复制等
            enableInteractiveSelection: true,
            onTap: () {
              print('onTap');
            },
          ),
          TextField(
            controller: _controller,
            focusNode: secondFocusNode,
            decoration: InputDecoration(
              icon: Icon(Icons.ac_unit),
              //用于描述输入框，例如这个输入框是用来输入用户名还是密码的，当输入框获取焦点时默认会浮动到上方
              labelText: 'labelText',
              labelStyle: TextStyle(),
              //辅助文本，和errorText同位置，如果errorText不为null的话，则helperText不会显示
              helperText: 'helperText',
              helperStyle: TextStyle(),
              hintText: 'hint',
              hintStyle: TextStyle(),
              hintMaxLines: 1,
              //错误信息提示,在下方左侧
              errorText: null,
              errorStyle: TextStyle(),
              errorMaxLines: 1,
              //labelText是否浮动，默认true，false在获取焦点时显示hint不显示labelText
              hasFloatingPlaceholder: true,
              //改变输入框是否为密集型，默认为false，修改为true时，图标及间距会变小
              isDense: false,
              contentPadding: EdgeInsets.all(5),
              //位于输入框内部起始位置的图标
              prefixIcon: Icon(Icons.ac_unit),
              //预先填充的Widget,跟prefixText同时只能出现一个
              prefix: Text('prefix'),
              //预填充的文本
//              prefixText: 'prefixText',
              prefixStyle: TextStyle(),
              //位于输入框后面的图片,例如一般输入框后面会有个眼睛，控制输入内容是否明文
              suffixIcon: Icon(Icons.label),
              //位于输入框尾部的控件，同样的不能和suffixText同时使用
//              suffix: Text('suffix'),
              //位于尾部的填充文字
              suffixText: 'suffixText',
              suffixStyle: TextStyle(),
              //位于输入框右下方的小控件，不能和counterText同时使用
//              counter: Text('counter'),
              counterText: 'counterText',
              counterStyle: TextStyle(),
              //如果为true，则输入框使用fillColor指定的颜色填充
              filled: false,
              fillColor: Colors.greenAccent,
//              errorBorder: ,
//              focusedBorder: ,
//              focusedErrorBorder: ,//errorText不为空时，输入框有焦点时的边框
//              disabledBorder: ,//输入框不可用时显示的边框，如果errorText不为空的话，该属性无效
//              enabledBorder: ,//输入框可用时显示的边框，如果errorText不为空的话，该属性无效
//              enabled: ,
              //正常情况下的边框OutlineInputBorder全边框，UnderLine底边框
              border: OutlineInputBorder(),
              //???
              semanticCounterText: 'semanticCounterText',
              //???
              alignLabelWithHint: true,
            ),
            //counter未设置时，生成一个
            buildCounter: (
              BuildContext context, {
              int currentLength,
              int maxLength,
              bool isFocused,
            }) {
              return Text(
                'buildCounter',
              );
            },
            onChanged: (text) => print(text),
          ),
        ],
      ),
    ),
  ));
}

class _PatternImpl extends Pattern {
  @override
  Iterable<Match> allMatches(String string, [int start = 0]) {
    return null;
  }

  @override
  Match matchAsPrefix(String string, [int start = 0]) {
    return null;
  }
}
