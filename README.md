
# ETL Project Report: US Senator Stock Trades - 2012-2021

Northwestern Data Science Bootcamp - Project 2

Sodiq Alagbada, Molly Bruns, Tim Bryan, and Andrew Goodwin

---

[add paragraph about proposal, project purpose here]
- what is the data sources? data description - sources, format, etc.
- database type
- questions to ask of the data:
- use case

### Extract

The data for senator stock trades was found on the [Harvard Dataverse](https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/XPDSYQ) site and was downloaded as a .txt file. This dataset contained information about the senators and their stock trades between 2012 and 2021. It also includes trades reported by their spouses and/or children.

We also used Yahoo Finance data to add sectors associated with each ticker/company. We had first tried using several APIs, but ran into issues with the amount of calls allowed per minute and runtime. We ended up scraping the Yahoo Finance site for this sector data instead.

### Transform

Once we extracted the trades information from the Harvard Dataverse site, we were able to read that .txt file into pandas as a csv and work with it as a DataFrame. To clean this data, we dropped all rows with null values in the stock ticker column, changed the political party and sex columns from binary values to descriptive strings, changed the date column values to datetime values, and merged the min and max trades columns into one to show the range of the amount. We also renamed the columns to make the values easier to understand.

We used BeautifulSoup to scrape the Yahoo Finance pages for each unique ticker, and appended each company's sector as a string in a new list. We then created a dictionary, using the unique ticker code as keys and the sector string as values. With this dictionary, were able to create a new list of sectors in same order as the list of all tickers in the trades DataFrame, and add a new sector column with the corresponding values.

### Load

