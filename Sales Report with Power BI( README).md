# CV-Projects

Intro

The sales and dimensions datasets are two different folders. The sales folder is consisted from four different .csv  files(**2014 Sales, 2015 Sales, 2016 Sales and 2017 Sales**). And the Dimensions folder is consisted from four .csv files (**Categories, Geography,  SalesRep and SubCategories**) and one .xlsx file  (**Product**).Before the visuals and the report as a whole were made, merging of the sales ( **2014 sales,2015 sales, 2016 sales and 2017 sales**) files was needed so that we can have better understanding of the data. After that, cleaning  the data in the **Dimension tables (Categories, Geography, Product, SalesRep and SubCategories)** and in the fact table in **Power Query** was done.Also,it was created new dimension table **Dates** in the **Power Query**. 
Then the analysis had to be done  using different **DAX measures** so we could get better insight into the data and  more accurate results based on that data. 
And in the end, the Sales report was created using **different types visualizations** so that the information that we got from the data can be shared in the best way possible.**

Columns of the Dimension tables:
**Categories** - Category, CategoryKey
**Geography** - Country, GeoKey, Town, Wikipedia
**Product** - Color,ProductID, ProductName, RetailPrice,StandardCost,Sub Category Key
**SalesRep** - SalesRepName, SalesRepID
**SubCategory** - CategoryKey, SubCategory Name, SubCategoryKey
**Dates** - Date, Day, Month, Year

Columns of the Fact table(**Sales**):

*Date, fSalesPrimaryKey, GeoKey, PercentOfStandardCost, ProductID, RevenueDiscount, SalesRepID, Units*

Tasks to complete:

**SALES REPORT**

**1**Make 4 different slicers (slicer for Year and Month, slicer for ProductName, SalesRepresentative slicer and Country slicer).
**2**Create metrics with DAX Functions for calculating the Revenue, COGS (Cost Of Goods Sold), Gross Profit, Gross Profit Margin and show the COGS per SubCategory on **Pie chart**.
**3**Create metrics with DAX Functions for calculating the Revenue Last Year, Revenue 2 Years Ago, COGS (Cost Of Goods Sold) Last Year, COGS (Cost Of Goods Sold) 2 Years Ago and show the Revenue difference between Current Year, Last Year and 2 Years Ago in a given Year on a **line chart**.
**4**On a **Area chart** show the total Units sold per Town in a given Year and Month.
**5**Make a **stacked area chart** where you will show the total profit that was made only by the top 5 Products in a given Year.
**6**Make 4 **KPIs**: 
- Units Sold in the Current year compared to the  Units Sold made Last Year.
- Revenue in the Current Year compared to the Revenue made  Last Year.
- COGS (Cost Of Goods Sold) in the Current Year compared to the COGS(Cost Of Goods Sold) made Last Year.
- Gross Profit in the Current Year compared to the COGS(Cost Of Goods Sold) made Last Year.
**7a**Create **metric with DAX Function** to show the Gross Profit Diff between the Gross Profit Current Year and Gross Profit Last Year
**7b**On **matrix**, show the comparison between Revenue Last Year and Revenue Current Year, COGS Last Year and COGS Current Year, Gross Profit Last Year and Gross Profit Last Year and Gross Profit Difference per Town,Category and ProductName
**8**Create two **clustered column charts** where on the first one you will show the **The 3** *Products with the highest Retail Prices* and on the second one you will show **Top 3** *most sold Products*.
