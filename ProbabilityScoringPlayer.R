# Load the necessary package
library(worldfootballR)

# Function to collect shooting data from each match URL and combine into a dataframe
collect_shooting_data <- function(match_urls, time_pause = 3) {
  all_shooting_data <- list()
  
  for (match_url in match_urls) {
    shooting_data <- fb_match_shooting(match_url, time_pause)
    all_shooting_data <- c(all_shooting_data, list(shooting_data))
    Sys.sleep(time_pause)  # Pause to prevent overloading the server
  }
  
  combined_data <- do.call(rbind, all_shooting_data)
  return(combined_data)
}

# Function to filter matches by team name
filter_team_matches <- function(match_urls, team_name) {
  team_matches <- grep(team_name, match_urls, value = TRUE, ignore.case = TRUE)
  return(team_matches)
}

# Define a function to simulate goals scored by a player
simulate_player_goals <- function(player_shots) {
  shots_simulation <- runif(nrow(player_shots))
  goals <- sum(shots_simulation <= player_shots$xG)
  return(goals)
}

# Example usage:
match_urls <- fb_match_urls(country = "POR", gender = "M", season_end_year = 2024, tier = "1st")

# Replace "Sporting" with the desired team name
team_name <- "Braga"  # Example: change "Braga" to the desired team name

team_match_urls <- filter_team_matches(match_urls, team_name)

# Collect shooting data for each match URL
shooting_data <- collect_shooting_data(team_match_urls)

# Print the combined dataframe
print(shooting_data)

# Filter shots taken by a player with the desired name
player_name <- "Banza"  # Example: change "Banza" to the desired player name
player_shots <- shooting_data[grepl(player_name, shooting_data$Player, ignore.case = TRUE), ]

# Perform simulation for the player
n_times <- 1000000
player_goals_sim <- replicate(n_times, simulate_player_goals(player_shots))

# Create a dataframe with simulation results
sim_results_df <- data.frame(Goals = 0:max(player_goals_sim))

# Count the frequency of each goal count in the simulation results
sim_results_df$Frequency <- sapply(sim_results_df$Goals, function(x) sum(player_goals_sim == x))

# Calculate probabilities
sim_results_df$Probability <- sim_results_df$Frequency / sum(sim_results_df$Frequency)

# Print the dataframe
print(sim_results_df)

# Plot the probabilities
barplot(sim_results_df$Probability, names.arg = sim_results_df$Goals,
        xlab = "Goals", ylab = "Probability", main = paste("Probability of", player_name, "Scoring Goals"))

# Find out how many shots resulted in a goal for the player
player_goals_actual <- sum(player_shots$Outcome == "Goal")

# Plot the probabilities
barplot(sim_results_df$Probability, names.arg = sim_results_df$Goals,
        xlab = "Goals", ylab = "Probability", main = paste("Probability of", player_name, "Scoring Goals"),
        col = ifelse(sim_results_df$Goals == player_goals_actual, "darkgreen", "lightblue"))

# Add legend
legend("topright", legend = c("Actual Goals", "Probability of Scoring X Goals"),
       fill = c("darkgreen", "lightblue"))

# Add probabilities on top of the green bar
text(x = which(sim_results_df$Goals == player_goals_actual), 
     y = sim_results_df$Probability[which(sim_results_df$Goals == player_goals_actual)] + 0.01, 
     labels = paste0(round(sim_results_df$Probability[which(sim_results_df$Goals == player_goals_actual)] * 100, 2), "%"), 
     pos = 3)
