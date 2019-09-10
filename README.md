# A collection of usefull R-scripts

# GSDTS
GSDTS tests a list of values x against a larger universe y of values (x < y) by sub-sampling z-times a list of length of x out of the universe. Each sub-sampled list is checked against the already created lists to ensure unique lists to satisfy “sub-sampling without replacement”. The user needs to provide the lists x and y as well as the number of sub-sampling repeats z. As result the sum, mean or median of all sub-sampling results are plotted as histogram and the respective sum, mean or median of list x is then indicated by a red bar in this histogram.
