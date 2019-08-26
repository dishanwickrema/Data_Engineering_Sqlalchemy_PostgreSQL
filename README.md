# Week-13_ETL-Project

Dishan Wickremasinghe

Sumati Bhala

Muqtasid Alam

**Week 13 - ETL Project Report**

The ETL project comprised of Toronto Public Library data, which combined multiple data sources to perform data extraction, normalization and finally transformed them to depict how different branches performed along with their in-house programs offered in the past years.

The primary web source we used was &quot;[https://opendata.tpl.ca/](https://opendata.tpl.ca/).&quot; This link lead us to some equally interesting data to work with. The data was in different formats like JSON, CSV, KML, and XML.

**1. Data Sets Extracted**

First step for the project was to extract the data. We also used the URL for the list of library branches. Some of the datasets we considered for our project are about active-cardholders, branch information, hours of operation, workstations and new registrations.

Following is the list of the csv files used to build the database.

	a)Active\_Cardholders _= pd.read\_csv(&quot;resources/Active\_Cardholders.csv&quot;)_
	b)Active\_Cardholders\_by\_Cardholder\_Type = _pd.read\_csv(&quot;resources/Active\_Cardholders\_by\_Cardholder\_Type.csv&quot;)_
	c)Annual\_Visits = _pd.read\_csv(&quot;resources/Annual\_Visits.csv&quot;)_
	d)Catchment\_Population = _pd.read\_csv(&quot;resources/Catchment\_Population.csv&quot;)_
	e)Collection\_Size = _pd.read\_csv(&quot;resources/Collection\_Size.csv&quot;)_
	f)Hours\_of\_Operation = _pd.read\_csv(&quot;resources/Hours\_of\_Operation.csv&quot;)_
	g)New\_Registrations = _pd.read\_csv(&quot;resources/New\_Registrations.csv&quot;)_
	h)Registered\_Cardholders = _pd.read\_csv(&quot;resources/Registered\_Cardholders.csv&quot;)_
	i)Registered\_Cardholders\_by\_Cardholder\_Type = _pd.read\_csv(&quot;resources/Registered\_Cardholders\_by\_Cardholder\_Type.csv&quot;)_
	j)Circulation\_by\_Cardholder\_Type = _pd.read\_csv(&quot;resources/Circulation\_by\_Cardholder\_Type.csv&quot;)_
	k)Workstations = _pd.read\_csv(&quot;resources/Workstations.csv&quot;)_
	l)_Workstation\_Users = pd.read\_csv(&quot;resources/Workstation\_Users.csv&quot;)_

JSON

	m)url = &quot;https://opendata.tpl.ca/resources/events&quot;

**2. Transformation**

The data sets had multiple values so the first step was to normalize the data. Followed by data cleaning with python scripts. There were different tables that need to be connected through primary key. It took us a lot of time to decide the schema. We used ERD to finalize the schema.

	**ERD Diagram**

Database is normalized upto 3rd normal fom, and the relationships between parent and child tables are shown in the underneath entity relationship diagram.

![ERD Diagram](erd.png)

**3. Loading: the database**

The final step was to write a script to create the database, tables and relationships. We used SQL alchemy to handle all data input into the PostgreSQL database. This data can be further used to run queries and find out more information about Toronto Public library.

Few queries run against the database are shown below.

1. Pre-school events happening in &quot;Etobicoke Region&quot; in next week (Aug-24 to Aug-31)

![Query 1](query1.png)


2. Branches drew high demand of registration in last 5 years

![Query 2](query2.png)


3. Libraries open on Sundays in Toronto Rosedale area

![Query 3](query3.png)


**Why we chose this?**

Majority of the data was in CSV format so it seemed like a perfect choice to use relational database to store the final database.

**Additional learning:**

Web scraping with beautiful soup. We tried to use some of the web scraping skills we learned this to get a list of books from the library web page.

[https://www.torontopubliclibrary.ca/books-video-music/new-items.jsp?category=Adult+Fiction](https://www.torontopubliclibrary.ca/books-video-music/new-items.jsp?category=Adult+Fiction)