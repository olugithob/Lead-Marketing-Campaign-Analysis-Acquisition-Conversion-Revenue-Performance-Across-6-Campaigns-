CREATE TABLE tiktok_campaign_dataset (
    lead_id             VARCHAR(10)     PRIMARY KEY,
    lead_date           DATE            NOT NULL,
    campaign_name       VARCHAR(50)     NOT NULL,
    channel             VARCHAR(50)     NOT NULL,
    lead_source         VARCHAR(50)     NOT NULL,
    age                 INT             NOT NULL,
    age_group           VARCHAR(10)     NOT NULL,
    gender              VARCHAR(10)     NOT NULL,
    status              VARCHAR(20)     NOT NULL,
    touchpoints         INT             NOT NULL,
    cost_per_lead        DECIMAL(10,2)   NOT NULL,
    revenue_generated   DECIMAL(10,2)   NOT NULL,
    days_to_conversion  INT             NULL,
    product_purchased   VARCHAR(50)     NULL,
    season              VARCHAR(10)     NOT NULL,
    month               VARCHAR(15)     NOT NULL,
    year                INT             NOT NULL,
    quarter             VARCHAR(5)      NOT NULL
);


SELECT *
FROM tiktok_campaign_dataset

1----Total number of Leads
SELECT COUNT(lead_id) as Total_leads
FROM tiktok_campaign_dataset
--5000


.
2---what is the total revenue from converted leads?
SELECT
		status,
		COUNT(lead_id) as total_leads,
	   ROUND(SUM(revenue_generated), 2) as Total_revenue
FROM tiktok_campaign_dataset
WHERE status = 'Converted'
GROUP BY status
ORDER BY 2 desc
--344,3657.78


3--Which campaign contributes the most in ROI?
SELECT campaign_name,
		ROUND(SUM(revenue_generated), 2) as Total_revenue
FROM tiktok_campaign_dataset
GROUP BY campaign_name
ORDER BY 2 desc
LIMIT 1
--Back-to-school campaign

4(i)--Which channel delivers the highest volume of leads at the lowest cost per lead
	(ii)--Does that channel also convert at the highest rate?	
SELECT channel,
		status,
		COUNT(lead_id) as Total_leads,
		ROUND(AVG(cost_per_lead), 2) as Total_cost
FROM tiktok_campaign_dataset
WHERE status = 'Converted'
GROUP BY channel, status
ORDER BY 4 desc
--Tiktok and Instagram
-- Yes

5--Which lead source — Organic, Paid Ads, Referral, or Direct — produces the highest-value customers when measured by revenue generated per converted lead, not just conversion rate?
SELECT	lead_Source, 
		status,
		COUNT(lead_id) as total_leads,
	SUM(revenue_generated) as revenue
FROM tiktok_campaign_dataset
GROUP BY lead_source, status
ORDER BY 3 desc
--Paid-Ads

6--Which campaign generates the highest ROI, and is that driven more by lower spend, higher conversion rates, or higher average deal size
SELECT campaign_name,
		status,
		COUNT(lead_id) as Total_converted,
		SUM(revenue_generated) as Total_revenue,
		AVG(cost_per_lead) as Total_spend
FROM tiktok_campaign_dataset
WHERE status = 'Converted'
GROUP BY campaign_name, status
--Back-to-school: The ROI for the four different campaign, are driven by the rate and volume of conversion, with Black Friday showing the highest conversion rate.

7--Which of the five products generates the most total revenue?
SELECT product_purchased as Products,
		SUM(revenue_generated) as Total_revenue
FROM tiktok_campaign_dataset
GROUP BY product_purchased
--CRM Integration

8--Lost rate profile
SELECT
    COUNT(lead_id)                                              AS total_leads,
    COUNT(lead_id) FILTER (WHERE status = 'Lost')              AS total_lost,
    ROUND(COUNT(lead_id) FILTER (WHERE status = 'Lost') * 100.0/ COUNT(lead_id), 2)                                                           AS lost_rate_pct
FROM tiktok_campaign_dataset;
--overall lost rate: 10.36%

9--Which lead source has the most lost leads?
SELECT
    lead_source,
    COUNT(lead_id)                                              AS total_leads,
    COUNT(lead_id) FILTER (WHERE status = 'Lost')              AS lost_leads,
    ROUND(COUNT(lead_id) FILTER (WHERE status = 'Lost') * 100.0/ COUNT(lead_id), 2)                                                           AS lost_rate_pct,
    ROUND(AVG(cost_per_lead), 2) AS avg_cpl,
    ROUND(SUM(cost_per_lead) FILTER (WHERE status = 'Lost'), 2)                                                           AS wasted_spend
FROM tiktok_campaign_dataset
GROUP BY lead_source
ORDER BY lost_leads DESC;
--Direct lead_source houses the most lost leads


10--Which channel has the most lost leads?
SELECT
    channel,
    COUNT(lead_id)                                              AS total_leads,
    COUNT(lead_id) FILTER (WHERE status = 'Lost')              AS lost_leads,
    ROUND(COUNT(lead_id) FILTER (WHERE status = 'Lost') * 100.0/ COUNT(lead_id), 2)                                                           AS lost_rate_pct,
    ROUND(AVG(cost_per_lead), 2) AS avg_cpl,
    ROUND(SUM(cost_per_lead) FILTER (WHERE status = 'Lost'), 2)                                                           AS wasted_spend
FROM tiktok_campaign_dataset
GROUP BY channel
ORDER BY lost_leads DESC;
--Tiktok loses leads the most, while Google search has the highest spend lost

11--Which campaign_name has the most lost leads?
SELECT
    campaign_name,
    COUNT(lead_id)                                              AS total_leads,
    COUNT(lead_id) FILTER (WHERE status = 'Lost')              AS lost_leads,
    ROUND(COUNT(lead_id) FILTER (WHERE status = 'Lost') * 100.0/ COUNT(lead_id), 2)                                                           AS lost_rate_pct,
    ROUND(AVG(cost_per_lead), 2) AS avg_cpl,
    ROUND(SUM(cost_per_lead) FILTER (WHERE status = 'Lost'), 2)                                                           AS wasted_spend
FROM tiktok_campaign_dataset
GROUP BY campaign_name
ORDER BY lost_leads DESC;
--New year launch has the most lead lost and also the highest cost lost, signifcantly wasteful.