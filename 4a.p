set terminal png size 800,600
set output 'gender_vs_heart_disease.png'
set title "Gender vs. Heart Disease"
set boxwidth 0.5
set style fill solid
set ylabel "Count"
set xlabel "Gender (0 = Female, 1 = Male)"
set style data histogram
set style histogram cluster gap 1
set key autotitle columnhead

# Define the data processing command separately
# Extract gender (column 2) and target (column 14)
# Group by gender and target, count occurrences
plot "< awk -F',' '$14==0 {count[$2]++} END {for (i in count) print i, count[i]}' heart.csv" using 2:xtic(1) title "No Heart Disease" lc rgb "blue", \
     "< awk -F',' '$14==1 {count[$2]++} END {for (i in count) print i, count[i]}' heart.csv" using 2:xtic(1) title "Heart Disease" lc rgb "orange"
