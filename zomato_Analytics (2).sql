create database zomato_dashboard;
select count(*) from zomato;

# Total Restaurants
create table KPI1
SELECT COUNT(RestaurantID) AS total_restaurants
FROM zomato;
select * from KPI1;

# Average Rating
create table KPI2
SELECT round(avg(rating),2)AS average_rating
FROM zomato;                                                                
select * from KPI2;

# Total Voters
create table KPI3
SELECT sum(Votes) AS total_voters
FROM zomato;                                                                    
select * from KPI3;

# Total Cities
create table KPI4
SELECT COUNT(DISTINCT City) AS total_cities
FROM zomato;                                                                      
select * from KPI4;

# Total_Countries
create table KPI5
SELECT COUNT(DISTINCT Country_Name) AS total_countries
FROM zomato;                                                                     
select * from KPI5;

# Total_Cuisines
create table KPI6
SELECT COUNT(distinct Cuisines) AS total_cuisines
FROM zomato;                                                                    
select * from KPI6;

# Top 10 Countries by Restaurant Count
create table KPI7
SELECT 
    Country_Name,
    COUNT(*) AS restaurant_count
FROM zomato
GROUP BY Country_Name
ORDER BY restaurant_count DESC
LIMIT 10;                                                                        
select * from KPI7;

# Top 10 Cuisines
create table KPI8
SELECT 
    Cuisines,
    COUNT(*) AS cuisine_count
FROM zomato
GROUP BY Cuisines
ORDER BY cuisine_count DESC LIMIT 10; 
select * from KPI8;  
                                                                    
# Top Cities by Restaurants
create table KPI9
SELECT 
    City,
    COUNT(*) AS restaurant_count
FROM zomato
GROUP BY City
ORDER BY restaurant_count DESC
limit 5 ;             
select * from KPI9;

 #  Month-wise Opening Restaurants
create table KPI10
SELECT 
    `Month Name`,
    COUNT(*) AS restaurant_count
FROM zomato
GROUP BY `Month Name`
ORDER BY 
    FIELD(`Month Name`,
        'January','February','March','April','May','June',
        'July','August','September','October','November','December'
    );                                              
    select * from KPI10;
    
# Quarter-wise Opening Restaurants
create table KPI11
SELECT 
    Quarter,
    COUNT(*) AS restaurant_count
FROM zomato
GROUP BY Quarter
ORDER BY 
    FIELD(Quarter, 'Q-1','Q-2','Q-3','Q-4');                  
select * from KPI11;

# Year-wise Opening Restaurants
create table KPI12
SELECT 
    Year,
    COUNT(*) AS restaurant_count
FROM zomato
GROUP BY Year
ORDER BY Year;                                                            
select * from KPI12;

#Rating Count
create table KPI13
SELECT 
    CASE
        WHEN  rating BETWEEN 0 AND 2 THEN '0 - 2'
        WHEN rating > 2 AND rating <= 3 THEN '2.1 - 3'
        WHEN  rating > 3 AND  rating <= 4 THEN '3.1 - 4'
        WHEN  rating > 4 AND  rating <= 5 THEN '4.1 - 5'
        ELSE 'Unknown'
    END AS rating_range,
    COUNT(*) AS restaurant_count
FROM zomato
GROUP BY rating_range
ORDER BY rating_range;                                                             
select * from KPI13;