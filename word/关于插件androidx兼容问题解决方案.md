[TOC]

# 第一步

修改 *android/gradle/wrapper/gradle-wrapper.properties* ： 

```groovy
distributionUrl=https\://services.gradle.org/distributions/gradle-4.10.2-all.zip
```

# 第二步
修改 *android/build.gradle* ：
```groovy
dependencies {
    classpath 'com.android.tools.build:gradle:3.2.1'
}
```
改为
```groovy
dependencies {
    classpath 'com.android.tools.build:gradle:3.3.0'
}
```
# 第三步
修改 *android/gradle.properties*，加上下面两句 ：

```groovy
android.enableJetifier=true
android.useAndroidX=true
```
# 第四步
修改 *android/app/build.gradle* ：
首先，确保 *compileSdkVersion* 和 targetSdkVersion 至少为 **28** ：

```groovy
android{
    ...
    compileSdkVersion 28
    ...
    defaultConfig{
        ...
        targetSdkVersion 28
        ...
    }
    ...
}
```
然后，将

```groovy
defaultConfig {
    ...
    testInstrumentationRunner "android.support.test.runner.AndroidJUnitRunner"
    ...
}
```
改为
```groovy
defaultConfig {
    ...
    testInstrumentationRunner "androidx.test.runner.AndroidJUnitRunner"
    ...
}
```
最后，将
```groovy
dependencies {
    ...
    androidTestImplementation 'com.android.support.test:runner:1.0.2'
    androidTestImplementation 'com.android.support.test.espresso:espresso-core:3.0.2'
    ...
}
```
改为
```groovy
dependencies {
    ...
    androidTestImplementation 'androidx.test:runner:1.1.1'
    androidTestImplementation 'androidx.test.espresso:espresso-core:3.1.1'
    ...
}
```




