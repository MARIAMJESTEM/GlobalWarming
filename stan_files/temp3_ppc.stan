data {
  int<lower=0> N;
  vector[N] CO2;
  vector[N] CH4;
  vector[N] N2O;
}

generated quantities {
  real alpha = normal_rng(0.75, 0.1);
  real beta_CO2 = normal_rng(0, 1);
  real beta_CH4 = normal_rng(0, 1);
  real beta_N2O = normal_rng(0, 1);
  real sigma = normal_rng(0.2, 0.1);
  vector[N] temperature;

  for (i in 1:N) {
    temperature[i] = normal_rng(alpha + beta_CO2 * CO2[i] + beta_CH4 * CH4[i] + beta_N2O * N2O[i], sigma);
  }
}
