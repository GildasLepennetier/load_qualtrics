print("function: load_qx_excel")
load_qx_excel <- function(infile, guess_max = 1E5){
	# This function return a list with $data and $desc
	# usage example:
	#   XX <- load_qx_excel("file_from-QX.xlsx")
	#   survey_allg <- XX$data ; survey_allg_desc <- XX$desc ; rm(XX)

	DataNames <- readxl::read_excel(infile, n_max = 1, col_types = "text")
	QX_names <- tibble::tibble(export_tag = names(DataNames), description = as.character(t(DataNames[1,])))
	clinic_survey <- readxl::read_excel(infile, skip = 2, col_names = QX_names$export_tag, guess_max = guess_max)
	return(list("data" = clinic_survey, "desc" = QX_names))
}


print("function: load_qx_csv")
load_qx_csv <- function(infile, sep = ","){
	# This function return a list with $data and $desc
	# usage example:
	#   XX <- load_qx_csv("file_from-QX.csv")
	#   survey_allg <- XX$data ; survey_allg_desc <- XX$desc ; rm(XX)

	DataNames <- read.csv(infile, nrows = 1, header = TRUE, sep = sep)
	QX_names <- tibble::tibble(export_tag = names(DataNames), description = as.character(t(DataNames[1,])))
	clinic_survey <- tibble::as_tibble(read.csv(infile, skip = 1, header = TRUE))
	names(clinic_survey) <- QX_names$export_tag
	return(list("data" = clinic_survey, "desc" = QX_names))
}

