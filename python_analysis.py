# Installing and importing library
# ! pip install pandas
import pandas as pd 

# read the data and drop unnecessary column 
df = pd.read_csv(
    "data/airbnb_london_cleaned.csv",
    low_memory=False
)
df = df.drop(['Unnamed: 0'], axis = 1)
print(df.head())

# Print first n columns starting from the k-th position 

k = 15
n = 20
columns = df.columns

for col in columns[k:n+k]:
    print(col)

# Among hosts remain only those with length name less than 7 characters

hosts = df.host_name.dropna().unique()
short_hosts = [host for host in hosts if len(host) < 7]

# Compute the number of rows for each host from short_hosts list 

df_host_obser = df[df.host_name.isin(short_hosts)].\
    groupby('host_name').\
    agg({'id':'count'}).\
    reset_index().rename(columns = {'id':'number_observations'})

print(df_host_obser.head())