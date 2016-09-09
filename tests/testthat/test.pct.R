library(aimPlot)
context("Area percentage")

test_that("Percent for middle area", {
   expect_error(aimPlot(), "'data' must be provided")
})
