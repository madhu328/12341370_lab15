#!/bin/bash

# Check if the input CSV file exists
input_file="heart.csv"
if [ ! -f "$input_file" ]; then
    echo "Error: $input_file not found!"
    exit 1
fi

# Define output LaTeX file
output_tex="heart_table.tex"
output_pdf="heart_table.pdf"

# Create the LaTeX document
cat <<EOT > $output_tex
\documentclass{article}
\usepackage{geometry}
\usepackage{longtable}
\geometry{a4paper, margin=1in}
\begin{document}

\title{Heart Data Table}
\author{}
\date{}
\maketitle

\begin{longtable}{|c|c|c|c|c|c|c|c|c|c|c|c|c|c|}
\hline
Age & Sex & CP & Trestbps & Chol & Fbs & Restecg & Thalach & Exang & Oldpeak & Slope & CA & Thal & Target \\
\hline
\endfirsthead
\hline
Age & Sex & CP & Trestbps & Chol & Fbs & Restecg & Thalach & Exang & Oldpeak & Slope & CA & Thal & Target \\
\hline
\endhead
EOT

# Add CSV data to the LaTeX table
tail -n +2 "$input_file" | while IFS=, read -r age sex cp trestbps chol fbs restecg thalach exang oldpeak slope ca thal target
do
    echo "$age & $sex & $cp & $trestbps & $chol & $fbs & $restecg & $thalach & $exang & $oldpeak & $slope & $ca & $thal & $target \\\\" >> $output_tex
    echo "\hline" >> $output_tex
done

# Complete the LaTeX document
echo "\end{longtable}" >> $output_tex
echo "\end{document}" >> $output_tex

# Compile LaTeX to PDF
pdflatex $output_tex

# Clean up intermediate files
rm heart_table.aux heart_table.log

echo "PDF generated as $output_pdf"
