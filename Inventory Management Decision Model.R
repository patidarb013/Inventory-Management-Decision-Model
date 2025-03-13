##### An Inventory Management Decision Model #####

# Part 1

# Annual Demand	= 15000
# Unit Cost	= $110 
# Holding Cost Rate	= 16.5%
# Order Cost = $179.00 

# Unit Cost
Unit_Cost <- 110

# Unit Holding Cost
Holding_Cost <- 0.165

# Order Cost
Order_Cost <- 179

#Annual Demand
Annual_Demand <- 15000

# Order Volume
Order_Volume <- seq(100, 1200, by = 1)

# No. of orders
Order_Count <- Annual_Demand / Order_Volume

# Average Inventory
Average_Inventory <- Order_Volume / 2

# Equation
Total_Cost <- (Average_Inventory * 14) + (Order_Count * 179)


# Plot Total Cost vs Order Volume 
plot(Order_Volume,
     Total_Cost,'l',
     main = 'Total Cost vs Order Volume',
     xlab = 'Order Volume',
     ylab = 'Total Cost (in $)')

# Finding lowest value of order volume and total cost
Order_Volume[which.min(Total_Cost)]

Total_Cost[which.min(Total_Cost)]

which.min(Total_Cost)

# Optimization Model

Interval <- c(100, 5000)
Function <- function(Order_Volume)
  ((Order_Volume/ 2) * 14)+ ((Annual_Demand / Order_Volume) * 179)

Optimization <- optimise(f = Function,
                         interval = Interval,
                         lower = min(Interval),
                         upper = max(Interval),
                         maximum = FALSE ,
                         tol = .Machine$double.eps ^ 0.5
)

Optimization

paste('order volume :', round(Optimization[[1]], 1), 'units')
paste('Total Cost :', '$', round(Optimization[[2]], 1))


# Part 2

#num_cases <- 1000
Min_Demand <- 10000
Max_Demand<-18000
Mode_Demand <- 13000

simulation <- (runif(5000))
simulation <- round(simulation, 2)
simulation
m <- as.data.frame(simulation)
min(simulation)
max(simulation)

#Triangle Formula: 
# K	= (c - a) / (b - a)
# M	= (b-a) (c-a)
# N =	(b-a) (b-c)

K <- (Mode_Demand - Min_Demand) / (Max_Demand - Min_Demand)
K
options(scipen = 999)
M <- (Max_Demand - Min_Demand) * (Mode_Demand - Min_Demand)
M

N <- (Max_Demand - Min_Demand) * (Max_Demand - Mode_Demand)
N

#when  sim <= K,   x = a +  sqrt( sim*M )		
#when  sim > K,  y = b -  sqrt( (1-sim) N)	

x = Min_Demand + sqrt(simulation*M)
y = Max_Demand - sqrt((1-simulation)*N)

Annual_Demand_Simulation <- ifelse(x <= K, x, y)
Annual_Demand_Simulation <- round(Annual_Demand_Simulation,0)

summary(Annual_Demand_Simulation)
round(sd(Annual_Demand_Simulation),0)
Annual_Demand_2 <- Annual_Demand_Simulation

Simulation_Inv_Level <- round(sqrt(((1.6 * Annual_Demand_2 * Order_Cost) / (Unit_Cost * Holding_Cost))),0)
Simulation_Inv_Level

Simulation_Inv_Level_2 <- 1.6 * Simulation_Inv_Level
Simulation_Inv_Level_2

Simulation_Order_N <- round(Annual_Demand_2 / Simulation_Inv_Level_2,0)
Simulation_Order_N

Simulation_Annual_Order_Cost	<- Order_Cost * (Annual_Demand_2/Simulation_Inv_Level_2)
Simulation_Annual_Order_Cost

Simulation_Annual_Hold_Cost	<- Simulation_Inv_Level * Unit_Cost * Holding_Cost
Simulation_Annual_Hold_Cost

Simulation_Total_Inv_Cost <-	Simulation_Annual_Order_Cost + Simulation_Annual_Hold_Cost
Simulation_Total_Inv_Cost

simulation_value <- data.frame(simulation, Annual_Demand_2, Simulation_Total_Inv_Cost, Simulation_Inv_Level_2, Simulation_Order_N)
summary(simulation_value) 
str(simulation_value)

# Normal Total Inventory Cost  
Total_Cost_Inventory <- rnorm(n = 5000, m = min(simulation_value$Simulation_Total_Inv_Cost), sd = sd(simulation_value$Simulation_Total_Inv_Cost))
hist(simulation_value$Simulation_Total_Inv_Cost, freq = F, main = "Total Cost Distribution") 
plot(ecdf(simulation_value$Simulation_Total_Inv_Cost))
qqnorm(Total_Cost_Inventory)  
shapiro.test(Total_Cost_Inventory)

plot(simulation_value$Annual_Demand_2, simulation_value$Simulation_Total_Inv_Cost, xlab = "Annual Demand (in units)", ylab = "Total Cost(in $)") 


# Normal Distribution Number of Orders 
Number_order <- rnorm(n = 5000, m = mean(simulation_value$Simulation_Order_N), sd = sd(simulation_value$Simulation_Order_N))
hist(simulation_value$Simulation_Order_N, freq = F, main = "Number of Order") 
plot(ecdf(simulation_value$Simulation_Order_N))
qqnorm(Number_order)  
shapiro.test(Number_order)

# Normal Distribution Order Quantity 
order_quantity <- rnorm(n = 5000, m = mean(simulation_value$Simulation_Inv_Level_2), sd = sd(simulation_value$Simulation_Inv_Level_2))
hist(simulation_value$Simulation_Inv_Level_2, freq = F, main = "Order Quantity") 
plot(ecdf(simulation_value$Simulation_Inv_Level_2))
qqnorm(order_quantity)  
shapiro.test(order_quantity)

