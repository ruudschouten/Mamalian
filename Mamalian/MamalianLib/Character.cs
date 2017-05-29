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
        public int CurrentHealth { get; set; }

        public abstract void Attack(Player p);
        public abstract void Attack(Enemy e);

        public int CalculateDamage(int physD, int elemD, int physR, int elemR) {
            int phys = 0, elem = 0;
            if(physD != 0) phys = physD - physR;
            if(elemD != 0) elem = elemD - elemR;
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
