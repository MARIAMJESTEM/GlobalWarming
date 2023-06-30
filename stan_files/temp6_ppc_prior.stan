data {
  int<lower=0> N;
  vector[N] CO2;
}

generated quantities {
  real sigma = normal_rng(0.1,0.05);
  real nu = gamma_rng(2, 0.1);
  real alpha = normal_rng(0.7, 0.1);
  real beta_CO2 = normal_rng(0, 0.1);
  vector[N] temperature;

  for (i in 1:N) {
    temperature[i] = student_t_rng(nu, alpha + beta_CO2 * CO2[i], sigma);
  }
}