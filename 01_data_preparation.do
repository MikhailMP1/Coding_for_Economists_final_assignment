* read csv data 

import delimited using "data/airbnb_london_cleaned.csv",  clear

* Choose necessary columns 
keep x host_name host_response_rate 

* Fixing common data qality errors - drop missing host_name 
 
gen mis_host_name =  missing(host_name)

sum(mis_host_name) 

drop if mis_host_name == 1 
* There are some missing values, which considered as text "N/A", need to fix it 

drop if host_response_rate == "N/A"

* Prepare a sample for analysis by filtering observations and variables and creating transformations of variables 

describe host_response_rate

* convert string to numeric 

destring host_response_rate, generate(num_host_response_rate)
destring x, generate(num_x)

describe num_host_response_rate

* drop least 5% of host response rate
summarize num_host_response_rate, detail
drop if num_host_response_rate < `r(p5)' 

summarize num_host_response_rate

* let's create sin transformation of response rate

gen sin_response_rate = sin(num_host_response_rate)

* save prepared data
save "data/airbnb_transformed_data.dta", replace 