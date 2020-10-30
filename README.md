# Ecommerce Logistics Analysis

[Olist](https://olist.com/) is a Brazilian ecommerce company that connects sellers and small businesses to some of the main Brazilian marketplaces where customers can purchases their products. Olist partners with sellers to help shape and grow their digital presence by managing their analytics marketing services, listings, orders, pricing, customer support, payments and shipping logistics. 

This [data](https://www.kaggle.com/olistbr/brazilian-ecommerce) was posted by Olist data engineers to Kaggle (not as a competition). The data is real (messy), commercial data. It includes information on over 100,000 orders from September 2016 to October 2018 as well as product, customer, seller, review and geographic data. The data was posted as 10 separate csv files (~120 MB total). I chose to create a project around this data particularly because 1. The data is very messy (missing data, incorrect data etc) and real. 2. I identified numerous opportunities where my insights and analysis could be used to improve their business.

I split my project into six main parts:

1. [Part 1](0_ELA.ipynb) consisted of creating a database from the 10 separate CSV files. This included creating tables, identifying primary and foreign keys, identifying column constaints and data normalization using the SQL RDBMS SQLite. This also included identifying (and correcting for) a number of structural issues in the original dataset. This also included identifying data sampling and data sourcing issues: part of this included identifying the applications and limitations of extending the findings from this dataset to Olist's actual entire database system. Specific settings and criteria are identifed for when the findings from my analysis can be applied. 

    Note that in each of following stages of my analysis (Parts 2 through 6), I addressed (and dealt with) the issue of missing values. I built a "table audit" function from scratch to audit any joined/filtered table for missing values. At each stage in my analysis I: 
    * Identified the missing values. 
    * Determined if the missing data was missing at random or if there were reasons/factors for why the data was missing.
    * Determined how to best handle this missing data (removal vs imputation and if imputation - in what way, weighing the pros and cons of each option).
    * Searched for (and corrected for) incorrect data

2. [Part 2](1_ELA.ipynb) involved determining how accurate Olist's existing shipment delivery estimation system was. 

3. [Part 3](2_ELA.ipynb) consisted of establishing whether the delivery status (whether it is delivered late, on time or early) has an effect on the review scores of the products. 

4. [Part 4](3_ELA.ipynb) involved investigating the late deliveries to better understand the factors that contribute to a late delivery (payment approval system vs seller fault vs carrier fault vs the estimation system just being too inaccurate).

5. [Part 5](4_ELA.ipynb) consisted of a geographic analysis that involved using geospatial data to calculate haversine travel distance as well as using geospatial data to classify both customers and sellers as urban or rural. This involved utilizing Brazilian muncipality [data]( Particular shipment paths are also examined. This calculated distance and urban/rural classification data was integrated into the existing database.  

6. [Part 6](5_ELA.ipynb) involved developing a system to predict the shipment delivery time using predictive features that were identified and/or engineered in earlier parts of the project. I created a custom scoring function that weighed the financial tradeoff / business cost of  two business goals: 1. decrease the number of late deliveries to improve review scores of products to incentivize more sales 2. decrease the number of early deliveries to increase the number of purchases (customers may select for products with a faster estimated delivery time).

    The uncertainty, assumptions and limitations to this custom cost function are detailed. I defined "dummy" baseline models to use to use as additional point of comparison between Olist's existing shipment delivery time estimation and my system for shipment delivery time estimation. I utilized linear models (simple linear regression as well as lasso regression, ridge regression and ElasticNet regularization), tree-based models (simple decision tree, random forest, AdaBoost, Gradient Boosting and XGBoost classification), a nearest neighbors model, and stacking algorithms (voting classifer by weights).<br><br> The existing shipping estimation system that Olist uses had a "business cost score" of 78,000. The best performing model was a voting regression algorithm that employed .... and ... on engineered predictive features such as haversine distance, rural vs urban, and surrounding metropolitan area to achieve a "business cost score" of 78,000 (the "dumb" baseline models had "business cost" scores of 92,000 and 113,000). 
    
I created a [powerpoint presentation](Ecommerce_Logistics_Analysis_presentation.pdf) that gives a more detailed overview of this project. 