set.seed(100)

sim <- data.frame(
  n = seq(10, 1000, by = 10),
  y = 1 - rbinom(100, 1, 0.15) * (abs(runif(100, min = 0.2, max = 0.8))
  )
)

meas <- data.frame(
  n = 0:1000,
  noise = rnorm(1001, mean = 0, sd = 0.02)
)

sim_noisy <- merge(sim, meas, all = TRUE)
sim_noisy$y_noisy <- rowSums(sim_noisy[, c("y", "noise")], na.rm = TRUE)
sim_noisy$cumul_noisy <- cumsum(sim_noisy$y_noisy)

plot(sim_noisy[, c("n", "cumul_noisy")])