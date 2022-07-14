這是一個顯示考古發掘三維空間數據的R Shiny app. Sam Lin (University of Wollongong, Australia) 編程.

要顯示的考古數據必須要是:
- Microsoft Access database (.mdb)
- 擁有兩個分別名為'Context'和'xyz'的表格(table) 
- 'Context'和'xyz'兩個表格裡都必須有兩個分別名為'Unit'和'ID'的字段(field)
- 'Context'表格裡必須還有兩個分別名為'level'和'code'的字段(field)

這裡提供'SDG2_sample_data.mdb'為範例數據庫下載使用. 此數據庫是采样自寧夏水洞溝二號點Trench3考古發掘數據. 關於水洞溝二號點Trench3的發掘報告,請參閱Peng et al. (2017, 2018)及張佩琪等(2020). 

要使用這個app需要:
1. 打開R(32-bit)的使用介面(R.exe或RGui.exe;兩個執行檔通常是在C:\Program Files\R\R-version\bin\i386\). 注意R 4.2.0和更新版本不再提共32-bit. 請安裝R 4.1.3或更早的版本並選擇安裝32-bit. 還有, RStudio以不支持執行R 32-bit. 所以必須以R.exe或RGui.exe來執行R 32-bit. 
2. 在R介面裡, 用'install.packages()'程序來安裝以下的程序包:
	- shiny
	- RODBC
	- stringr
	- plotly
	- ggplot2
	- dplyr
	- RColorBrewer
	- shingFiles
3. 在R介面裡執行 shiny::runGitHub(repo='Excavation_data_viewer', username='samclin', ref='main')
4. 網路瀏覽器會開啟並打開app的使用介面.
5. 點選左上方的'Browse'按鍵打開瀏覽視窗. 瀏覽並點選想要檢視的考古數據庫(.mdb), 點擊Open. 稍等一下讓數據庫上傳.
6. 數據庫上傳成功後, 使用介面左邊有顯示一系列可以點選的方塊. 這些方塊對應著數據庫裡'Unit','Level'和'Code'字段中不同的數據值. 視窗中間會出現一個三維圖並顯示數據庫裡的考古數據分布. 初始的默認選項是只顯示石器(Lithic). 按住滑鼠左鍵選轉圖表. 按住滑鼠右鍵移動圖表. 在三維圖上移動滑鼠指標可以互動性的檢視各個點的相關訊息. 
7. 點選或取消視窗左邊的各個方塊可以改變三維圖中顯示的考古數據.
8. 用左上方的'Point size'滑動條來改變圖中點的大小. 用'Opacity'滑動條來改變圖中點的透明度.
9. 用'Colour pallete'滑動條來改變控制圖顏色的調色板.
10. 用'Colour by'選單來選擇數據顯示顏色是以Unit,Level還是Code來定.
11. 如要下載截圖, 請用右上方'Download plot as a png'的功能鍵來下載.

引用文獻:
Peng, F., Lin, S. C., Guo, J., Wang, H., & Gao, X. (2017). The application of SfM photogrammetry software for extracting artifact provenience from palaeolithic excavation surfaces. Journal of Field Archaeology, 42(4), 326-336.
Peng, F., Guo, J., Lin, S., Wang, H., & Gao, X. (2018). The onset of Late Paleolithic in North China: An integrative review of the Shuidonggou site complex, China. L'Anthropologie, 122(1), 74-86.
张佩琪, 张晓凌, Sam Lin, 郭家龙, 王惠民, Nicolas Zwyns, 彭菲, 高星. 水洞沟第2地点2014-2015年出土石制品初步研究. 人类学学报, 39(01), 30-41.
