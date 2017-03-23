using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MamalianLib {
    public class Stats {
        public int Id { get; set; }
        public int Level { get; set; }
        public int Experience { get; set; }
        public int Health { get; set; }
        public int Spirit { get; set; }
        public float HealthRegen { get; set; }
        public float SpiritRegen { get; set; }
        public int Strength { get; set; }
        public int Dexterity { get; set; }
        public int Intelligence { get; set; }

        /// <summary>
        /// Stats for player and enemies
        /// </summary>
        public Stats(int level, int experience, int health, int spirit, float healthReg, float spiritReg, int str,
            int dex,
            int intl) {
            Level = level;
            Experience = experience;
            Health = health;
            Spirit = spirit;
            HealthRegen = healthReg;
            SpiritRegen = spiritReg;
            Strength = str;
            Dexterity = dex;
            Intelligence = intl;
        }

        /// <summary>
        /// Stats for Potions and Boosts
        /// </summary>
        public Stats(int health, int spirit, float healthReg, float spiritReg, int str, int dex, int intl) {
            Health = health;
            Spirit = spirit;
            HealthRegen = healthReg;
            SpiritRegen = spiritReg;
            Strength = str;
            Dexterity = dex;
            Intelligence = intl;
        }

        public override string ToString() {
            string s = "";
            if (Level != 0) s += $"Level: {Level}\n";
            if (Experience != 0) s += $"Experience: {Experience}\n";
            if (Health != 0) s += $"Health: {Health}\n";
            if (Spirit != 0) s += $"Spirit: {Spirit}\n";
            if (HealthRegen != 0) s += $"HealthRegen: {HealthRegen}\n";
            if (SpiritRegen != 0) s += $"SpiritRegen: {SpiritRegen}\n";
            if (Strength != 0) s += $"Strength: {Strength}\n";
            if (Dexterity != 0) s += $"Dexterity: {Dexterity}\n";
            if (Intelligence != 0) s += $"Intelligence: {Intelligence}";
            if (s.EndsWith("\n")) s = s.Remove(s.Length - 3);
            return s;
        }
    }
}