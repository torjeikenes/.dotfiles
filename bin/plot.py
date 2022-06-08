#!/usr/bin/env python3
import csv
import matplotlib.pyplot as plt
import numpy as np
import sys, getopt
import argparse
import os

parser = argparse.ArgumentParser()

parser.add_argument("--input", "-i", help="Set input .csv file")
parser.add_argument("--output", "-o", help="set output file. Works with .png or .pdf")

args = parser.parse_args()


header = []
data = []


filename = "data.csv"

if args.input:
    filename = args.input

with open(filename) as csvfile:
    csvreader = csv.reader(csvfile)

    header = next(csvreader)

    for datapoint in csvreader:

        values = [float(value) for value in datapoint]
        data.append(values)

print(header)
print(data[0])
print(data[1])

time = [p[0]*1000+5 for p in data]
ch1 = [p[1] for p in data]
ch2 = [p[2] for p in data]

plt.figure(figsize=(8,4))
plt.plot(time,ch1, label=r'$r(t)$')
plt.plot(time,ch2, label=r'$b(t)$')
plt.xlabel('Time [$ms$]')
plt.ylabel('Voltage [V]')
frequency = 100
plt.yticks(np.arange(-1, 6, 1.0))

plt.axhline(y=0, color="black")

#fig, axes = plt.subplots(5, 5, figsize=(12, 10))

if args.output:
    filename = args.output

output = os.path.splitext(filename)[0] + ".png"

plt.legend(loc='upper right')
plt.savefig(output, bbox_inches='tight',dpi=199)
plt.show()

