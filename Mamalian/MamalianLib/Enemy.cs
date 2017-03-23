using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MamalianLib {
    class Enemy : Character {
        public int PhysDamage { get; set; }
        public int ElemDamage { get; set; }
        public int PhysReduction { get; set; }
        public int ElemReduction { get; set; }

        public Enemy(int id, string name, Stats stats, Gender g, Race r, int physD = 0, int elemD = 0, int physR = 0, int elemR = 0) {
            Id = id;
            Name = name;
            Gender = g;
            Race = r;
            Stats = stats;
            PhysDamage = physD;
            PhysReduction = physR;
            ElemDamage = elemD;
            ElemReduction = elemR;
            if (PhysDamage + ElemDamage == 0) {
                throw new Exception("Enemy needs to deal damage");
            }
        }
    }
}
