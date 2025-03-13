Here's a sample content for your README file for the Git repository:

---

# Inventory Management Decision Model

## Overview
This repository contains the code and analysis for an Inventory Management Decision Model project, developed using both R Studio and Excel. The project aims to minimize the total inventory cost by optimizing order volume and analyzing the effects of different parameters on costs. This is done by running simulations based on a triangular probability distribution for annual demand, performing sensitivity analysis, and using what-if scenarios.

## Project Structure
- **R Studio Analysis**: Contains R scripts to calculate the minimal yearly ordering cost, minimum holding cost, and total cost based on simulations using triangular probability distributions.
- **Excel Analysis**: Includes Excel sheets used to calculate the ordering and holding costs, as well as the total cost based on given data.
- **Simulations**: Code to run 1000 simulations for total cost, order quantities, and annual orders, with results visualized using graphs and statistical tests (e.g., Q-Q plot, Shapiro-Wilk test).
- **What-if Analysis**: Scenarios testing the sensitivity of total costs to different model parameters such as order cost and unit cost.

## Getting Started
To run the R scripts, ensure you have R and the necessary libraries installed. The required libraries are:
- `ggplot2`
- `dplyr`
- `shapiro.test`
- `stats`
- `ggplot2`
  
You can install these libraries using the following command in R:
```r
install.packages(c("ggplot2", "dplyr", "shapiro.test", "stats"))
```

## Running the Scripts
1. **R Studio Analysis**: 
   - Run the `inventory_model.R` script to calculate and visualize the total cost, order quantity, and annual orders.
   
2. **Excel Analysis**: 
   - Open the provided `inventory_analysis.xlsx` file to check the calculations for ordering costs, holding costs, and total costs based on the given inventory data.

3. **Simulations**: 
   - Run the `simulations.R` script to simulate annual demand and ordering patterns, and analyze the results using Q-Q plots and normal distribution tests.

4. **What-If Analysis**:
   - Open `what_if_analysis.R` to test the impact of different parameters like unit cost and order cost on the overall inventory cost.

## Key Results
- The lowest overall cost for the inventory system was found to be approximately $8670 based on simulations.
- Sensitivity analysis showed that adjusting parameters like order cost and unit cost significantly influences the overall inventory cost.
- The simulations support the conclusion that the estimated annual demand and order quantity follow a normal distribution.

## Conclusion
This repository provides an inventory management decision model that can be used to manage inventory costs effectively through simulations and sensitivity analysis. The code can be adapted for various inventory systems and further optimized for real-world applications.
