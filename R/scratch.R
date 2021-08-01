set.seed(100)

sim <- data.frame(
  n = seq(10, 1000, by = 10),
  y = 1 - rbinom(100, 1, 0.15) * (abs(rnorm(100, 0.5, 0.5))
  )
)

meas <- data.frame(
  n = 0:1000,
  noise = rnorm(1001, mean = 0, sd = 0.02)
)

sim_noisy <- merge(sim, meas, all = TRUE)
sim_noisy$y_noisy = rowSums(sim_noisy[, c("y", "noise")], na.rm = TRUE)
sim_noisy$cumul_noisy = cumsum(sim_noisy$y_noisy)
