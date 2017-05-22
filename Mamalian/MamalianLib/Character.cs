using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MamalianLib {
    public enum Gender {
        Male,
        Female
    }

    public enum Race {
        Cat,
        Dog,
        Fish,
        Bird,
        Horse
    }

    public abstract class Character {
        public int Id { get; set; }
        public String Name { get; set; }
        public Gender Gender { get; set; }
        public Race Race { get; set; }
        public Stats Stats { get; set; }

        public abstract void Attack(Player p);
        public abstract void Attack(Enemy e);

        public int CalculateDamage(int physD, int elemD, int physR, int elemR) {
            var phys = physD - physR;
            var elem = elemD - elemR;
            var total = phys + elem;
            if (total < 1) {
                return 0;
            }
            return total;
        }

        public bool IsDead() {
            if (Stats.Health < 1) {
                return true;
            }
            return false;
        }
    }
}
