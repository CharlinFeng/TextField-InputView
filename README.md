![image](https://github.com/CharlinFeng/Resource/blob/master/UITextField%2BInputView/logo.jpg)
<br/><br/>

UITextField+InputView
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
将TextField+PickerView文件夹拖拽到您的项目中<br/>
请不要自行设计输入框的代码，因为代理已经被框架使用，如果需要代理，请使用API提供的Closure回调。<br/>

<br/><br/>
#### 2.准备工作
UITextField请继承OneColTF，

<br/><br/>
#### 3.功能集成

原始值的集成:


        /**  一句代码搞定  */
        tf.addOneColPickerViewWithTitles(["成都","北京","上海","广州"])


<br/>
模型值集成(注：模型没有强行要求，只要满足PickerDataModelProtocol协议的模型均可):

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


#### 5.集成效果
![image](https://github.com/CharlinFeng/Resource/blob/master/UITextField+InputView/0.gif)





<br/><br/><br/>
模型多选
===============
1.输入框继承自MulSelTF<br/>
2.模型需要遵守MulSelTFDataModelProtocol<br/>


         let s1 = Service(title: "翻译", isChecked: true,isRequired:true)
         let s2 = Service(title: "司机", isChecked: false,isRequired:false)
         let s3 = Service(title: "公关", isChecked: false,isRequired:false)
         let s4 = Service(title: "导游", isChecked: false,isRequired:false)
         let s5 = Service(title: "商务", isChecked: false,isRequired:false)
          
          tf.addMulSelWithModels([s1,s2,s3,s4,s5])
          
          tf.doneBtnClickClosure = {(all,checked) in
            
            
         }


其中，isChecked表示默认就选中，isRequired表示必选，且isRequired=true下一会有isChecked=true

<br/><br/>
#### 3.集成效果一：普通集成
![image](https://github.com/CharlinFeng/Resource/blob/master/UITextField+InputView/1.gif)

<br/><br/>
#### 4.集成效果二：更多的选项（可滑动）
![image](https://github.com/CharlinFeng/Resource/blob/master/UITextField+InputView/3.gif)

<br/><br/>
#### 5.集成效果三：必选模式
![image](https://github.com/CharlinFeng/Resource/blob/master/UITextField+InputView/4.gif)

<br/><br/>
#### 6.集成效果四：取消模式
![image](https://github.com/CharlinFeng/Resource/blob/master/UITextField+InputView/5.gif)


<br/><br/><br/>
我的事业
===============
西成的事业，渺小而艰难的求生存。前期我们专做全国的移动app外包。如果您能在信息上援助我们，我们万分感谢您的帮助！<br/>
西成：http://ios-android.cn <br/>
我的个人微博：http://weibo.com/charlin2015/<br/>
