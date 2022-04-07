import math
import random

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

EV = 0
Nature = 1
pidgey_list = []


def calculate_wild_stats(base_hp, base_attack, base_defense, base_sp_attack, base_sp_defense, base_speed, EV, Nature):

    #generate the random levels of an area
    Level = random.randint(2,50)

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


    print(IV)
    #return array of stats for pokemon with level
    return [Level, HP, attack, defense, sp_attack, sp_defense, speed]


#for i in range(1):
pidgey_list.append(calculate_wild_stats(base_hp, base_attack, base_defense, base_sp_attack, base_sp_defense, base_speed, EV, Nature))


print(pidgey_list)
