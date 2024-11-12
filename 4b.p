set terminal png size 800,600
set output 'age_vs_blood_pressure.png'
set datafile separator ","
set title "Age vs. Blood Pressure"
set xlabel "Age"
set ylabel "Blood Pressure (trestbps)"
set style data points
plot "heart.csv" using 1:4 with points title "Age vs Blood Pressure"
