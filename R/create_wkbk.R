#' Creates an Excel workbook with worksheets.
#'
#' @param file filename of workbook to be created
#' @param df_list list of data frames to be added as worksheets to workbook
#' @param sheetnames character vector of worksheet names
#' @param create Specifies if the file should be created if it does not
#' already exist (default is FALSE). Note that create = TRUE has
#' no effect if the specified file exists, i.e. an existing file is
#' loaded and not being recreated if create = TRUE.
#' @param perl_path Specifies the path to the perl executable
#' @import WriteXLS
#' @export
create_wkbk <- function(file, df_list, sheetnames, create = TRUE,
      perl_path = "c:/Perl/Perl/bin/perl") {
  if (length(df_list) != length(sheetnames))
    stop("Number of dataframes does not match number of worksheet names")

  if (file.exists(file) & create)
    file.remove(file)

  WriteXLS(x = df_list, ExcelFileName = file, SheetNames = sheetnames,
           Encoding = "UTF-8", col.names = TRUE, AdjWidth = TRUE,
           perl = perl_path)
}
