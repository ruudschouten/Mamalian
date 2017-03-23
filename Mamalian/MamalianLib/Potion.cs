using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MamalianLib {
    public class Potion : Item {
        public Stats Stats { get; set; }

        public Potion(int id, string name, string desc, int gold, Stats stats) {
            Id = id;
            Name = name;
            Description = desc;
            GoldValue = gold;
            Stats = stats;
        }

        public override string ToString() {
            return $"Name: {Name}\n" +
                   $"Description: {Description}\n" +
                   $"Gold Value: {GoldValue}\n" +
                   $"Stats________\n{Stats}\n";
        }
    }
}
