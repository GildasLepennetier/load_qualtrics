print("function: qualtrics_long_format")
qualtrics_long_format <- function(survey_tbl,	columns = c("StartDate","RecordedDate")) {
	# This function take a data frame from qualtrics and convert it to the long format
	# do not forget: filter(value != "-99")
	# also: remove useless column if needed
	# columns to give a list of column to put in long, that are not question with Q
	survey_tbl %>% pivot_longer(values_to = "value",names_to = "export_tag",
															cols = c(contains("Q"), columns), #"EndDate","Progress",
															values_transform = as.character)
}
