# Lead-Marketing-Campaign-Analysis-Acquisition-Conversion-Revenue-Performance-Across-6-Campaigns-

## Table of Contents

- [Objective](#objective)
- [Problem Statement](#problem-statement)
- [Tool and Methodology](#tools-and-methodology)
- [Analysis Findings](#analysis-findings)
- [Key Insights](Key_Insights)
- [Recommendations](#Recommendations)
- [Link to Pbix](https://github.com/olugithob/Lead-Marketing-Campaign-Analysis-Acquisition-Conversion-Revenue-Performance-Across-6-Campaigns-/blob/main/Lead%20Marketing%20Campaign%20Acquisition.pbit)

## Objective:

The primary objective is to understand the effectiveness of lead generation efforts. Lead marketing campaigns focus on capturing and nurturing those leads to convert them into paying customers, increase brand awareness, and drive traffic to websites or landing pages.
Meanwhile, the dataset contained 15 Columns and 270,154 rows of data.

## Problem Statement:

Our lead marketing campaigns produce a good number of leads, but we do not know much about how they are performing in terms of product sales. This analysis is best suited to compare the performance of our various lead sources and campaigns in terms of conversion rates, time to first purchase, total value of all purchases, and impact of touchpoints through the customer journey. 
In this case, the goal is to determine which campaigns are generating the most sales and which ones should be adjusted for better results to achieve a high return on investment.

## Tools and Methodology:

### Tools: 

Power Query: Used power query to clean and restructure data for modelling to optimize performance speed.

Dax: Employed Dax functionalities to create and calculate specific measures for key metrics and custom visuals.

Power BI: To build the interactive dashboar for visualization and storytelling.

### Method:

Data Cleaning: This process of data cleaning carried out in this project includes:
 
- Handling missing numeric values, 

- Merging first and last name columns together and trimming off unwanted spaces,

- Handling inconsistencies such as incorrect spellings,

- Grouping age column into intervals,

- Lastly, standardizing specific data fields.

![Cleaned Dataset](https://github.com/olugithob/Lead-Marketing-Campaign-Analysis-Acquisition-Conversion-Revenue-Performance-Across-6-Campaigns-/blob/main/Cleaned.png)

Data Processing: With Power Bi's Dax functionalities, I created calculated measures to show valuable metrics, customized and design visuals to aid clarity in understanding trends.

Data Modeling: Modeling this data allows for multiple tables with lesser column information to speed up processing time, reduce redundancy and increase efficiency.

Python: To dive deeper into analyzing and uncovering patterns and insights. Here's an excerpt:
```python
source=cp.groupby('lead_source').agg(
    revenue = ('revenue', 'sum'),
    avg_cost_per_lead = ('cost_per_lead', 'mean'),
    Total_Leads = ('lead_id', 'count')
).reset_index()

source=source.sort_values('revenue', ascending=False)
source
```

SQL: To Query the data and answer 11 questions of business importance to the problems. Here's an excerpt:
```SQL
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
```

Data Visualization: Built a two page interactive dashboards to properly communicate findings that will foster opportunities to optimize seasonal campaigns, better target specific demographics, and improve lead generation.

## Analysis Findings:

### Executive Report
![Executive report](https://github.com/olugithob/Lead-Marketing-Campaign-Analysis-Acquisition-Conversion-Revenue-Performance-Across-6-Campaigns-/blob/main/Executive_report.png)

### Conversions
![Conversions](https://github.com/olugithob/Lead-Marketing-Campaign-Analysis-Acquisition-Conversion-Revenue-Performance-Across-6-Campaigns-/blob/main/Conversions.png)

### Lost Leads
![Lost leads](https://github.com/olugithob/Lead-Marketing-Campaign-Analysis-Acquisition-Conversion-Revenue-Performance-Across-6-Campaigns-/blob/main/Lead%20Lost.png)

### Key Insights:

The company achieved a total of 653 converted leads, signaling a slight and steady growth of 6.01% from last year; and a 7.4% increase in engagements on all platforms and sources after recording 2589 leads.

The CPL and Converted CPL is $46.92 and $59.25k respectively, indicating that lead acquisition and conversion is relatively economical given the high ROI.

There has been a steady lead growth every quarter from 2023, except in the 2nd quarter of 2024, where there was a 4.4% drop from the first quarter.

Total recorded revenue sits at 1796572.46, representing a 9.08% growth from last year. This shows the contribution of increased converted leads

data revealed that of the 5000 distinct leads, females within the age brackets 25-34(528 leads) and 45-54(525 leads) made the most engagements. We can likely say that the female gender in their youth, and mothers love the company products. Revenue from this age bracket is only behind those aged 55+, which could be due to a few single heavy transactions or product purchases.

Email channel generates the least engagements amongst the 6 social media platforms at 15%, 1-2% less than the rest. Although not significant, it tells us a lot from a very small number of leads.

Back to school(471,989.80) and black Friday sales(473,993.28) campaign are major revenue generators, but back to school(7,897.80) campaign doesn't cost as much as Black Friday(8595.10) campaign. These campaigns are particularly carried out in September and December for Back to school and Black Friday campaigns respectively. This reveals also that these 2 months are peak seasons/periods in the calendar year for the company.

Google search and Facebook have about the same amount of engagement (857), but has a lost lead ratio of 84 to 91, suggesting that ads and products on Facebook are losing engagements. Tiktok and Instagram have a lost ratio of 95 to 92 suggesting the same thing. Interactions on the ads and products via Instagram have the most leads lost within just 1-3 clicks (28), suggesting unsatisfaction or loss appeal with the landing page or flyer of that product, or a difficulty in navigating the sign up process via the channel.


Narrowing down the amount of leads lost to campaigns, reveals a good number of leads lost in the New Year campaign(98) and Spring Promo campaign (92)


Among the 5 products advertised, Digital Ads package has the least number in revenue (606,480); a 10% difference from the average, revealing that it is not very appealing to people.



### Recommendations:


The 3rd quarter of the year is another flourishing season for the year. I'd recommend pushing the back to school campaign as from the month of July for improved results. I'd advice the same in the 4th quarter for the Black-Friday campaign, but from the month of November. The first quarter of the year is a flourishing period for the Summer Blast campaign- Make heavy marketing for it at this period for improved revenue. 

Using the quarterly-revenue campaign matrix, I'd recommend only concentrating marketing power during their flourishing seasons for the campaigns. This would save cost while also maximizing profit.

Leads in the Nurturing stage occupy about 25.4% of the interaction stage is about just the same with the other 4. This pegs results at a bottleneck. Putting 50% more effort into Nurturing the leads in this stage to ensure they breakout into Converted leads would greatly contribute atleast 25% more in revenue. Researching about user preferences and wants through the CRM to understand leads can prove to be the turning point. I'd recommend that the company pay a lot of attention to this area for their next stage of growth. 

To avoid losing more leads after just a few clicks before the sign-up process or Nurturing stage, I'd suggest improving the campaign adverts, especially on Instagram and Tiktok  and using a more user-friendly method.



[python code](https://github.com/olugithob/Lead-Marketing-Campaign-Analysis-Acquisition-Conversion-Revenue-Performance-Across-6-Campaigns-/blob/main/Leads.ipynb)

[sql code](https://github.com/olugithob/Lead-Marketing-Campaign-Analysis-Acquisition-Conversion-Revenue-Performance-Across-6-Campaigns-/blob/main/Lead_marketing_campaign.sql)

[Power BI link](https://github.com/olugithob/Lead-Marketing-Campaign-Analysis-Acquisition-Conversion-Revenue-Performance-Across-6-Campaigns-/blob/main/Lead%20Marketing%20Campaign%20Acquisition.pbit)
