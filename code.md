## Code Example used to clean my data set  
After an initial pass to get rid of a lot of junk in each data set I had two large csv files containing 4 columns each: Created_Date, Complaint_Type, City/Town/Borough, and Location (geo data).

There were over 180+ unique complaint types for the NYC data so I had to group a lot of similar categories together, an example is two complaint types from Boston, one was "Schedule Bulk Pickup" and another was "Schedule a Bulk Pickup". I was able to distill the complaints into 6 categories and then assigned those categories a number to make using the data a bit easier. If you look at the excel sheet attached you'll see the top 30ish complaints for each city. After getting the list of top complaints I bucketed those continued to try pulling the top complaints. After I bucketed the first 30 I was able to see many underneath it which were the same thing as things I'd already bucketed, so I used this as a refinement process to strengthen the numbers of the buckets I created by adding in similar complaint types. Doing this allowed me to include _all_ important complaint types and was able to completely ditch any complaints which were outliers or unimportant.

The data was huge and would only let me pull in small date ranges, this is how I was able to view the top complaints.  
```
df1 = pd.read_csv('NYC_2014_1.csv')
df2 = pd.read_csv('NYC_2014_2.csv')
df3 = pd.read_csv('NYC_2015_1.csv')
df4 = pd.read_csv('NYC_2015_2.csv')
```
```
df_2014 = df1.append(df2, ignore_index=True)
df_2015 = df3.append(df4, ignore_index=True)
```
```
ser1 = pd.Series(df_2014['Complaint_Type'])
ser2 = pd.Series(df_2015['Complaint_Type'])
```
```
ser1.value_counts()[0:31]
ser2.value_counts()[0:31]
```

This is how I grouped all the data into a 'bucket'  
## general
```
df.ix[df.B.isin(['X','Y','Z']), 'CASE_TITLE'] = "General Request/Complaint"
df.ix[df.CASE_TITLE.isin(['Schedule a Bulk Item Pickup', 'Schedule Bulk Item Pickup', 'Request for Recycling Cart', 'Graffiti Removal', 'Sticker Request', 'Other: Comment', 'Other: Complaint', 'Contractors Complaint', 'PublicWorks: Complaint', 'PWD Graffiti', 'Public Works General Request', 'Recycling Cart Inquiry', 'General Comments For a Program or Policy', 'General Request', 'Misc. Snow Complaint']), 'CASE_TITLE'] = "General Request or Complaint"
```
## building conditions
```
df.ix[df.CASE_TITLE.isin(['Building Inspection Request', 'Heat - Excessive  Insufficient', 'Overflowing or Un-kept Dumpster', 'Missed Trash: District 07', 'Missed Trash: District 1C', 'Missed Trash: District 10B', 'Missed Trash: District 03', 'Missed Recycling: District 06', 'Missed Trash: District 06', 'Missed Leaf or Yard Trash: District 07', 'Missed Trash: District 1B', 'Missed Trash: District 02', 'Missed Leaf or Yard Trash: District 03', 'Unsanitary Conditions - Establishment', 'Illegal Occupancy', 'Chronic Dampness/Mold', 'Electrical', 'Missed Trash/Recycling/Yard Waste/Bulk Item', 'Missed Recycling: District 1C', 'Pest Infestation - Residential', 'Missed Recycling: District 03', 'Maintenance Complaint - Residential', 'Missed Recycling: District 1B', 'Missed Trash: District 05', 'No Utilities Residential - Water', 'Missed Trash: District 04', 'Abandoned Building', 'Illegal Rooming House', 'Missed Recycling: District 10B', 'Missed Trash: District 08', 'Missed Recycling: District 02', 'Missed Recycling: District 04', 'Missed Trash: District 10A', 'Missed Recycling: District 07', 'Missed Recycling: District 08', 'Missed Trash: District 09', 'Missed Trash: District 1A']), 'CASE_TITLE'] = "Building Conditions"
```
## living conditons
```
df.ix[df.CASE_TITLE.isin(['Unsatisfactory Living Conditions', 'Rodent Activity', 'Pick up Dead Animal', 'Animal Generic Request', 'Unsafe/Dangerous Conditions', 'Bed Bugs', 'Mice Infestation - Residential']), 'CASE_TITLE'] = "Living Conditions"
```
## signal sign maint
```
df.ix[df.CASE_TITLE.isin(['Traffic Signal Repair', 'Sign Repair', 'Equipment Repair', 'New Sign  Crosswalk or Pavement Marking', 'Missing Sign', 'Street Light Knock Downs', 'Requests for Traffic Signal Studies or Reviews']), 'CASE_TITLE'] = "Signal/Sign Repair"
```
## Parking Enforcement
```
df.ix[df.CASE_TITLE.isin(['Abandoned Vehicles', 'Parking Enforcement', 'Abandoned Bicycle', 'Parking Meter Repairs']), 'CASE_TITLE'] = "Parking Enforcement"
```
## Street/Sidewalk Maintenance
```
df.ix[df.CASE_TITLE.isin(['Pothole Repair (Internal)', 'Request for Pothole Repair', 'Requests for Street Cleaning', 'Street Light Outages', 'Request for Snow Plowing', 'Tree Maintenance Requests', 'Sidewalk Repair (Make Safe)', 'New Tree Requests', 'General Lighting Request', 'Empty Litter Basket', 'Tree Emergencies', 'Pavement Marking Maintenance', 'Sidewalk Repair (Internal)', 'Street Light Outages////printed', 'Sidewalk Repair/Concrete/Dist 7', 'Roadway Repair', 'Sidewalk Repair/Concrete/Dist 10', 'Repaint Crosswalk - Poor Condition', 'Highway Maintenance', 'Sidewalk Cover / Manhole', 'Request for Snow Plowing (Emergency Responder)', 'Sidewalk Repair']), 'CASE_TITLE'] = "Street/Sidewalk Maintenance"
```

After getting rid of the junk I was able to reuse this code for both NYC data and Boston data sets.
```
df = pd.read_csv('NYC.csv', parse_dates=['Created_Date'])
df.ix[df.Complaint_Type.isin(['General Request or Complaint']), 'Complaint_Type'] = 1
df.ix[df.Complaint_Type.isin(['Signal/Sign Repair']), 'Complaint_Type'] = 2
df.ix[df.Complaint_Type.isin(['Parking Enforcement']), 'Complaint_Type'] = 3
df.ix[df.Complaint_Type.isin(['Building Conditions']), 'Complaint_Type'] = 4
df.ix[df.Complaint_Type.isin(['Living Conditions']), 'Complaint_Type'] = 5
df.ix[df.Complaint_Type.isin(['Street/Sidewalk Maintenance']), 'Complaint_Type'] = 6
```
