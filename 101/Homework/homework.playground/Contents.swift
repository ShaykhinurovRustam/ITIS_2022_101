
/*
 Должны быть персонажи разных классов, которые заранее генерируются (можно с помощью Random, можно руками). У Персонажей как минимум должен быть уровень жизни (HP), может быть уровень маны (MP), какие-то способности. Одной из способностей одного из персонажей должна быть способность, которая отражает способность противника.
 
 Должны быть разные монстры, тоже с уровнями HP, MP и способностями.
 
Персонажи в ходе игры автоматически должны (действия происходят в каком вам угодно)
     идти (куда-то, не важно, вперёд);
     что-то находить (полезное или не очень);
     сражаться с рандомными группами монстров (пока монстры или герои не погибнут);
 
 Постарайтесь побольше использовать разных типов, class, struct, enum, protocol
 Выводите логи игры в консоль с помощью print()
 Если герои живут слишком долго, пусть игра заканчивается на 100-м ходу.
 
 */

protocol Walker {
    func walk()
}

protocol Miner {
    func mine(fossils: [Fossils])
}

protocol Wizard {
    func spell(for creature: Creature)
}

protocol Healer {
    func heal(for creature: Creature)
}

struct Fossils {
    var name: String
    var boost: Int
}


class Creature: Equatable {
    static func == (lhs: Creature, rhs: Creature) -> Bool {
        return lhs.name == rhs.name && lhs.hp == rhs.hp
    }
    
    var name: String
    var hp: Int
    var mp: Int
    var damage: Int
    var level: Int
    var damageBoost: Int = 0
    var weapon: Fossils?
    
    init(name: String, hp: Int, mp: Int, damage: Int) {
        self.name = name
        self.hp = hp
        self.mp = mp
        self.damage = damage
        self.level = 1
    }
    
    func attack(with other: Creature) -> Bool {
        if other.hp - ((self.damage + damageBoost) + self.mp) > 0 {
            other.hp -= (self.damage + damageBoost) + self.mp
            print("\(self.name) attacked \(other.name) : \(other.hp) hp left. MP left: \(self.mp)")
        } else {
            other.hp = 0
            print("\(self.name) killed \(other.name)")
        }
        
        if other.hp <= 0 {
            return true
        } else {
            return false
        }
    }
    
    func setWeapon(weapon: Fossils) {
        self.weapon = weapon
        self.damageBoost = weapon.boost
    }
    
}

class Human : Creature, Walker, Miner {
    
    static var population = 0
    
    override init(name: String, hp: Int, mp: Int, damage: Int) {
        super.init(name: name, hp: hp, mp: mp, damage: damage)
        Human.population += 1
    }
    
    func walk() {
        print("\(self.name) goes for a walk")
    }
    
    func mine(fossils: [Fossils]) {
        let element = fossils.randomElement()!
        if element.name == "Weapon" {
            self.setWeapon(weapon: element)
        } else if element.name == "Heart" {
            self.hp += element.boost
        }
        print("\(self.name) found \(element.name). Boost: \(element.boost).")
    }
    
}


class Dwarf: Creature, Walker, Wizard {
    
    func spell(for creature: Creature) {
        if String(describing: type(of: creature)) == "Human" {
            print("Dwart can't spell to Human")
        } else {
            self.mp -= 10
            attack(with: creature)
        }
    }
    
    func walk() {
        print("\(self.name) goes for a walk")
    }
    
    func upgrade(for creature: Creature) {
        creature.level += 1
        print("\(self.name) upgraded \(creature.name) to level: \(creature.level)")
    }
    
}

class Elf: Creature, Walker, Wizard, Healer {
    
    func heal(for creature: Creature) {
        creature.hp += 150
        creature.mp += 200
        print("\(self.name) healed \(creature.name) to hp: \(creature.hp), to mp: \(creature.mp)")
    }
    
    func spell(for creature: Creature) {
        if String(describing: type(of: creature)) == "Dwarf" {
            print("Elf can't spell to Dwarf")
        } else {
            self.mp -= 50
            attack(with: creature)
        }
    }
    
    func walk() {
        print("\(self.name) goes for a walk")
    }
    
}


var names = ["Finrod", "Gimli", "Aragorn", "Goliaf", "Kenku", "Orc"]
var items: [Fossils] = [Fossils(name: "Weapon", boost: 10000), Fossils(name: "Heart", boost: 150), Fossils(name: "Nothing", boost: 0)]
var friends = [Creature]()
var humans = [Human]()
var move = 0


for _ in 0..<100 {
    friends.append(Elf(name: names.randomElement()!, hp: 10000, mp: 2000, damage: 4000))
    friends.append(Dwarf(name: names.randomElement()!, hp: 12000, mp: 1000, damage: 3500))
}

for _ in 0..<300 {
    humans.append(Human(name: names.randomElement()!, hp: 5000, mp: 200, damage: 1500))
}

print("\(friends.count) creatures was born! \(Human.population) humans was born!")
print("----------------------")

print("Humans preparing for an attack!")
for human in humans {
    human.walk()
    human.mine(fossils: items)
}
print("----------------------")

print("Creatures preparing for an attack!")
for friend in friends {
    if String(describing: type(of: friend)) == "Dwarf" {
        let dwarf = friend as! Dwarf
        dwarf.upgrade(for: friends.randomElement()!)
    }
}
print("----------------------")

print("Battle!")
while move != 200 {
    move += 1
    
    let human = humans.randomElement()!
    let creature = friends.randomElement()!
    
    let creatureAttack = creature.attack(with: human)
    let humanAttack = human.attack(with: creature)
    
    if creatureAttack {
        if let index = humans.firstIndex(of: human) {
            humans.remove(at: index)
        }
    }
    
    if humanAttack {
        if let index = friends.firstIndex(of: creature) {
            friends.remove(at: index)
        }
    }
    
}

if (200 - friends.count > 300 - humans.count) {
    print("\(friends.count) - \(humans.count) | Creatures won")
} else {
    print("\(friends.count) - \(humans.count) | Humans won")
}
