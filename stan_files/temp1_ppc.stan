data {
  int<lower=0> N;
  vector[N] CO2;
}

generated quantities {
  real alpha = normal_rng(0.75, 0.1);
  real beta = normal_rng(0, 1);
  real sigma = normal_rng(0.2, 0.1);
  vector[N] temperature;

  for (i in 1:N) {
    temperature[i] = normal_rng(alpha + beta * CO2[i], sigma);
  }
}
