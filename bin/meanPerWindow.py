#!/usr/bin/env python

import sys
import weighslide

#total = 2484959501
#chrom = 'NC_033692.1'
#step = round(total/10000)
window = 10000

#start_ls, end_ls, step_ls = [], [], []
#with open(sys.argv[1]) as f1:
#	for line in f1:
#		line = line.strip().split()
#		if line.startswith('chrom'):
#			continue
#		else:
#			start_ls.append(line[1])
#			end_ls.append(line[2])
#			step_ls.append(line[2] - line[1] + 1)
#

ratio_ls = []
with open(sys.argv[1], 'r') as f2:
	for line in f2:
		line = line.strip()
		if line.startswith('mCoord'):
			continue
		else:
			ratio_ls.append(line)

weighslide.run_weighslide(ratio_ls, window, "mean")


"""
			f = open('pos-ratio.txt', 'w')
			f.write('chrom\tstart\tend\tratio\n')
			
			
			p_step = 0
			for i in range(step):
				if i == 0:
					start = 1
					end = step
					p_step = step+1
				elif i == step-1:
					start = p_step
					end = total
				else:
					start = p_step
					end = step + (p_step-1)
					p_step = end+1
				f.write('%s\t%d\t%d\t%.6f\n' % (chrom, start, end, ratio))
		f.close()
"""	
	
	
