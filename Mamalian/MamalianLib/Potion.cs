using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MamalianLib {
    class Potion : Item {
        public Stats Stats { get; set; }

        public Potion(int id, string name, string desc, int gold, Stats stats) {
            Id = id;
            Name = name;
            Description = desc;
            GoldValue = gold;
            Stats = stats;
        }
    }
}
