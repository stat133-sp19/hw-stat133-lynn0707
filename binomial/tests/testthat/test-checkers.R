context("Check binomial checkers arguments")


test_that("check_prob with a valid probablity",{
  expect_true(check_prob(0.5))
  expect_true(check_prob(1))
  expect_true(check_prob(0.23))
})


test_that("check_prob with an invalid probability",{
  expect_error(ckeck_prob(-1))
  expect_error(check_prob(a))
  expect_error(ckeck_prob(-0.5))
})

test_that("check_trials with a valid trial",{
  expect_true(check_trials(2))
  expect_true(check_trials(10))
  expect_true(check_trials(5))
})

test_that("check_trials with an in invalid trial",{
  expect_error(check_trials(-2))
  expect_error(check_trials(s))
  expect_error(check_trials(0.5))
})

test_that("check_success with a valid success trail",{
  expect_true(check_success(2,6))
  expect_true(check_success(c(1:6),10))
  expect_true(check_success(5,50))
})

test_that("check_success with an invalid success trail",{
  expect_error(check_success(5,4))
  expect_error(check_success(1.5,5))
  expect_error(check_success(c(1,2,3),1))
  })
