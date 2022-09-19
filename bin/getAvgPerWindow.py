#!/use/bin/env python

import sys
import pandas as pd

names = ['chr', 'start', 'end', 'pos', 'cov']
df = pd.read_csv(sys.argv[1], sep='\t', names=names)

window = 0
average = []
n = 1
coverage = 0
for i, row in df.iterrows():
	if row['start'] == window:
		coverage += row['cov']
		n += 1
	elif row['start'] > window:
		average.append(coverage / n)
		window += 10000
		n = 1
		coverage = 0
	else:
		raise Exception('Wrong calculation!')
	

for val in average:
	print(val)


