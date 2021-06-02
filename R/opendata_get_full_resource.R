#' Get full Open Data resource
#'
#' @param res_id The resource ID as found on \href{https://www.opendata.nhs.scot/}{NHS Open Data platform}
#'
#' @return a [tibble][tibble::tibble-package] with the data
#' @export 
#'
#' @examples opendata_get_full_resource("d5ffffc0-f6f3-4b76-8f38-71ccfd7747a4")

opendata_get_full_resource <- function(res_id){
  
  # set ckan connection
  ckan_url <- "https://www.opendata.nhs.scot"
  
  #set resource id-s to use
  res_id <- res_id
  
  # extract data
  
  data <- readr::read_csv(glue::glue("{ckan_url}/datastore/dump/{res_id}?bom=true"))%>%
    dplyr::select(-"_id")
  
  return(data)
  
}
