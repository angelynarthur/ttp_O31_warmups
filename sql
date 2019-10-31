-- 1) Go back to the dvdrental database, and get the average, standard deviation, and count
-- of each customer's lifetime spending. (This is a lot like yesterday's warmup).



WITH order_totals as (
SELECT customer.customer_id, SUM(payment.amount) as total
FROM payment
JOIN customer ON customer.customer_id = payment.customer_id
GROUP BY customer.customer_id)
SELECT AVG(total), stddev_samp(total), COUNT(total)
FROM order_totals;  


-- 2) Your boss is absolutely certain (like 99%) that his new marketing strategy will increase
-- average customer spending by more than 10%, making the company an extra $100,000+ next year.
-- This is based on the fact that our company has about 10,000 customers, and his assumption
-- is that each customer is currently worth at least $100 in yearly spending. 
-- Your boss has already made this promise to the CEO.

-- Given our data (which is only a sample out of all of our customers), and that we want to be 99%
-- confident that our plan is going to work, we want compelling evidence that the TRUE customer 
-- average spending per year is more than $100. 
-- (USE at least 2 significant digits for your analysis)

population mean	100			
population std	25.2321			
sample size (n)	599			
alpha (significance level) 0.01	(99% confidence)		
sample mean	102.3573			
				
         			H0 (Null hypothesis) spending >= 100
standard error	1.0310		HA (Alternative hypothesis) spending <100
threshold (lower limit) 97.6016			
p-value	0.9889			
	0.0111	
		
The p-value slightly exceeds the significance level, so fail to reject the null hypothesis. 			

-- Is the plan going to work? Yes, the p-value slightly exceeds the significance level with a value of 0.0111.
-- If not at 99% confidence, what about 95%?
-- If yes at 99%, what about 99.5%? Yes, The p-value is greater than the significance level so  fail to reject the null hypothesis. (P-value is 0.0111, significance level is 0.005)	
-- At which level of confidence can he tell the CEO that the plan is going to work? 99%

-- BONUS:
-- If you still have time, get the count, average, and standard deviation of customer spending
-- for each store. Can you set up a hypothesis test to say if there's a statistically meaningful
-- difference between the two stores? Check chapter 12.