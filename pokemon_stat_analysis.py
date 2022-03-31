import pandas as pd
import matplotlib.pyplot as plt
import numpy as np

df = pd.read_csv('pokemon_kanto.csv')

df = df.groupby('Type 1').agg('count')['Name']

print(df)
