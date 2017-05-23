using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MamalianLib;

namespace MamalianASP.Models.API {
    public class StatsModel {
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

        public StatsModel(Stats s) {
            Level = s.Level;
            Experience = s.Experience;
            Health = s.Health;
            Spirit = s.Spirit;
            HealthRegen = s.HealthRegen;
            SpiritRegen = s.SpiritRegen;
            Strength = s.Strength;
            Dexterity = s.Dexterity;
            Intelligence = s.Intelligence;
        }
    }
}