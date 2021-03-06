这是一个显示考古发掘三维空间数据的R Shiny app. Sam Lin (University of Wollongong, Australia) 编程.

要显示的考古数据必须要是:
- Microsoft Access database (.mdb)
- 拥有两个分别名为'Context'和'xyz'的表格(table)
- 'Context'和'xyz'两个表格里都必须有两个分别名为'Unit'和'ID'的字段(field)
- 'Context'表格里必须还有两个分别名为'level'和'code'的字段(field)

这里提供'SDG2_sample_data.mdb'为范例数据库下载使用. 此数据库是采样自宁夏水洞沟二号点Trench3考古发掘数据. 关于水洞沟二号点Trench3的发掘报告,请参阅Peng et al. (2017, 2018)及张佩琪等(2020).

要使用这个app需要:
1. 打开R(32-bit)的使用介面(R.exe或RGui.exe;两个执行档通常是在C:\Program Files\R\R-version\bin\i386\). 注意R 4.2.0和更新版本不再提共32-bit. 请安装R 4.1.3或更早的版本并选择安装32-bit. 还有, RStudio以不支持执行R 32-bit. 所以必须以R.exe或RGui.exe来执行R 32-bit.
2. 在R介面里, 用'install.packages()'程序来安装以下的程序包:
	- shiny
	- RODBC
	- stringr
	- plotly
	- ggplot2
	- dplyr
	- RColorBrewer
	- shingFiles
3. 在R介面里执行 shiny::runGitHub(repo='Excavation_data_viewer', username='samclin', ref='main')
4. 网路浏览器会开启并打开app的使用介面.
5. 点选左上方的'Browse'按键打开浏览视窗. 浏览并点选想要检视的考古数据库(.mdb), 点击Open. 稍等一下让数据库上传.
6. 数据库上传成功后, 使用介面左边有显示一系列可以点选的方块. 这些方块对应着数据库里'Unit','Level'和'Code'字段中不同的数据值. 视窗中间会出现一个三维图并显示数据库里的考古数据分布. 初始的默认选项是只显示石器(Lithic). 按住滑鼠左键选转图表. 按住滑鼠右键移动图表. 在三维图上移动滑鼠指标可以互动性的检视各个点的相关讯息. 
7. 点选或取消视窗左边的各个方块可以改变三维图中显示的考古数据.
8. 用左上方的'Point size'滑动条来改变图中点的大小. 用'Opacity'滑动条来改变图中点的透明度.
9. 用'Colour pallete'滑动条来改变控制图颜色的调色板.
10. 用'Colour by'选单来选择数据显示颜色是以Unit,Level还是Code来定.
11. 如要下载截图, 请用右上方'Download plot as a png'的功能键来下载.

引用文献:
Peng, F., Lin, S. C., Guo, J., Wang, H., & Gao, X. (2017). The application of SfM photogrammetry software for extracting artifact provenience from palaeolithic excavation surfaces. Journal of Field Archaeology, 42(4), 326-336.
Peng, F., Guo, J., Lin, S., Wang, H., & Gao, X. (2018). The onset of Late Paleolithic in North China: An integrative review of the Shuidonggou site complex, China. L'Anthropologie, 122(1), 74-86.
张佩琪, 张晓凌, Sam Lin, 郭家龙, 王惠民, Nicolas Zwyns, 彭菲, 高星. 水洞沟第2地点2014-2015年出土石制品初步研究. 人类学学报, 39(01), 30-41.
