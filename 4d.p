set terminal png size 800,600
set output 'age_pie_chart.png'

set title "Age Groups with Heart Disease"
unset key
unset tics
set size square

# Radius of the pie chart
r = 1

# Function to draw each pie slice based on percentage
angle(x) = x * 3.6
plot 'age_groups_data.txt' using (r*cos(sum [i=0:int($0-1)] angle(column(2,i)))):(r*sin(sum [i=0:int($0-1)] angle(column(2,i)))) with filledcurves closed lc rgb "blue"
