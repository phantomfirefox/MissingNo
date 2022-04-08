import math
import random
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

#pidgey test
#HP,Attack,Defense,Sp. Atk,Sp.Def,Speed
#40,45,40,35,35,56

kanto_pokemon = pd.read_csv('pokemon_kanto.csv', index_col=0)

pokemon_list = []

stats_list = ['level', 'hp', 'attack', 'defense', 'sp_attack', 'sp_defense', 'speed']

EV = 0
Nature = 1

name = 0
base_hp = 0
base_attack = 0
base_defense = 0
base_sp_attack = 0
base_sp_defense = 0
base_speed = 0

def calculate_wild_stats(EV, Nature):

    #generate stats based on pokemon pandas table for random pokemon_list
    x = random.randint(1, 151)

    #assign values to calulations for base stats
    name = kanto_pokemon.loc[x]['Name']
    base_hp = kanto_pokemon.loc[x]['HP']
    base_attack = kanto_pokemon.loc[x]['Attack']
    base_defense = kanto_pokemon.loc[x]['Defense']
    base_sp_attack = kanto_pokemon.loc[x]['Sp.Atk']
    base_sp_defense = kanto_pokemon.loc[x]['Sp.Def']
    base_speed = kanto_pokemon.loc[x]['Speed']

    #generate the random levels of an area
    Level = random.randint(1,50)

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

for i in range(10000):

    pokemon_list.append(calculate_wild_stats(EV, Nature))



df = pd.DataFrame(pokemon_list, columns=stats_list)

print(df.std(ddof=0))

fig, ax = plt.subplots()

ax.scatter(df.hp, df.level, color='b', label='HP')
#ax.scatter(df.attack, df.level, color='r', label='attack')
#ax.scatter(df.defense, df.level, color='y', label='defense')
#ax.scatter(df.sp_attack, df.level, color='purple', label='sp. attack')
#ax.scatter(df.sp_defense, df.level, color='orange', label='sp. defense')
#ax.scatter(df.speed, df.level, color='pink', label='speed')

ax.legend()
ax.grid(True)


ax.set_xlabel('Stat Amount')
ax.set_ylabel('Pokemon Level')
ax.set_title('Generated Pokemon Stats by Level')

plt.show()
