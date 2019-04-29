context("Check binomial main arguments")

test_that("bin_choose returns the correct value",{
  expect_equal(bin_choose(n =5, k =2),10)
  expect_equal(bin_choose(5,0),1)
  expect_equal(bin_choose(5,1:3),c(5,10,10))
})

test_that("bin_choose fails to return",{
  expect_error(bin_choose(-3,0.1))
  expect_error(bin_choose(0.5,1))
  expect_error(bin_choose(-3,6))
})

test_that("bin_probability returns the correct value",{
  expect_equal(bin_probability(n =5, k =2, p=0.5),0.3125)
  expect_equal(bin_probability(n= 5, k =0:2,p = 0.5),c(0.03125, 0.15625, 0.31250))
  expect_equal(bin_probability(100,55,0.45),0.01075277)
})

test_that("bin_distribution returns the correct bionmial distribution",{
  dis1 <- bin_distribution(n =5, p=0.5)
  expect_length(dis1, 2)
  expect_length(dis1$k,6)
  expect_equal(dis1$k, 0:5)
  expect_equal(dis1$probability, c(0.03125,0.15625,0.31250,0.31250,0.15625,0.03125))
})

test_that("bin_cumulative returns the correct cumulative probability",{
  dis2 <- bin_cumulative(n = 5, p = 0.5)
  expect_length(dis2, 3)
  expect_length(dis2$k,6)
  expect_equal(dis2$k, 0:5)
  expect_equal(dis2$cumulative,
               c(0.03125, 0.18750, 0.50000, 0.81250, 0.96875, 1.00000))
})
