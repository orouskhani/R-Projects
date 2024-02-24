# First R file
# Load the nnet package for neural networks
library(nnet)

# Generate some training data
set.seed(123)
x_train <- seq(-2, 2, by = 0.1)
y_train <- x_train^2

# Define the neural network architecture
# We'll use a single hidden layer with 5 neurons
# The output layer has only one neuron since we're performing regression
mlp_model <- nnet::nnet(x_train, y_train, size = 5, linout = TRUE)

# Generate some test data
x_test <- seq(-2, 2, by = 0.05)

# Predict using the trained model
y_pred <- predict(mlp_model, data.frame(x_train = x_test))

# Plot the results
plot(x_train, y_train, col = "blue", type = "l", ylim = c(0, 5), main = "Function Approximation using MLP")
lines(x_test, y_pred, col = "red")
legend("topright", legend = c("True Function", "MLP Approximation"), col = c("blue", "red"), lty = 1)

