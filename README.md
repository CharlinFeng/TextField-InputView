![image](./TextField+PickerView/logo.jpg)
<br/><br/>

UITextField+PickerView
===============
<br/>
.Swift 1.2<br/>
.Xcode 6.3<br/>
.基于MIT开源协议<br/>

<br/>

##### 注：目前大众功能先做这两个，后续有需要再持续追加


<br/><br/><br/>
快速集成
===============

#### 1.添加框架
将TextField+PickerView文件夹拖拽到您的项目中

<br/><br/>
#### 2.准备工作
UITextField请继承PickerTextField

<br/><br/>
#### 3.功能集成

原始值的集成

        /**  一句代码搞定  */
        tf.addOneColPickerViewWithTitles(["成都","北京","上海","广州"])


<br/>
模型值集成

        let city1 = CityModel(title: "成都市", spell: "ChengDu")
        let city2 = CityModel(title: "南充市", spell: "NanChong")
        let city3 = CityModel(title: "南部县", spell: "NanBu")
        /**  一句代码安装  */
        tf.addOneColPickerViewWithModels([city1,city2,city3])

<br/><br/>
#### 4.取出当前选中的值
得到当前的值,
如果你是原始值，得到的是字符串。
如果是模型值，得到的就是选中的模型。

        let value = tf.selectedPickerViewValue

<br/><br/>
#### 5.各种设置与事件
移除工具条：

      tf.removeAccessoryView = true

选中事件：

        tf.selectedAction = { row in
        
            println("选中了\(row)行")
        }

点击了完成按钮事件,回调中的value请根据您的类型转换：

        tf.doneBtnActionClosure = { (row,value) in
        
            println("您点击了完成按钮，当前选中第\(row)行，值为\(value)")
        }

