library(aimPlot)
context("Error message")

test_that("No data error message", {
   expect_error(aimPlot(), "'data' must be provided")
})
