load_qx_excel <- function(infile, guess_max = 1E5){
	# This function return a list with $data and $desc
	DataNames <- readxl::read_excel(infile, n_max = 1, col_types = "text")
	QX_names <- tibble::tibble(export_tag = names(DataNames), description = as.character(t(DataNames[1,])))
	clinic_survey <- readxl::read_excel(infile, skip = 2, col_names = QX_names$export_tag, guess_max = guess_max)
	return(list("data" = clinic_survey, "desc" = QX_names))
}
