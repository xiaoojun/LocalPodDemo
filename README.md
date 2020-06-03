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
```
pod 'BaseModule', :path => '../LocalLib/BaseModule'
```
