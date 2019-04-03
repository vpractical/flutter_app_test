﻿Tags: flutter
# Flutter页面布局篇

[TOC]

---

## 1. 布局及装饰组件说明
|组件名称|中文释义|说明|
|-|-|-|
|Align|对齐布局|指定child的对齐方式|
|AspectRatio|调整宽高比|根据设置的宽高比调整child组件|
|BaseLine|基准线布局|所有的child底部所在的同一水平线|
|Center|居中布局|child处于水平和垂直方向的中间位置|
|Column|垂直布局|对child在垂直方向进行排列|
|ConstrainedBox|限定宽高|限定child的最大值|
|Container|容器布局|容器布局是一个组合的Widget，包含定位和尺寸|
|FittedBox|缩放布局|缩放以及位置调整|
|FractionallySizedBox|百分比布局|根据现有空间按照百分比调整child的尺寸|
|GridView|网格布局|对多行多列同时进行操作|
|IndexedStack|栈索引布局|IndexedStack继承自Stack，显示第index个child，其他child是不可见的|
|LimitedBox|限定宽高布局|对最大宽高进行限制|
|ListView|列表布局|用列表方式进行布局，如多项数据的场景|
|Offstage|开关布局|控制是否显示组件|
|OverflowBox|溢出父容器显示|允许child超出父容器的范围显示|
|Padding|填充布局|处理容器和chid之间的间距|
|Row|水平布局|对child在水平方向进行排列|
|SizedBox|设置具体尺寸|用特定大小的盒子来限定child宽度和高度|
|Stack/Alignment|Alignment栈布局|根据Alignment组件的属性将child定位在Stack组件上|
|Stack/Positioned|Positioned栈布局|根据Positioned组件的属性将child定位在Stack组件上|
|Table|表格布局|使用表格的行和列进行布局|
|Transform|矩阵转换|做矩阵变换，对child做平移、旋转、缩放等操作|
|Wrap|按宽高自动换行|按宽度或高度，让child自动换行布局|

## 2. 基础布局处理
### 2.1 Container(容器布局)
Container在Flutter里使用非常多，是一个组合Widget，内部有绘制Widget、定位Widget和尺寸Widget。

### 2.2 Center(居中布局)
居中布局，子元素处于水平和垂直方向的中间。

### 2.3 Padding(填充布局)
用于处理容器和子元素间的间距。

### 2.4 Align(对齐布局)
将子组件按指定方式对齐，并根据子组件的大小调整自己的大小。

### 2.5 Row(水平布局)
水平方向是主轴，垂直方向是交叉轴。

### 2.6 Column(垂直布局)
垂直方向是主轴，水平方向是交叉轴。

### 2.7 FittedBox(缩放布局)
FittedBox会在自己的尺寸范围内缩放并调整child位置。
两个重要属性：
fit：缩放方式。默认值是BoxFix.contain，即child在FittedBox范围内，尽可能大。contain是在保证child宽高比的前提下，尽可能填满。
alignment：对齐方式。默认值是Alignment.center，居中显示child。

### 2.8 Stack/Alignment
Stack常用属性
|属性名|类型|默认值|说明|
|-|-|-|-|
|alignment|AlignmentGeometry|Alignment.topLeft|对齐方式|
对齐方式有以下几种：
>* bottomCenter 底部居中
>* bottomLeft 底部居左
>* bottomRight 底部居右
>* center 正中
>* centerLeft 中间居左
>* centerRight 中间居右
>* topCenter 顶部居中
>* topLeft 顶部居左
>* topRight 顶部居右

### 2.9 Stack/Positioned
Positioned组件用来定位的。Stack里使用Positioned布局主要是因为在Stack组件里通常需要定位。

Positioned常用属性
|属性名|类型|说明|
|-|-|-|
|top|double|子元素相对顶部边界距离|
|bottom|double|子元素相对底部边界距离|
|left|double|子元素相对左侧边界距离|
|right|double|子元素相对右侧边界距离|

### 2.10 IndexedStack
继承自Stack，用于显示第index个child，其他child不可见，所以它的尺寸与child中最大尺寸一致。

### 2.11 OverFlowBox
允许child超出父容器范围显示。
常用属性
|属性名|类型|说明|
|-|-|-|
|alignment|AlignmentGeometry|对齐方式|
|minWidth|double|允许child最小宽度，如果child宽度小于该值，按照最小宽度显示|
|maxWidth|double|允许child最大宽度，如果child宽度大于该值，按照最大宽度显示|
|minHeight|double|允许child最小高度，如果child宽度小于该值，按照最小高度显示|
|maxHeight|double|允许child最大高度，如果child宽度大于该值，按照最大高度显示|

