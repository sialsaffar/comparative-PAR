#!/usr/bin/env python

import pandas as pd
import sys


in_f1 = sys.argv[1]

in_df1 = pd.read_csv(in_f1, sep = '\t', index_col=False, usecols=[2], names=['pi'])
#in_df1 = in_df1[in_df1['avgCov'] < 200]
in_df1['pos'] = in_df1.index

x1, y1 = [], []

for i, row in in_df1.iterrows():
    #x = row['start_site'] + (row['end_site'] - row['start_site'])/2
    x = row['pos']    
    y = row['pi']
    x1.append(x)
    y1.append(y)

import plotly.graph_objects as go

fig = go.Figure()

fig.add_trace(go.Scatter(x = x1, y = y1, mode = 'lines+markers', name = 'female') )

fig.update_layout(
    title='Title',
    xaxis_title="x-axis",
    yaxis_title="y-axis",
    width=1500
)

fig.write_image(sys.argv[2], width=1500, height=900)
#fig.show()

