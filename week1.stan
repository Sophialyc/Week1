data {
  //data block, specifying the sample size
  int<lower = 0> N;
  int<lower = 0> p;
}

parameters {
  //parameter block, specify the bounds
  real<lower=0, upper=1> theta;
}

model {
  //model block
  p ~ binomial(N, theta);
  theta ~ beta(1.0, 1.0);
}
