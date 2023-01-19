remove.packages(c("StanHeaders", "rstan"))
install.packages("rstan", repos = c("http://mc-stan.org/r-packages/", getOption("repos")))
library("rstan")

# speed up process by 
options(mc.cores = parallel::detectCores())

# to avoid recompilation of unchanged Stan programs
rstan_options(auto_write=TRUE)

# open stan file(kind of like text file) --> to write the models
# specify dataset( number)
dataset <- list(N = 13, p = 4)

# compile
prediction.pass <- stan("week1.stan", data = dataset, iter = 3000, chains = 3, verbose = FALSE)

print(prediction.pass, probs=c(0.025, 0.5, 0.975))

theta.pass_draws <- extract(prediction.pass, 'theta')[1]

hist(theta.pass_draws, xlim = c(0, 0.8))