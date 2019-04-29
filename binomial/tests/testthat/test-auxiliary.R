context("Check binomial auxiliary arguments")

test_that("aux_mean returns the correct value",{
  expect_equal(aux_mean(10,0.3),3)
  expect_equal(aux_mean(20,0.1),2)
  expect_equal(aux_mean(30,0.5),15)
})

test_that("aux_variance returns the correct value",{
  expect_equal(aux_variance(10,0.3),2.1)
  expect_equal(aux_variance(20,0.1),1.8)
  expect_equal(aux_variance(30,0.5),7.5)
})

test_that("aux_mode returns the correct value",{
  expect_equal(aux_mode(10,0.3),3)
  expect_equal(aux_mode(20,0.1),2)
  expect_equal(aux_mode(30,0.5),15)
})

test_that("aux_skewness returns the correct value",{
  expect_equal(aux_skewness(10,0.3),0.2760262, tolerance = 1e-5)
  expect_equal(aux_skewness(20,0.1),0.5962848, tolerance = 1e-5)
  expect_equal(aux_skewness(30,0.5),0)
})

test_that("aux_kurtosis returns the correct value",{
  expect_equal(aux_kurtosis(10,0.3),-0.1238095, tolerance = 1e-5)
  expect_equal(aux_kurtosis(20,0.1),0.2555556, tolerance = 1e-5)
  expect_equal(aux_kurtosis(30,0.5),-0.06666667, tolerance = 1e-5)
})