## 3. 宽高尺寸处理
### 3.1 SizedBox
特定大小的盒子，强制child有特定的宽度和高度。如果宽度或高度为null，该组件会调整自身大小以匹配child的尺寸。

### 3.2 ConstrainedBox
用于限定child的最大、最小宽高。如果child为null，会尽可能缩小尺寸。
常用属性
|属性名|类型|说明|
|-|-|-|
|constraints|BoxConstraints|child的限制条件，限制最大、最小宽高|
|child|Widget|子元素组件|

### 3.3 LimitedBox
用于限定最大宽高，与ConstainedBox类似，只是LimitedBox没有最小宽高限制。
常用属性
|属性名|类型|默认值|说明|
|-|-|-|-|
|maxWidth|double|double.infini|最大宽度|
|maxHeight|double|double.infinity|最大高度|

### 3.4 AspectRatio
用于设置调整child的宽高比。适用于需要固定组件宽高比的情景。aspectRatio属性不能为null，必须大于0且必须是有限的。

### 3.5 FractionallySizedBox
会根据现有空间调整child的尺寸，适用在一个区域里取百分比尺寸时。如果宽高因子为null，则child的宽高会尽可能充满整个区域。

常用属性
|属性名|类型|说明|
|-|-|-|
|alignment|AlignmentGeometry|对齐方式，不能为null|
|widthFactor|double|宽度因子，宽度乘以该值，就是最后的宽度|
|heightFactor|double|高度因子，用作计算最后实际高度|

## 4. 列表及表格布局
### 4.1 ListView

### 4.2 GridView

### 4.3 Table
表格布局，每一行的高度由内容决定，每一列的宽度由列数决定。

常用属性
|属性名|类型|说明|
|-|-|-|
|columnWidths|Map&lt;int, TableColumnWidth&gt;|设置每一列的宽度|
|defaultColumnWidth|TableColumnWidth|默认的每一列宽度，默认情况下均分|
|textDeirection|TextDirection|文字方向|
|border|TableBorder|表格边框|
|defaultVerticalAlignment|TableCellVerticalAlignment|对齐方向。默认垂直方向|
|textBaseLine|TextBaseLine|defaultVerticalAlignment为baseline时，会用到该属性|

## 5. 其他布局
### 5.1 Transform
矩阵转换。可以对child做平移、旋转、缩放等操作。

常用属性
|属性名|类型|说明|
|-|-|-|
|transform|Matrix4|一个4x4矩阵|
|origin|Offset|旋转点，相对于左上角顶点的偏移。默认为左上角顶点|
|alignment|AlignmentGeometry|对齐方式|
|transformHitTests|bool|点击区域是否也做相应的改变|

### 5.2 Baseline
基准线布局，将所有元素底部放在同一水平线上。

常用属性
|属性名|类型|说明|
|-|-|-|
|baseline|double|baseline数值，必须要有，从顶部算|
|baselineType|TextBaseline|baseline类型，必须要有。目前两种类型：alphabetic对齐底部，ideographic对齐|

### 5.3 Offstage
用于控制child是否显示。

常用属性
|属性名|类型|默认值|说明|
|-|-|-|-|
|offstage|bool|true|默认为true表示不显示，false时显示该组件|

### 5.4 Wrap
跟row和column有些相似。单行的Wrap跟Row一样，单列的Wrap跟Column一样。适用于需要按宽度或高度让child自动换行的场景。

常用属性
|属性名|类型|默认值|说明|
|-|-|-|-|
|direction|Axis|Axis.horizontal|主轴方向，默认水平|
|alignment|WrapAlignment|WrapAlignment.start|主轴方向对齐方式，默认为start|
|spacing|double|0.0|主轴方向的间距|
|runAlignment|WrapAlignment|WrapAlignment.start|run的对齐方式，可以理解为新的行或列|
|runSpacing|double|0.0|run的间距|
|crossAxisAlignment|WrapAlignment|WrapAlignment.start|交叉轴方向对齐方式|
|textDirection|TextDirection|-|文本方向|
|verticalDirection|VerticalDirection|-|children的摆放顺序，默认是down|




