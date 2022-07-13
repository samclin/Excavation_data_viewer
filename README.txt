This is a R Shiny app for viewing archaeological excavation data in 3D, written by Sam Lin (University of Wollongong, Australia).

The archaeological data must have the following structure:
- The data needs to be a Microsoft Access database (.mdb)
- The database must contain two tables: 'Context' and 'xyz'
- In both tables, there must be two fields: 'Unit' and 'ID'
- In the 'Context' table, there also must be two additional fields: 'level' and 'code'

As an example, the 'SDG2_sample_data.mdb' is a dataset available to download and use with the app. The dataset is sampled from the site database for Trench 3 at Shuidonggou Locality 2 (see Peng et al. 2017, 2018; Zhang et al. 2020). 

To use the app, you need to:
1. Open the console for R 32-bit (the R.exe or RGui.exe is usually located in C:\Program Files\R\R-version\bin\i386\). Note that the 32-bit version is no longer provided by R version 4.2.0 or higher. Please install an older version of R to get the 32-bit version.
2. In the R console, use the 'install.packages()' function to install the following packages:
	- shiny
	- RODBC
	- stringr
	- plotly
	- ggplot2
	- dplyr
	- RColorBrewer
	- shingFiles
3. Run the following code in the R console- shiny::runGitHub('Excavation_data_viewer', 'samclin')
4. Your internet browser should open up to a page that displays the app user interface.
5. Click the 'Browse' button on the top-left. In the prompt window, navigate to select your site database (.mdb). Wait for a few seconds for the file to upload.
6. After a few seconds, you should see a series of boxes show up on the left side of the window. These boxes corresponds to the different values for 'Unit', 'Level' and 'Code' within your database. You should also see an interactive 3D plot in the middle of the window displaying all of the recorded points. 
7. Tick/untick any boxes will automatically update the 3D plot.
8. By placing the mouse cursor on any of the points in the 3D plot, you will see some information of that particular point, including its Unit/ID as well as code and level.
9. You can change the size and opacity of the points in the 3D plot by using the 'Point size' and 'Opacity' slide bars to the left of the screen.
10. Use the 'Colour pallete' slide bar to adjust the colour pallete used to colour code the points.
11. Use the 'Colour by' drop-down menu to change how the points are coloured (by Unit, Level or Code).
12. To download a screen shot of the 3D plot, use the 'Download plot as a png' function button on the top-right of the 3D plot (above the legend).

Reference:
Peng, F., Lin, S. C., Guo, J., Wang, H., & Gao, X. (2017). The application of SfM photogrammetry software for extracting artifact provenience from palaeolithic excavation surfaces. Journal of Field Archaeology, 42(4), 326-336.
Peng, F., Guo, J., Lin, S., Wang, H., & Gao, X. (2018). The onset of Late Paleolithic in North China: An integrative review of the Shuidonggou site complex, China. L'Anthropologie, 122(1), 74-86.
Zhang, P., Zhang, X., Lin, S., Guo, J., Wang, H., Zwyns, N., Peng, F., Gao, X. (2020). A preliminary analysis of the stone artifacts from the 2014~ 2015 excavation of Shuidonggou Locality 2, Ningxia Autonomous Region. Acta Anthropologica Sinica, 39(01), 30.
