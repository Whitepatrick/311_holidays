## Code Example used to clean my data set  
After an initial pass to get rid of a lot of junk in each data set I had two large csv files containing 4 columns each: Created_Date, Complaint_Type, City/Town/Borough, and Location (geo data).

There were over 180+ unique complaint types for the NYC data so I had to group a lot of similar categories together, an example is two complaint types from Boston, one was "Schedule Bulk Pickup" and another was "Schedule a Bulk Pickup". I was able to distill the complaints into 6 categories and then assigned those categories a number to make using the data a bit easier. If you look at the excel sheet attached you'll see the top 30ish complaints for each city. After getting the list of top complaints I bucketed those continued to try pulling the top complaints. After I bucketed the first 30 I was able to see many underneath it which were the same thing as things I'd already bucketed, so I used this as a refinement process to strengthen the numbers of the buckets I created by adding in similar complaint types. Doing this allowed me to include _all_ important complaint types and was able to completely ditch any complaints which were outliers or unimportant.

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
