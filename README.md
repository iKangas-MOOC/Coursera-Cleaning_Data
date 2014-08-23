#CleaningData_Project1
=====================

###Final Project for Cleaning Data course


1.Create tables by reading the datasets available

####(STEP1) merge train and test datasets
2.Merges the training, the test sets and the index sets to create one data set

3.take values with mean and std

4.Finds all variable names that include the word mean or standard deviation

5.Creates a logical vector indicating if the column includes mean or std

6.Adds two TRUE values for the last two columns that were added in the dataset (activity and index of subject)

####(STEP2) extracts measurements on mean and std
7.Subsets dataset from step1 using the logical vector created above


####(STEP3) use descriptive activity names
8.loops through the activity column and replace numbers (1:6) to the corresponding activity

9.make activity col as factor

10.transforms the values of the column into factor to handle easier later on

11.read descriptive variable names

12.reads the description of the variables and adds two values for the last two columns that were added in the dataset (activity and index of subject)

####(STEP4) give descriptive names
13.replaces the names

####(STEP5) create tidy data set and save it in a txt file
14.creates a data frame

15.aggregate by id and by activity

16.loop this function for all variables

17.adds observations in the data frame for each variable (using loop) and for each activity and sublect (using aggregate by these two)

18.create fourth column with variable name

19.adds the name of the variable for each variable

20.add col names

21.adds column names to data frame created

22.write tidy dataset on txt file

23.writes the dataset to a file

24.output tidy data set

25.creates desired output