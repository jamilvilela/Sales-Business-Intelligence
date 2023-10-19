
# Sales and Goals - Business Intelligence


Business Intelligence project that was built using Microsoft SQL BI tools.

![Logo](https://github.com/jamilvilela/Sales-Business-Intelligence/blob/master/Images/Power%20BI%20-%20Dashboard.PNG)


Take a look more pictures bellow.

## Plataforms and Tools

- Visual Studio 2019
- SQL Server 15.0
- SQL Server Integration Services
- SQL Server Analysis Services
- SQL Server Reporting Services
- Power BI
- T-SQL and MDX queries
  
## Features

- Extract data from an Excel sheet;
- Save that data into a RAW database (Staging);
- Load data from staging area to a data warehouse (star schema);
- OLAP Cube with KPI, hierarchies, calculated fields and partitions;
- Reports about products, sellers and customers related by its sales and goals's KPI;
- Power BI dashboard with KPI, rank, map, tool tip windows. 
  
## Installation 

- Open Sales-Business-Intelligence Visual Studio solution;
- Make sure if the Sales.xlsx is at DataSource directory;
- Publish both databases: DB_Staging, DW_Sales;
- Run SSIS projects;
- Run SSAS Cube_Sales;
- Publish SSRS project;
- Open the .pbix file on Power BI.
    
## Screenshots

![App Screenshot](https://github.com/jamilvilela/Sales-Business-Intelligence/blob/master/Images/Data%20source.PNG)
![App Screenshot](https://github.com/jamilvilela/Sales-Business-Intelligence/blob/master/Images/Datawarehouse%20-%20ER%20diagram.PNG)
![App Screenshot](https://github.com/jamilvilela/Sales-Business-Intelligence/blob/master/Images/SSIS%20-%20Staging%20-%20Control%20Flow.PNG)
![App Screenshot](https://github.com/jamilvilela/Sales-Business-Intelligence/blob/master/Images/SSIS%20-%20Staging%20-%20Data%20flow.PNG)
![App Screenshot](https://github.com/jamilvilela/Sales-Business-Intelligence/blob/master/Images/SSIS%20-%20Loading%20-%20Control%20Flow.PNG)
![App Screenshot](https://github.com/jamilvilela/Sales-Business-Intelligence/blob/master/Images/SSIS%20-%20Loading%20-%20Dimension.PNG)
![App Screenshot](https://github.com/jamilvilela/Sales-Business-Intelligence/blob/master/Images/SSIS%20-%20Loading%20-%20Fact%20table.PNG)
![App Screenshot](https://github.com/jamilvilela/Sales-Business-Intelligence/blob/master/Images/SSAS%20-%20Cube%20structure.PNG)
![App Screenshot](https://github.com/jamilvilela/Sales-Business-Intelligence/blob/master/Images/SSAS%20-%20Calculations.PNG)
![App Screenshot](https://github.com/jamilvilela/Sales-Business-Intelligence/blob/master/Images/SSAS%20-%20KPI.PNG)
![App Screenshot](https://github.com/jamilvilela/Sales-Business-Intelligence/blob/master/Images/SSRS%20-%20Reports.PNG)
![App Screenshot](https://github.com/jamilvilela/Sales-Business-Intelligence/blob/master/Images/SSRS%20-%20Report%20-%20MDX%20query.PNG)
![App Screenshot](https://github.com/jamilvilela/Sales-Business-Intelligence/blob/master/Images/Power%20BI%20-%20Dashboard.PNG)
