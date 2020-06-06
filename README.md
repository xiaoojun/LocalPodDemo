#### 使用pod模板库添加本地库教程
- 在项目的平级目录添加本地库文件夹
```
cd 项目根目录
mkdir LocalLib
```
- 创建模板库
```
cd LocalLib
pod lib create BaseModule
```
- 这里有一些设置 选择相应的即可
- 目录结构
 ![image-20200603122559760](https://tva1.sinaimg.cn/large/007S8ZIlgy1gfezkc5idmj30yq0ai77u.jpg)

- 添加核心代码到Classes目录下即可
- 修改项目的Podfile文件
```ruby
pod 'BaseModule', :path => '../LocalLib/BaseModule'
```

#### 使用pod模板库添加远程私有仓库
1. 选一个仓库平台新建自己的代码仓库 这里采用coding.net平台![Snip20200606_3](/Users/xiaojun/Desktop/Swift_Code/LocalPodDemo/images/Snip20200606_3.png)

2. 创建模板库 命令: pod lib create Lib2

3. 将你的核心文件放进classes文件下，这里可以在项目中pod install 然后校验下

4. 编辑podspec文件

   ```ruby
   Pod::Spec.new do |s|
     s.name             = 'Lib2'
     s.version          = '0.1.0'
     s.summary          = '项目简介'
     s.description      = '项目描述 要不简介更长'
     s.homepage         = 'https://e.coding.net/xiaooojun/lib2.git'
     s.license          = { :type => 'MIT', :file => 'LICENSE' }
     s.author           = { 'xiaojun' => 'wy961721716@163.com' }
     s.source           = { :git => 'https://e.coding.net/xiaooojun/lib2.git', :tag => s.version.to_s }
     s.ios.deployment_target = '9.0'
     s.source_files = 'Lib2/Classes/**/*'
     
     #下面这一行为新添加的
     s.swift_version = '5.0'
    
   end
   ```

5. 校验podspec文件是否错误

   1. 本地校验 pod lib lint （不出意外这里会通过，虽然有一些警告之类的）
   2. 远端校验 pod spec lint 这里会报一个tag错误 这里是远程仓库没有任何任何文件 所以我们需要关联并上传相应的tag到云端仓库
   
6. 关联远程仓库 提交代码并push到远端![Snip20200606_4](/Users/xiaojun/Desktop/Swift_Code/LocalPodDemo/images/Snip20200606_4.png)![Snip20200606_5](/Users/xiaojun/Desktop/Swift_Code/LocalPodDemo/images/Snip20200606_5.png)

7. 再次 pod spec lint 校验通过

8. 添加远程索引库库到本地索引库中 pod repo add 库名称 库地址（这里不用到.cocoapod文件下执行操作，该命令是全局的那个路径下操作都一样）![Snip20200606_7](/Users/xiaojun/Desktop/Swift_Code/LocalPodDemo/images/Snip20200606_7.png)

9. 将podspec文件提交到我们的远程私有索引库中 pod repo push 远程私有索引库名称 框架名称的描述文件![Snip20200606_8](/Users/xiaojun/Desktop/Swift_Code/LocalPodDemo/images/Snip20200606_8.png)

10. 删除本地索引库的多余文件![Snip20200606_9](/Users/xiaojun/Desktop/Swift_Code/LocalPodDemo/images/Snip20200606_9.png)

11.  找个项目编辑下podfile文件 添加好源地址 pod install 就OK了 

    ```
    source 'https://e.coding.net/xiaooojun/lib2.git'
    platform :ios, '9.0'
    target 'ModuleDemo' do
      use_frameworks!
    	pod 'Lib2'
     end
    ```

    