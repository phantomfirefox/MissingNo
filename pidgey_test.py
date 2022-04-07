import math
import random
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

#pidgey test
#HP,Attack,Defense,Sp. Atk,Sp.Def,Speed
#40,45,40,35,35,56

name ='Pidgey'
base_hp = 40
base_attack = 45
base_defense = 40
base_sp_attack = 35
base_sp_defense = 35
base_speed = 56

stats_list = ['level', 'hp', 'attack', 'defense', 'sp_attack', 'sp_defense', 'speed']

EV = 0
Nature = 1
pidgey_list = []


def calculate_wild_stats(base_hp, base_attack, base_defense, base_sp_attack, base_sp_defense, base_speed, EV, Nature):

    #generate the random levels of an area
    Level = random.randint(2,100)

    #generate the IV possible which is 1 to 31 inclusive low, high
    IV = []
    for i in range(6):
        IV.append(random.randint(0, 31))

    #generate the stats using formulas
    HP = math.floor(0.01 * (2 * base_hp + IV[0] + math.floor(0.25 * EV)) * Level) + Level + 10

    attack = math.floor(math.floor((2 * base_attack + IV[1] + EV) * Level / 100 + 5) * Nature)

    defense = math.floor(math.floor((2 * base_defense + IV[2] + EV) * Level / 100 + 5) * Nature)

    sp_attack = math.floor(math.floor((2 * base_sp_attack + IV[3] + EV) * Level / 100 + 5)  * Nature)
    sp_defense = math.floor(math.floor((2 * base_sp_defense + IV[4] + EV) * Level / 100 + 5)  * Nature)
    speed = math.floor(math.floor((2 * base_speed + IV[5] + EV) * Level / 100 + 5)  * Nature)



    #return array of stats for pokemon with level
    return [Level, HP, attack, defense, sp_attack, sp_defense, speed]

for i in range(100):
    pidgey_list.append(calculate_wild_stats(base_hp, base_attack, base_defense, base_sp_attack, base_sp_defense, base_speed, EV, Nature))


df = pd.DataFrame(pidgey_list, columns=stats_list)
print(df)

fig, ax = plt.subplots()



ax.scatter(df.hp, df.level, color='b', label='HP')
ax.scatter(df.attack, df.level, color='r', label='attack')
ax.scatter(df.defense, df.level, color='y', label='defense')

ax.legend()
ax.grid(True)


ax.set_xlabel('Stat Amount')
ax.set_ylabel('Pokemon Level')
ax.set_title('Generated Pokemon Stats by Level')

plt.show()
