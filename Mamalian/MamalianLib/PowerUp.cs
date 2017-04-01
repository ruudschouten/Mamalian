using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MamalianLib {
    public class PowerUp {

        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public int Duration { get; set; }
        public Stats StatBoost { get; set; }

        public PowerUp() { }
        public PowerUp(int id, string name, string desc, int duration, Stats stats) {
            Id = id;
            Name = name;
            Description = desc;
            Duration = duration;
            StatBoost = stats;
        }

        public PowerUp(int id, string name, string desc, int duration) {
            Id = id;
            Name = name;
            Description = desc;
            Duration = duration;
        }

        public void AssignStats(Stats s) {
            StatBoost = s;
        }

        public override string ToString() {
            return $"Name: {Name}\n" +
                   $"Description: {Description}\n" +
                   $"StatBoost________\n{StatBoost}";
        }
    }
}
