[TOC]

# Align : 有alignment属性,控制子组件对齐方向
# Padding : 为子组件添加padding
# SizedBox : 特定大小的盒子,设置了宽高会强制把child尺寸调到此宽高
# Table : 表格
# SingleChildScrollView : 类似ScrollView,包括单个view使其超出屏幕时可滚动

# FittedBox : fit属性调整填充模式，按自己的大小和fit调整子组件大小
# AspectRatio : 将子widget的大小指定为某个特定的长宽比
* 这是一个比率控件，按照宽度和比率来计算高度。一般会设置父容器的宽度，然后设置AspectRatio的aspectRatio，那么AspectRatio就会按照指定比例来显示；
# ConstrainedBox : 额外约束条件，最大最小宽高
# Baseline : 根据子项的基线对它们的位置进行定位
# FractionallySizedBox : 子项放在可用空间的一小部分
# IntrinsicHeight,IntrinsicWidth : child1高50，child2未限制，这个属性控制parent高度为50，而不是充满,有效率问题
# LimitedBox : 一个当其自身不受约束时才限制其大小的盒子,可通过ConstrainedBox实现
# Offstage : 控制其子widget的显示和隐藏,类似View.Gone
# OverflowBox : 约= Alignment + ConstrainedBox,可能允许子项溢出父级
# SizedOverflowBox : 约= SizedBox + ConstrainedBox
# CustomSingleChildLayout : 自定义的拥有单个子widget的布局widget
# CustomMultiChildLayout
# Scrollable : 建立显示可滚动内容的视区








