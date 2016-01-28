## Problem statement and hypothesis  
- Using two years of 311 call data from 2 different locations, am I able to predict the excpected call volume and expected complaint type by location or time of year?

## Description of your data set and how it was obtained
- I obtained my data through the Boston City and New York City Open Data platforms
	- https://nycopendata.socrata.com/
	- https://data.cityofboston.gov/

## Description of any pre-processing / data-munging steps
- I received the data sets as enormous files containing between 40 - 50 columns
	- NYC had +3.5m rows for the years of 2014 and 2015
	- BOS had almost almost 300k rows for the years of 2014 and 2015

## What you learned from exploring the data, including visualizations
- I am still in the process of visualizing but from exploring the data I have noticed that weather events may have the largest effect on what sort of 311 calls a city can expect

## How you chose which features to use in your analysis
- I am using the data over the course of a 2 year period so the date was essential, I am also categorizing the call to describe the general complaint/call reason. There were about 180 - 200 unique complaint types when I first looked around, I tried to categorize them all into buckets that better described the type of call. Example, instead of having complaint types for 'heating' or 'abandoned vehicle' I bucketed them into 'building conditions' and 'parking enforcement'.
- There were a LOT of other columns I could use but they all were almost repeats of previous columns, or offered no significant value to my data set. Some things I took off were address fields (split into individual fields, zip, apt #, etc.), agency fields, and resolution/update dates.

## Details of your modeling process, including how you selected your models and validated them

## Your challenges and successes
- A big challenge I have had has been working with a really large dataset. Since both cities had large amounts of data I didn't want to keep pegging their public API's no matter how temporary the use, I pulled down their CSV files in 6 month chunks. Initially these files were too big to fit on github so I had to really scale back the amount of columns used and also drop any row that was missing input date, complaint type or location.
- Ditching the project I started working on was a bummer, I had a decent script working and pulling in meaningful info from the IMDb API. I'd say switching gears during the beggining of the project was a definite challenge.
- Success has been getting the data to look the way I want it.

## Possible extensions or business applications of your project
- I think this could be used to predict events that require fast action by one of the responding agencies. For example is there is a street festival in march that results in a lot of abandoned vehicles then you would want to marshall some resources closer to the location of the street festival or at least call in some extra employees to handle the incoming calls.

Conclusions and key learnings
- The weather controls us all. Control the weather, control humans.
