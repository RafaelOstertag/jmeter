#!/usr/bin/env python3

import random
import csv

random_ints = [random.randrange(1,10_000_000) for x in range(1_000_000)]
random_strings = ["String " + str(random_ints[x]) for x in range(1_000_000)]
data = zip(random_ints, random_strings)

with open('data-tableA.csv', 'w', newline='') as csvfile:
    datawriter = csv.writer(csvfile, delimiter=',')
    
    datawriter.writerow(("valueA", "valueB"))

    for row in data:
        datawriter.writerow(row)
    
