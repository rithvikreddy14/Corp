# Load necessary libraries
library(rpart)

# Import the dataset from a CSV file
data <- read.csv("Datasets/Crop_recommendation.csv")

# Train the decision tree model
model <- rpart(label ~ N + P + K + temperature + humidity + ph + rainfall, data = data, method = "class")

# Function to get user input and predict the crop
predict_crop <- function() {
  # Prompt the user for input values
  N <- as.numeric(readline(prompt = "Enter Nitrogen (N) value: "))
  P <- as.numeric(readline(prompt = "Enter Phosphorus (P) value: "))
  K <- as.numeric(readline(prompt = "Enter Potassium (K) value: "))
  temperature <- as.numeric(readline(prompt = "Enter temperature value (°C): "))
  humidity <- as.numeric(readline(prompt = "Enter humidity value (%): "))
  ph <- as.numeric(readline(prompt = "Enter pH value: "))
  rainfall <- as.numeric(readline(prompt = "Enter rainfall value (mm): "))
  
  # Create a new data frame from the user input
  new_data <- data.frame(
    N = N,
    P = P,
    K = K,
    temperature = temperature,
    humidity = humidity,
    ph = ph,
    rainfall = rainfall
  )
  
  # Predict the crop type based on the user input
  predicted_crop <- predict(model, new_data, type = "class")
  
  # Display the predicted crop
  cat("The predicted crop is:", predicted_crop, "\n")
}

# Call the function to get user input and predict the crop
predict_crop()