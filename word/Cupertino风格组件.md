﻿Tags： flutter
# Cupertino风格组件
[TOC]

---
## 1. 概述
> Cupertino风格组件即IOS风格组件。主要有CupertinoTabBar、CupertinoPageScaffold、CupertinoTabScaffold、CupertinoTabView等。目前组件库还没有Material Design风格组件丰富。

## 2. CupertinoActivityIndicator组件
IOS风格loading指示器。

常用属性
|属性名|类型|默认值|说明|
|-|-|-|-|
|radius|double|10.0|加载图形的半径|
|animating|bool|true|是否播放加载动画|

## 3 CupertinoAlertDialog
与Material Design风格的AlertDialog类似。

常见属性
|属性名|类型|说明|
|-|-|-|
|actions|List&lt;Widget&gt;|对话框底部操作按钮。如确定、取消。|
|title|Widget|对话框标题，通常是一个文本|
|content|Widget|对话框内容部分，通常为提示内容|


## 3. CupertinoButton
IOS风格按钮。

常用属性
|属性名|类型|默认值|说明|
|-|-|-|-|
|color|Color|-|按钮颜色|
|disableColor|Color|ThemeData.disabledColor|按钮禁用状态颜色|
|onPressed|VoidCallback|-|按钮按下时回调函数|
|child|Widget|-|按钮的child通常为Text文本，显示按钮名字|
|enable|bool|true|是否为禁用状态|

## 4. Cupertino导航组件
###4.1 CupertinoTabScaffold
选项卡组件，将选项卡按钮与选项卡视图绑定。

常用属性
|属性名|类型|说明|
|-|-|-|
|tabBar|CupertinoTabBar|选项卡按钮，通常由图标和文本组成|
|tabBuilder|IndexedWidgetBuilder|选项卡视图构造器|

### 4.2 CupertinoTabBar
选项卡按钮，通常由BottomNavigationBarItem组成包含图标加文本。

常用属性
|属性名|类型|说明|
|-|-|-|
|items|List&lt;BottomNavigationBarItem&gt;|选项卡按钮集合|
|backgroundColor|Color|选项卡按钮背景色|
|activeColor|Color|选中按钮前景色|
|iconSize|double|选项卡图标大小|

### 4.3 CupertinoTabView
选项卡视图。

常用属性
|属性名|类型|说明|
|-|-|-|
|builder|WidgetBuilder|选项卡视图构造器|
|routes|Map&lt;String, WidgetBuilder&gt;|选项卡视图路由|

### 4.4 CupertinoPageScaffold
页面的基本布局结构。包含内容和导航栏。

常用属性
|属性名|类型|说明|
|-|-|-|
|backgroudColor|Color|页面背景色|
|navigationBar|ObstructingPreferredSizeWidget|顶部导航栏按钮。包含左中右三个子组件|
|child|Widget|页面的主要内容|

### 4.5 CupertinoNavigationBar
导航栏结构组件。

常用属性
|属性名|类型|说明|
|-|-|-|
|middle|Widget|导航栏中间组件，通常为页面标题|
|trailing|Widget|导航栏右边组件，通常为菜单按钮|
|leading|Widget|导航栏左边组件，通常为返回按钮|