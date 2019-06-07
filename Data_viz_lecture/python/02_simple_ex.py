import seaborn as sns
import matplotlib.pyplot as plt
import pandas as pd

sns.set()
simple_ex = pd.DataFrame({'A': [1980, 1990, 2000, 2010],
	'B': [1, 2, 3, 4],
	'C': [3, 2, 1, 2],
	'D': ["cold", "cold", "hot", "hot"]})

sns.relplot(x = "A", y = "B", data = simple_ex)

plt.show()
