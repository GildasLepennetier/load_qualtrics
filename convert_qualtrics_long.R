qualtrics_long_format <- function(survey_tbl) {
	# This function take a data frame from qualtrics and convert it to the long format
	survey_tbl %>%
		# convert to long
		pivot_longer(values_to = "value",
								 names_to = "export_tag",
								 cols = c(contains("Q"),
								 				 "StartDate",
								 				 "RecordedDate",
								 				 "Finished", "Duration (in seconds)",
								 				 "Tranche"), #"EndDate","Progress",
								 values_transform = as.character) %>%
		# remove useles columns
		select(-Status, -IPAddress,
					 #-Pre_Salutation, -Salutation, -Salutation_Plain, -Salutation2,
					 -UserLanguage, -LocationLatitude, -LocationLongitude, -DistributionChannel) %>%
		#remove directly the -99, we can analyse that later
		filter(value != "-99")
}
