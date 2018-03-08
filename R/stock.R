# logo = readRDS("~/logo.rds")
# x = logo[logo$line == 1, 1]
# x = x - min(x)
# y = logo[logo$line == 1, 2]
# tmp = xspline(c(x, max(x) + x + 25), c(y, y), draw = FALSE, shape = -0.35)
# dd = data.frame(x = tmp$x, y = tmp$y)
# dd = dd[371:1699,]
# dd$x = dd$x - min(dd$x)
# saveRDS(dd, file = "/tmp/dd.rds")
#


globalVariables("stock")


#library(lubridate)

#' Get the jumping rivers stock price
#' 
#' @param current A data
#' @importFrom lubridate seconds ymd_hms
#' @export
get_stock = function(current= NULL) {
  if(is.null(current)) {
    current = as.integer(unclass(Sys.time()))
  }
  tmp = new.env()
  data(stock, package= "jrWhyR", envir = tmp)
  dd = tmp$stock
  m = max(dd$x)
  x = dd$x; y = dd$y
  dd_extend = data.frame(x = c(x - max(x), x ), y = c(y, y))

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
