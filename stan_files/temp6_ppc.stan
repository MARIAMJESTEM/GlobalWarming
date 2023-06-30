data {
  int<lower=0> N; // number of data points
  vector[N] CO2;
  vector[N] temp;
}
parameters {
  real<lower=0> alpha;
  real<lower=0> beta_CO2;
  real<lower=0> sigma;
  real<lower=1, upper=80> nu;
}
transformed parameters {
  vector[N] mu;
  mu = alpha + beta_CO2 * CO2;
}
model {
  nu ~ gamma(2, 0.1); // found this online: Juarez and Steel(2010)
  temp ~ student_t(nu, mu, sigma);
  alpha ~ normal(0.7, 0.1);
  beta_CO2 ~ normal(0, 0.1);
  sigma ~ normal(0.1,0.05);

}
generated quantities {
    vector[N] temp_i;
    vector[N] temp_student;
    for (i in 1:N) {
        temp_i[i] = student_t_rng(nu,mu[i],sigma);
        temp_student[i] = student_t_lpdf(temp[i] | nu, mu[i], sigma);
    }
}

