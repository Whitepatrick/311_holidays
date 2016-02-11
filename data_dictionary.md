# Data Dictionary
Patrick White

I didn't have a lot really,

Created_Date - String -> Datetime
Complaint Type - String -> Integer (after cleaning and aggregating all complaint types)
Weather - String -> Boolean (after ```df.get_dummies(df['Weather'])```)
Max_TempF - String -> Integer (Had to remove a pesky degree special character)
