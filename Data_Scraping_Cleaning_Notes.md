Untitled
================

Scraping and Cleaning Data from Niche.com
=========================================

"Scrap\_Niche.R" is to scrape public high school listing information from &lt;www.niche.com&gt;.This is one of jobs to prepare data set for "FindHome" project.

Scraping Tools
--------------

I use "SelectorGadget",Google Chrome browser and "rvest" R package as a tools-set.

Data Contents Scraped
---------------------

-   School Ranking
-   School Name
-   School District
-   School Niche Rating
-   School Stdudents Number
-   School Student-Teacher Ratio

Data Cleaning Procedure
-----------------------

1.There are total 623 high schools in the list,and only 166 school have been ranked.I give NA to others' rank value.

2."School District","Grade" and "Review Number" are combined together in a same html-node.Sometimes there are "Online School" or "Public School" in this node.Then the positions of "School District" are swifted.At now I just keep "School District" and remove others.In the future maybe I need to consider keeping "grade".

3.I removed "," from "Students Number" and transform it into numeric.

4.In the future there is a big job to do is to get address for each shcool.That's the key connection to job market data set.
