# QRGActionSheet
自定义ActionSheet,可设置多种样式

在项目开发中，我们经常会遇到这么一种情况：App中某些原生控件满足不了我们的需求，所以这时候我们需要自定义来让控件具有自己公司产品的风格.在大公司中，有很多原生控件都是被封装过的，这样大家在用的时候直接用就好了，自定义控件其实是一件一劳永逸的事情,很好的体现了封装思想。借这个需求,我简述一下自定义控件的一个过程，首先看下效果图:

![效果图](http://ohwf8vjl9.bkt.clouddn.com/Snip20171229_3.png)

## 开始前思考

实现actionSheet效果选用什么作为载体?

要实现ActionSheet样式并不难，刚开始想来好几种控件实现形式，比如可以用UIView结合UIButton来实现，也可以用TableView这个最常用的表视图来实现.比较这两者发现，UITableView可以根据其代理实现不同数量的Sheet单元格，而且还有cell的selecte方法,对于每个sheet单元格的复杂样式，我们还可以通过自定义cell来实现，相比较Button不仅省去了动态创建Button数量的开销，而且系统封装性和可扩展性更好；所以选用tableView是一个比较好的选择，因为UITableView系统本身就给我自带了很多代理方法，通过代理方法我们可以控制创建Sheet的分区数量以及每个分区内sheet的单元格数量。

## 实现

1.创建TableView,在此我是将TableView添加在View上

2.实现TableView相关代理方法

3.自定义TableViewCell样式,并实现不同ActionSheet风格
