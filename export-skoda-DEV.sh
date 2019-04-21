#!/bin/bash
source ./bin/export.sh
server="dev.skodaplus.cleverlance.com:80/esdev"
data_folder=./data

export_all http://$server liferay-20099 $data_folder
#export_settings http://$server order_index $data_folder
#export_settings http://$server customer_index $data_folder
#export_settings http://$server product_index $data_folder
#export_settings http://$server customer_acccount_index $data_folder
#export_settings http://$server contact_person_index $data_folder

