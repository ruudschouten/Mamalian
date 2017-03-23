using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MamalianLib {
    class Armour : Item {
        public int PhysReduction { get; set; }
        public int ElemReduction { get; set; }

        public Armour(int id, string name, string desc, int gold, int phys, int elem) {
            Id = id;
            Name = name;
            Description = desc;
            GoldValue = gold;
            PhysReduction = phys;
            ElemReduction = elem;
        }
    }
}
