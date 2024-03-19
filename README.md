# ProbabilityPlayerScoring
Repository for a R framework to compute how likely it is for a player to score a given number of goals based on xG value of every shot taken in the league

README.md

# Football Shooting Analysis
This repository contains R code for analyzing shooting data of a football team retrieved from the WorldFootballR package. The code includes functions to collect shooting data from matches, filter matches by team name, simulate goals scored by a player, and visualize the probabilities of a player scoring a certain number of goals.

# Usage
# Setup
Ensure you have R installed on your system.

Install the required package worldfootballR using 'install.packages("worldfootballR")'.

Load the necessary library using 'library(worldfootballR)'.

# Functions
'collect_shooting_data': Collects shooting data from match URLs and combines it into a dataframe.

'filter_team_matches': Filters matches by team name.

'simulate_player_goals': Simulates goals scored by a player based on their expected goals (xG).

# Example Usage
Replace 'team_name' and 'player_name' with your desired team and player.
Run the example code provided to collect shooting data, simulate player goals, and visualize the results.

# Output
The code generates a dataframe showing the shooting data and simulates the probabilities of a player scoring different numbers of goals.
Visualization includes bar plots showing the probability distribution of goals scored and highlights the actual number of goals scored by the player.

# Dependencies
R (>= 3.5.0)
worldfootballR

# Contributors
Meio Campo - GitHub Profile
License
This project is licensed under the GNU License.

# Acknowledgments
The WorldFootballR package for providing access to football data.
OpenAI for developing GPT-3, which was used to generate this README template.

Contributions are also welcome
