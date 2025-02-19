print("function: load_qx_excel")
load_qx_excel <- function(infile, guess_max = 1E5){
	DataNames <- readxl::read_excel(infile, n_max = 1, col_types = "text")
	QX_names <- tibble::tibble(export_tag = names(DataNames), description = as.character(t(DataNames[1,])))
	this_data <- readxl::read_excel(infile, skip = 2, col_names = QX_names$export_tag, guess_max = guess_max)
	return(list("data" = this_data, "desc" = QX_names))
}


print("function: load_qx_csv")
load_qx_csv <- function(infile, sep = ","){
	DataNames <- read.csv(infile, nrows = 1, header = TRUE, sep = sep)
	QX_names <- tibble::tibble(export_tag = names(DataNames), description = as.character(t(DataNames[1,])))
	this_data <- tibble::as_tibble(read.csv(infile, skip = 1, header = TRUE))
	names(this_data) <- QX_names$export_tag
	return(list("data" = this_data, "desc" = QX_names))
}

