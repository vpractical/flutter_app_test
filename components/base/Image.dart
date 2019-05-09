import 'package:flutter/material.dart';

///ImageProvider的子类：
///AssetImage,ExactAssetImage,FileImage,NetworkImage,MemoryImage

///FadeInImage渐显加载网络图片
///???RawImage AssetBundle AssetStream
void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Image'),
      ),
      body: Body(),
    ),
  ));
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          color: Colors.grey,
          child: Image(
            image: AssetImage('assets/images/shake.png'),
            excludeFromSemantics: false,
            width: 80,
            height: 80,
            //设置图片本身颜色，适用于icon
            color: Colors.green,
            //和color配合,颜色和图片混合,类似Xfermode
            colorBlendMode: BlendMode.srcIn,
            //图片填充模式
            //BoxFit.contain:全图居中显示但不充满，显示原比例
            //BoxFit.cover:图片可能拉伸，也可能裁剪，但是充满容器
            //BoxFit.fill:全图显示且填充满，图片可能会拉伸
            //BoxFit.fitHeight:图片可能拉伸，可能裁剪，高度充满
            //BoxFit.fitWidth:片可能拉伸，可能裁剪，宽度充满
            //BoxFit.scaleDown:效果和contain差不多， 但是只能缩小图片，不能放大图片
            fit: BoxFit.contain,
            alignment: Alignment.center,
            //设置重复显示:默认no-repeat不重复,repeat-x水平重复,repeat-y垂直重复,repeat两个方向都重复,
            repeat: ImageRepeat.noRepeat,
            //设置图片内部拉伸，相当于在图片内部设置了一个.9图
            //  centerSlice: Rect,
            matchTextDirection: false,
            gaplessPlayback: false,
            filterQuality: FilterQuality.low,
            //semanticLabel: ,
          ),
        ),
        //AssetImage类型的Image的简化用法
        Image.asset('assets/images/shake.png', width: 80, height: 80),
        Image.network(
          'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=2102088240,2728155711&fm=26&gp=0.jpg',
          width: 80,
          height: 80,
          //color: Colors.yellowAccent,
        ),
        //加载本地图片
//        Image.file(file),
        //加载2进制图片数组
//        Image.memory(bytes),
        FadeInImage(
          placeholder: AssetImage('assets/images/shake.png'),
          image: NetworkImage(
              'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=2102088240,2728155711&fm=26&gp=0.jpg'),
          width: 130,
          height: 130,
          fadeInCurve: Curves.easeIn,
          fadeInDuration: Duration(seconds: 2),
          fadeOutCurve: Curves.easeOut,
          fadeOutDuration: Duration(seconds: 2),
          //this.excludeFromSemantics = false,
          //this.imageSemanticLabel,
          //this.placeholderSemanticLabel,
          //this.fit,
          //this.alignment = Alignment.center,
          //this.repeat = ImageRepeat.noRepeat,
          //this.matchTextDirection = false,
        ),
        //通过 paintImage 绘制出来的Image,参数是dart：ui下的Image而不是Material下的Image
//        RawImage(
//            //this.image,
//            //this.width,
//            //this.height,
//            //this.scale = 1.0,
//            //this.color,
//            //this.colorBlendMode,
//            //this.fit,
//            //this.alignment = Alignment.center,
//            //this.repeat = ImageRepeat.noRepeat,
//            //this.centerSlice,
//            //this.matchTextDirection = false,
//            //this.invertColors = false,
//            //this.filterQuality = FilterQuality.low,
//            ),
      ],
    );
  }
}
