CREATE DATABASE retail_sql_project;

USE retail_sql_project;

DROP TABLE IF EXISTS  retail_sql_project;

CREATE TABLE retail_sales (
	order_id INT PRIMARY KEY,
    customer_id VARCHAR(20) NOT NULL,
    order_date DATE NOT NULL,
    region VARCHAR(50) NOT NULL,
    product_category VARCHAR(50) NOT NULL,
    customer_segment VARCHAR(50) NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    discount_rate DECIMAL(5,2) NOT NULL,
    revenue DECIMAL(12,2) NOT NULL,
    cost DECIMAL(12,2) NOT NULL,
    profit DECIMAL(12,2) NOT NULL,
    payment_method VARCHAR(50) NOT NULL);
    
    Select count(*) from retail_sales;
    
    select order_id, count(*) 
    from retail_sales 
    group by order_id
    having count(*) > 1;
    
    select count(*) as profit_mismatch
    from retail_sales
    where round((revenue - cost)- profit,2) <> 0;
    
    select count(*)
    from retail_sales
    where discount_rate < 0 or discount_rate > 1;
    
    -- KPI analysis
    
    Select 
		ROUND(sum(revenue),2) as total_revenue,
        ROUND(sum(cost),2) as total_cost,
        ROUND(sum(profit),2) as total_profit,
        ROUND(sum(profit)/sum(revenue) * 100, 2) as profit_margin_pct,
        count(*) as total_orders,
        count(distinct customer_id) as unique_customers
	from retail_sales;
    
    -- Region Performance
    
    Select
		region,
        ROUND(SUM(revenue),2) as revenue,
        round(SUM(profit),2) as profit,
        ROUND(SUM(profit)/sum(revenue)*100,2) as margin_pct
	from retail_sales
    group by region
    order by revenue DESC;
    
    -- Category Analysis
    
    Select
		product_category,
        ROUND(SUM(revenue),2) as revenue,
        ROUND(SUM(profit),2) as profit,
        ROUND(SUM(profit)/SUM(revenue)*100,2) as margin_pct
	from retail_sales
    group by product_category
    Order by profit DESC;
    
    
	-- Monthly Trend
	
    Select
		YEAR(order_date) as year,
        MONTH(order_date) as month,
        ROUND(SUM(revenue),2) as monthly_revenue,
        ROUND(SUM(profit),2) as monthly_profit
	from retail_sales
    Group by year(order_date), Month(order_date)
    Order by year, month;
    
    -- Top 10 customers by profit
    
    Select *
    from(
		Select
			customer_id,
            SUM(revenue) as total_revenue,
            SUM(profit) as total_profit,
            RANK() OVER (order by SUM(profit) desc) as profit_rank
		from retail_sales
        group by customer_id
		) ranked_customers
	where profit_rank <= 10;
    
    -- Low margin transaction
    
    Select 
		order_id,
        product_category,
        revenue,
        profit,
        ROUND(profit/revenue*100,2) as margin_pct,
        case
			when profit/revenue < 0.10 Then 'Low Margin'
            when profit/revenue BETWEEN 0.10 and 0.25 then 'Medium Margin'
            else 'High Margin'
		end as margin_category
		from retail_sales;

	  -- Customer Segment Contribution
      
      Select 
		customer_segment,
        Round(sum(revenue),2) as segment_revenue,
        round(
			sum(revenue) /
            (select sum(revenue) from retail_sales) * 100,2)
            as revenue_contribution_pct
		from retail_sales
        group by customer_segment
        order by segment_revenue desc;
        
        -- Best Performing Categories
        
        Select * 
        from ( 
			Select 
				product_category,
                sum(profit) as total_profit,
                dense_rank() over (order by sum(profit) desc) as category_rank
			from retail_sales
            group by product_category
		) ranked_categories;
        
        --  High Value order analysis
        
        Select 
			order_id, customer_id, revenue, profit
		from retail_sales
        where revenue> ( 
			Select avg(revenue)
            from retail_sales
		) order by revenue desc;
        
