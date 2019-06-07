import pandas as pd
import numpy as np

s = pd.Series(np.arange(5), index = list("abcde"))
ax = s.plot()
