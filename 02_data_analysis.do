* import prepared data 

use "data/airbnb_transformed_data.dta", clear 

* run regression x on sin_response_rate and host_response_rate
reg num_x sin_response_rate num_host_response_rate 

* plot histogram of host_response_rate
histogram num_host_response_rate 

* make dir to save files 
mkdir plots

* save hist plot as file 
graph export "plots/mygraph.pdf", replace