# Dummy import
globalVariables("stock")

#' Get the jumping rivers stock price
#' 
#' @param current A data
#' @importFrom lubridate seconds ymd_hms
#' @export
#' @examples
#' get_stock()
get_stock = function(current= NULL) {
  if (is.null(current)) {
    current = as.integer(unclass(Sys.time()))
  }
  tmp = new.env()
  data(stock, package = "jrWhyR", envir = tmp)
  dd = tmp$stock
  m = max(dd$x)
  x = dd$x; y = dd$y
  dd_extend = data.frame(x = c(x - max(x), x), y = c(y, y))

  end = current %% m
  start = end - m  + 100

  dd = dd_extend[dd_extend$x > start & dd_extend$x < end, ]
  dd$x = dd$x - min(dd$x)
  dd$x = as.integer(dd$x)
  dd = dd[!duplicated(dd$x), ]
  now = ymd_hms(Sys.time())
  dd$x = now + seconds(dd$x - max(dd$x))

  colnames(dd) = c("time", "value")
  tibble::as_tibble(dd)
}

#' @importFrom utils data
#' @rdname get_stock
#' @param stock current stock price
#' @export
magic_eightball = function(stock) {
  sample(c("Buy", "Sell"), 1)
}
