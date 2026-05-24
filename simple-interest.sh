#!/usr/bin/env bash

# Simple Interest Calculator
# Prompts for principal, annual interest rate, and time period in years.

set -euo pipefail

read -rp "Enter the principal amount: " principal
read -rp "Enter the annual interest rate (percent): " rate
read -rp "Enter the time period (years): " time

# Convert input values to valid numbers
principal=$(printf "%s" "$principal" | tr -d ',')
rate=$(printf "%s" "$rate" | tr -d ',')
time=$(printf "%s" "$time" | tr -d ',')

# Calculate simple interest and total amount.
# Use bc for decimal arithmetic.
simple_interest=$(printf "scale=2; %s * %s / 100 * %s\n" "$principal" "$rate" "$time" | bc -l)
total_amount=$(printf "scale=2; %s + %s\n" "$principal" "$simple_interest" | bc -l)

printf "\nSimple Interest: %s\n" "$simple_interest"
printf "Total Amount after %s years: %s\n" "$time" "$total_amount"
