﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MamalianLib {
    public class Player : Character {
        private Gender gender;
        private Race race;

        public Class Class { get; set; }
        public int Gold { get; set; }
        public int Deaths { get; set; }
        public int HighestWave { get; set; }
        public List<Item> Inventory { get; set; } = new List<Item>();
        public Player() { }

        public Player(int id, string name, Gender gender, Race race, int gold, int deaths, int highestWave) {
            Id = id;
            Name = name;
            Gender = gender;
            Race = race;
            Gold = gold;
            Deaths = deaths;
            HighestWave = highestWave;
        }

        public Player(int id, string name, Stats stats, Class c, Gender g, Race r, int gold = 100, int deaths = 0, int highestWave = 0) {
            Id = id;
            Name = name;
            Stats = stats;
            Class = c;
            Gender = g;
            Race = r;
            Gold = gold;
            Deaths = deaths;
            HighestWave = highestWave;
            CurrentHealth = stats.Health;
        }

        public Player(string name, Gender gender, Race race, string className, int str, int dex, int intl) {
            Name = name;
            this.gender = gender;
            this.race = race;
            Gold = 50;
            Stats = new Stats(1, 0, 100,20,0.5f, 0.5f, str, dex, intl);
            if (className == "Warrior") {
                Class = new Class(className, 10, 5, 0, 0);
                Class.AssignSkills("Bash");
            }
            else {
                Class = new Class(className, 0, 0, 10, 5);
                Class.AssignSkills("Frozen Touch");
            }
            CurrentHealth = Stats.Health;
        }

        public override void Attack(Player p) {
            p.CurrentHealth -= CalculateDamage(Class.PhysDamage, Class.ElemDamage, p.Class.PhysReduction, p.Class.ElemReduction);
        }

        public override void Attack(Enemy e) {
            e.CurrentHealth -= CalculateDamage(Class.PhysDamage, Class.ElemDamage, e.PhysReduction, e.ElemReduction);
        }

        public void Attack(Enemy e, Weapon w) {
            e.CurrentHealth -= CalculateDamage(w.PhysDamage + Class.PhysDamage, w.ElemDamage + Class.ElemDamage, e.PhysReduction, e.ElemReduction);
        }

        public override string ToString() {
            return $"Name: {Name}\n" +
                   $"Stats________\n{Stats}\n" +
                   $"Class________\n{Class}\n" +
                   $"Gender: {Gender}\n" +
                   $"Race: {Race}\n" +
                   $"Gold: {Gold}\n" +
                   $"Deaths: {Deaths}\n" +
                   $"HighestWave: {HighestWave}";
        }
    }
}