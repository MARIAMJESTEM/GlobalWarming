
data {
    int<lower=0> N;
    vector[N] temp;
    vector[N] co2;
}

parameters {
    real<lower=0> alpha;
    real<lower=0> sigma;
    real<lower=0> beta;
}

transformed parameters {
    vector[N] mean;
    for (i in 1:N) {
      mean[i] = alpha + beta * co2[i];
  }
}

model {
    alpha ~ normal(0.75, 0.1);
    sigma ~ normal(0.2, 0.1);
    beta ~ normal(0, 1);
    for (i in 1:N) {
      temp[i] ~ normal(mean[i], sigma);
    }
}

generated quantities {
    vector[N] temp_;
    for (i in 1:N) {
        temp_[i] = normal_rng(mean[i], sigma);
    }
}
