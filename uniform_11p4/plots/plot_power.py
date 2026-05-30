import pandas as pd
import matplotlib.pyplot as plt
from matplotlib.lines import Line2D
from matplotlib.patches import Patch


omega=1.2671090369478832
T=4.958677685950414

df = pd.read_csv('../forces01.dat' , sep='\s+')
tphys=df.iloc[:,0]
rpm=tphys/T
fx=df.iloc[:,1]
mtx=df.iloc[:,7]
p=omega*mtx

df2 = pd.read_csv('../forces02.dat' , sep='\s+')
tphys2=df2.iloc[:,0]
rpm2=tphys2/T
fx2=df2.iloc[:,1]
mtx2=df2.iloc[:,7]
p2=omega*mtx2

df3 = pd.read_csv('../forces03.dat' , sep='\s+')
tphys3=df3.iloc[:,0]
rpm3=tphys3/T
fx3=df3.iloc[:,1]
mtx3=df3.iloc[:,7]
p3=omega*mtx3


fig, ax1 = plt.subplots(figsize=(13,5))



ax1.plot(rpm,fx, color='tab:blue', label='Fx1')
ax1.set_xlabel("Revolution")
ax1.set_ylabel("Fx [N]")

ax1.plot(rpm2,fx2, color='tab:orange',label='Fx2')
ax1.plot(rpm3[:13],fx3[:13], color='tab:green',label='Fx3')

ax2=ax1.twinx()
ax2.plot(rpm,p, color='tab:red',label='p1')
ax2.set_ylabel("P [W]")

ax2.plot(rpm2,p2, color='tab:purple',label='p2')
ax2.plot(rpm3[:13],omega*mtx3[:13], color='tab:brown',label='p3')

#lns=lns1+lns2+lns3+lns4

#labs = [l.get_label() for l in lns]

# Example arrays for your legend
colors = ['blue', 'red']
labels = ['Fx', 'P']

# 1. Create a list of legend handles (icons) from your array
legend_elements = [
            Patch(facecolor=c, label=l) for c, l in zip(colors, labels)
            ]



#ax2.legend(lns, labs, loc='upper left')
ax1.legend(bbox_to_anchor=(1.13,1),handles=legend_elements,loc='upper right')
#ax1.legend()
#ax2.legend()
plt.savefig('thrust.png')
plt.show()



