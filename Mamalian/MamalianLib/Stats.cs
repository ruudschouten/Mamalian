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
        public Stats(int level, int experience, int health, int spirit, int healthReg, int spiritReg, int str, int dex,
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
        public Stats(int health, int spirit, int healthReg, int spiritReg, int str, int dex, int intl) {
            Health = health;
            Spirit = spirit;
            HealthRegen = healthReg;
            SpiritRegen = spiritReg;
            Strength = str;
            Dexterity = dex;
            Intelligence = intl;
        }

        public override string ToString() {
            return $"Level: {Level}\n" +
                   $"Experience: {Experience}\n" +
                   $"Health: {Health}\n" +
                   $"Spirit: {Spirit}\n" +
                   $"HealthRegen: {HealthRegen}\n" +
                   $"SpiritRegen: {SpiritRegen}\n" +
                   $"Strength: {Strength}\n" +
                   $"Dexterity: {Dexterity}\n" +
                   $"Intelligence: {Intelligence}";
        }
    }
}