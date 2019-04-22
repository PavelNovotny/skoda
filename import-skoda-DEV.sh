#!/bin/bash
# Restore index and data from a file
source ./bin/import.sh

#import_all liferay-20099 http://localhost:9200/liferay-20099 ./data
#import_analyzer cars http://localhost:9200/cars ./data
import_all cars http://localhost:9200/cars_index ./data
#import_all dealers http://localhost:9200/dealers_index ./data
#import_data dealers http://localhost:9200/dealers_index ./data
#import_mapping cars http://localhost:9200/cars ./data
#import_analyzer dealers http://localhost:9200/dealers ./data
#import_settings cars http://localhost:9200/cars ./data
#import_settings dealers http://localhost:9200/dealers ./data

