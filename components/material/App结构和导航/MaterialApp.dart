import 'package:flutter/material.dart';
import 'TabBar.dart';

/// 如果home首页指定了，routes里面就不能有'/'的根路由了，会报错，/指定的根路由就多余了
/// 如果没有home指定具体的页面，那routes里面就傲有/来指定根路由
/// 路由的顺序按照下面的规则来：
/// 1、如果有home，就会从home进入
/// 2、如果没有home，有routes，并且routes指定了入口'/'，就会从routes的/进入
/// 3、如果上面两个都没有，或者路由不可用，如果有 onGenerateRoute，就会进入生成的路由
/// 4、如果连上面的生成路由也没有，就会走到onUnknownRoute，不明所以的路由，比如网络连接失败，可以进入断网的页面

/// 关于initialRoute：Navigator默认展示的页面，而且这个参数接受从Native端传入，
/// e.g.Intent(context,FlutterActivity.class).putExtra("route",page).startActivity();
final routes = {
  '/Trans': (BuildContext context) => App(),
  '/Scale': (BuildContext context) => App2(),
  '/': (BuildContext context) => Home(),
};

void main() {
  List<NavigatorObserver> navObservers = [RouteNavigatorObserver()];

  runApp(MaterialApp(
    //导航的key,
    navigatorKey: GlobalKey(),
    //设备用于识别应用程序。在Android上，显示在任务管理器的应用程序上方，“最近的应程序”会显示
    title: 'MaterialApp',
    //要提供初始化的标题，可以用 onGenerateTitle
    onGenerateTitle: (context) => 'generatedTitle',

    //主页/
//    home: Home(),
    routes: routes,
    //初始路由
    initialRoute: '/',
    //生成路由
//    onGenerateRoute: (RouteSettings settings) => MaterialPageRoute<void>(
//          settings: settings,
//          builder: (BuildContext context) => Home(),
//        ),
    //没有可用路由的路由，将路由顺序的123注释掉后可见
    onUnknownRoute: (RouteSettings settings) => MaterialPageRoute<void>(
          settings: settings,
          builder: (BuildContext context) => Text('路由统统不可用'),
        ),
    //导航观察者,跳转时的回调,可以拿到当前路由和后面路由的信息
    navigatorObservers: navObservers,
    //有builder设置时，路由无效，直接返回builder结果
//    builder: (BuildContext context, Widget child) {
//      return Text('builder属性');
//    },
    //任务管理器的标题背景颜色
    color: Colors.red,

    //属性多另外说
    theme: ThemeData(
      primaryColor: Color(0xFFC91B3A),
      backgroundColor: Color(0xFFEFEFEF),
      accentColor: Color(0xFF888888),
    ),
    darkTheme: ThemeData(),
//    locale: Locale('en'), //支持的语言
//    supportedLocales: const [Locale('en', 'US'), Locale('fi')], //支持的多国语言
//      localizationsDelegates:,//多语言代理
//      localeResolutionCallback:,//多语言回调
    showPerformanceOverlay: false, //打开性能监视，覆盖在屏幕最上面
    checkerboardOffscreenLayers: false, //打开屏幕外图像的缓存???
    checkerboardRasterCacheImages: false, //打开图像缓存???
    debugShowCheckedModeBanner: true, //是否显示右上角debug标记
    showSemanticsDebugger: false, //打开一个覆盖图，显示框架报告的可访问性信息
  ));
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(),
    );
  }
}

class RouteNavigatorObserver extends NavigatorObserver {
  @override
  void didPush(Route route, Route previousRoute) {
    super.didPush(route, previousRoute);
    print('route=${route.toString()}-previousRoute=${previousRoute.toString()}');
  }
//...
}
