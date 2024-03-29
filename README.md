# Football Shooting Analysis

This repository contains R code for analyzing shooting data of a football team retrieved from the WorldFootballR package. The code includes functions to collect shooting data from matches, filter matches by team name, simulate goals scored by a player if a shot was taken 1000000 times, and visualize the probabilities of a player scoring a certain number of goals.

## Usage

1. **Setup**
   - Ensure you have R installed on your system.
   - Install the required package `worldfootballR` using `install.packages("worldfootballR")`.
   - Load the necessary library using `library(worldfootballR)`.

2. **Functions**
   - `collect_shooting_data`: Collects shooting data from match URLs and combines it into a dataframe.
   - `filter_team_matches`: Filters matches by team name.
   - `simulate_player_goals`: Simulates goals scored by a player based on their expected goals (xG).

3. **Example Usage**
   - Replace `team_name` and `player_name` with your desired team and player.
   - Run the example code provided to collect shooting data, simulate player goals, and visualize the results.

4. **Output**
   - The code generates a dataframe showing the shooting data and simulates the probabilities of a player scoring different numbers of goals.
   - Visualization includes bar plots showing the probability distribution of goals scored and highlights the actual number of goals scored by the player.

## Dependencies
- R (>= 3.5.0)
- worldfootballR

## Contributors
- [Meio Campo]

## License
This project is licensed under the [MIT License]
## Acknowledgments
- The WorldFootballR package for providing access to football data.
- OpenAI for developing GPT-3, which was used to generate this README template.

## Questions or Issues?
If you have any questions or encounter any issues while using this code, feel free to open an issue on GitHub. 
Contributions are also welcome!

