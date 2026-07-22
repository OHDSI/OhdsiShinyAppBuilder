# library(Characterization)
# library(testthat)

context("addModuleConfig")


test_that("initializeModuleConfig", {
  
  initCon <- initializeModuleConfig()
  
  testthat::expect_true(inherits(initCon$shinyModules, 'list'))
  testthat::expect_equal(length(initCon), 1)
  testthat::expect_equal(length(initCon$shinyModules), 0)
  
})


test_that("addModuleConfig works", {
  
  newCon <- initializeModuleConfig()
  testthat::expect_equal(length(newCon$shinyModules),0)
  
  newCon <- addModuleConfig(
    config = newCon, 
    moduleConfig = list(add=TRUE)
  )
  
  testthat::expect_equal(newCon$shinyModules[[1]], list(add=TRUE, order = 1))
  testthat::expect_equal(length(newCon$shinyModules),1)
  
  newCon <- addModuleConfig(
    config = newCon, 
    moduleConfig = list(second=TRUE)
  )
  
  testthat::expect_equal(newCon$shinyModules[[2]], list(second=TRUE, order = 2))
  testthat::expect_equal(length(newCon$shinyModules),2)

})
