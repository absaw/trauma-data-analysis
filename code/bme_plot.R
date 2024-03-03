install.packages("readxl")
install.packages("ggrepel")
install.packages("ggplot2")
library("ggplot2")
library(ggrepel)
library("readxl")
library(dplyr)
data <- read_excel("/Users/abhishek.sawalkar/Library/CloudStorage/Box-Box/KrishnanA-RutgersStudents/Sawalkar/bme_analysis/Top Features.xlsx",sheet="Sheet5",skip=1,col_names=TRUE)
View(data)


ggplot(data,aes(x=Feature,y=Percentage,color=Lab)) +
  geom_point() +
  labs(title="Top Features")+
  theme(axis.text.x=element_text(angle=45,vjust = 0.5))

ggplot(data,aes(x=Feature,color=Lab)) +
  geom_bar() +
  labs(title="Top Features")+
  theme(axis.text.x=element_text(angle=45,vjust = 0.5))


lab_sum <- sum(data$Percentage[data$Lab == 1])
clinic_sum <- sum(data$Percentage[data$Clinic == 1])

pie_data <- data.frame(
  Feature = c("Lab","Clinic"),
  Percentage = c(lab_sum,clinic_sum)
)

ggplot(pie_data, aes(x="",y=Percentage,fill=Feature))+
  geom_bar(stat = "identity") +
  coord_polar("y")+
  geom_text(aes(label = scales::percent(Percentage), y = Percentage / 2)) +
  labs(title = "Lab and Clinic Features") +
  theme_minimal() +
  scale_fill_manual(values = c("Lab" = "blue", "Clinic" = "red"))


library(ggplot2)

# Assuming your data is already loaded, and you have columns: Percentage, Feature, Lab, and Clinic

# Create a pie chart with colors representing lab and clinic features
ggplot(data, aes(x = "", y = Percentage, fill = factor(Lab))) +
  geom_bar(stat = "identity") +
  coord_polar("y") +
  geom_text(aes(label = scales::percent(Percentage), y = Percentage / 2)) +
  labs(title = "Lab and Clinic Features") +
  theme_minimal() +
  scale_fill_manual(values = c("0" = "blue", "1" = "red")) +
  facet_wrap(~Feature)

library(ggplot2)

# Assuming your data is already loaded, and you have columns: Percentage, Feature, Lab, and Clinic
# Create a pie chart with colors representing lab and clinic features
p <- ggplot(data, aes(x = "", y = Percentage, fill = factor(Lab))) +
  geom_bar(stat = "identity") +
  coord_polar("y") +
  labs(title = "Lab and Clinic Features") +
  theme_minimal() +
  scale_fill_manual(values = c("0" = "blue", "1" = "red"))

# Add labels with repel to avoid overlap
p + geom_text_repel(
  aes(label = scales::percent(Percentage), y = 0),
  box.padding = 0.5,
  point.padding = 0.1
)


pie_data <- data %>%
  dplyr::select(Percentage, Feature) %>%
  mutate(type = ifelse("Lab" == 1, "Lab", "Clinic"))


ggplot(pie_data, aes(x = "", y = percentage, fill = type)) + 
  geom_pie(color = "white") + 
  scale_fill_manual(values = c("Lab" = "red", "Clinic" = "blue")) + 
  labs(title = "Pie Chart of Features by Type", x = "", y = "Percentage") + 
  ggsave("pie_chart_by_type.png", width = 600, height = 600)






install.packages("plotly")
library(plotly)
# Create a new data frame with the percentage and feature columns, and a new column called `type` that indicates whether the feature is a lab feature or a clinic feature
pie_data <- data %>%
  dplyr::select(Percentage, Feature) %>%
  mutate(type = ifelse(data$Lab == 1, "Lab", "Clinic"))

# Create a pie chart
p <- plot_ly(pie_data, labels = ~Feature, values = ~Percentage, type = "pie")

# Add a title and labels
layout(title = "Pie Chart of Features by Type")

# Add a color for each type of feature
p <- add_trace(p, colors = c("orange", "skyblue"), type = "pie")

# Save the pie chart as a PNG file
p$layout$filename <- "pie_chart_by_type.png"

# View the pie chart
p$layout$show_link <- FALSE
p

# Create a new data frame with the percentage and feature columns, and a new column called 'type' that indicates whether the feature is a lab feature or a clinic feature
pie_data <- data.frame(Percentage = data$Percentage, Feature = data$Feature, type = ifelse(data$Lab == 1, "Lab", "Clinic"))

# Create the pie chart
pie_chart <- plot_ly(
  pie_data,
  labels = ~Feature,
  values = ~Percentage,
  type = "pie",
  colors = c("red", "blue"),
  textinfo = "label+percent",
  insidetextorientation = "radial",
  hole = 0.3
)

# Add a title and labels
layout(title = "Pie Chart of Features by Type")

# Save the pie chart as a PNG file
ggsave("pie_chart_by_type.png", width = 600, height = 600)


# Display the pie chart
pie_chart
