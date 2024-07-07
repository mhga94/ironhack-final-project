# Grain company market entry analysis and dashboard

[Summary](#Summary)
[Observations](#Observations)
[Conclusions](#Conclusions)
[Slides](#Slides)
[Install](#Install)
[Data](#Data)
[Development](#Development)
[Contributors](#Contributors)


## Summary
This project was developed as the final project for Ironhack's 9-week Data Analytics bootcamp run remotely. The project utilises SQL, Jupyter Lab and markdown visualiser Quarto to collate, store, transform and visualise a range of pertinent data for a fictional grain company seeking to gain intelligence on relative market conditions. The project consists of: the SQL scripts for creating the database and cleaning the data (particularly country names), two Jupyter notebooks for loading the SQL data and creating the html dashboard, and a Quarto markdown document incoporating python snippets which created the reveal.js presentation.  

## Observations
* Countries that scored well in climate tended to score well overall (India, USA, Germany), though the disparity between India's CRI and Pakistan's is potentially a cause for concern given the geographical proximity of the two nations. In 2017, a temperature of 54 degrees Celsius was recorded in Balochistan, Pakistan and there were also floods in the country that year which killed 23 people. These factors may have been relevant to the substantially higher CRI score. 
* China's performance in container traffic (231mn average TEU/year) produces an undue skew, since no other country comes remotely close (all scoring 4s or 5s in this category). Eliminating this category would even out the scoring at the top end of the table and produce more significant competition for China.
* Pakistan and Ukraine performed poorly in virtually all categories and the geopolitical instability (and active conflict) in both nations in recent years would suggest that this high ranking is justified. 

## Conclusions
* While China led the index with the leading (lowest) score, various indicators should be considered such as the Doing Business ranking and the very high proportion of grain production for domestic consumption. These might well be barriers both to entry and to transferring profit outside of the country for an international grain business.
* Despite the absence of a geopolitical risk metric (the author's preferred source did not support web scraping), the scoring has partly reflected this indicator through the Doing Business score and - to some degree - the climate risk index.  
* Further improvement: The project might be further improved by adding a degree of interactivity to the weighting of the scoring mechanism. At present, scores are weighted evenly (having been transformed to an approximately 0-5 scale) and such options would enable executives to prioritise certain areas of the score such as wheat yield or access to container shipping. 

## Slides

The slides presenting the data and analysis (in pdf and html formats) can be found in the GitHub repository. Additional SQL integration is required to run the final scripts.

## Install

### Python

The data cleaning and visualisation in Python primarily used the following packages:
* numpy
* pandas
* matplotlib
* plotly
* requests
* tabulate

The versions for the above packages along with the full install list can be found in the requirements text file.

## Data

Data was sourced from the following locations:
* Climate risk: Germanwatch Climate Risk Index (2018) [https://www.germanwatch.org/en/cri]
* Container port traffic: UNCTAD via World Bank TEU/year data [https://data.worldbank.org/indicator/IS.SHP.GOOD.TU?skipRedirection=true&view=map]
* Wheat indicators (production, exports, prices and yield): FAOSTAT [https://www.fao.org/faostat/en/#data/QCL]
* WTO members: Wikipedia [https://en.wikipedia.org/wiki/Member_states_of_the_World_Trade_Organization] (loaded using MS Excel's data scraping function)

Data was stored and cleaned in SQL, transformed in Jupyter Lab and visualised using Quarto's dashboard and presentation functions.

### Considerations
The data used for this project is somewhat outdated owing to new versions being published this year. Germanwatch has had a two-year hiatus on it's public data owing to problems with its supplier and the World Bank suspended its Doing Business report in 2020 after allegations of political influence. The newly compiled data for these indicators will be available later in 2024. 

## Development
Jupyter Lab: Version 4.2.2
MySQL Workbench: Version 8.0.36 build 3737333 CE (64 bits)
Quarto: Version 1.5.47

## Contributors
mhga94
