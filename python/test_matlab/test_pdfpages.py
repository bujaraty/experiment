import numpy as np
import matplotlib.pyplot as plt
from pylab import *
from matplotlib.backends.backend_pdf import PdfPages
pp = PdfPages('multipage.pdf')


n_groups = 5

means_men = (20, 35, 30, 35, 27)
std_men = (2, 3, 4, 1, 2)

means_women = (25, 32, 34, 20, 25)
std_women = (3, 5, 2, 3, 3)

fig, ax = plt.subplots()

index = np.arange(n_groups)
bar_width = 0.35

opacity = 0.4
error_config = {'ecolor': '0.3'}

rects1 = plt.bar(index, means_men, bar_width,
                 alpha=opacity,
                 color='b',
                 yerr=std_men,
                 error_kw=error_config,
                 label='Men')

rects2 = plt.bar(index + bar_width, means_women, bar_width,
                 alpha=opacity,
                 color='r',
                 yerr=std_women,
                 error_kw=error_config,
                 label='Women')

plt.xlabel('Group')
plt.ylabel('Scores')
plt.title('Scores by group and gender')
plt.xticks(index + bar_width, ('A', 'B', 'C', 'D', 'E'))
plt.legend()

plt.tight_layout()
plt.savefig('out.eps')
plt.savefig(pp, format='pdf')

import itertools

import numpy as np
import matplotlib.lines as mlines
import matplotlib.pyplot as plt

colors = itertools.cycle(['b', 'g', 'r', 'c', 'm', 'y', 'k'])
altcolor = 'lightgreen'

plt.rcParams['text.usetex'] = False # otherwise, '^' will cause trouble

y = np.arange(10)
for marker in mlines.Line2D.filled_markers:
    f = plt.figure()
    f.text(.5,.95, "marker = %r" % marker, ha='center')
    for i,fs in enumerate(mlines.Line2D.fillStyles):
        color = colors.next()

        ax = f.add_subplot(121)
        ax.plot(2*(4-i)+y, c=color,
                       marker=marker,
                       markersize=20, 
                       fillstyle=fs, 
                       label=fs)
        ax.legend(loc=2)
        ax.set_title('fillstyle')

        ax = f.add_subplot(122)
        ax.plot(2*(4-i)+y, c=color,
                       marker=marker,
                       markersize=20,
                       markerfacecoloralt=altcolor,
                       fillstyle=fs,
                       label=fs)
        ax.legend(loc=2)
        ax.set_title('fillstyle')
    plt.savefig(pp, format='pdf')

pp.close()
