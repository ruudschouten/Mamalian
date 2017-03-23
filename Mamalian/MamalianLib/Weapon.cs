using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MamalianLib {
    class Weapon : Item {
        public float AttackSpeed { get; set; }
        public int PhysDamage { get; set; }
        public int ElemDamage { get; set; }

        public Weapon(int id, string name, string desc, int gold, float speed, int phys, int elem) {
            Id = id;
            Name = name;
            Description = desc;
            GoldValue = gold;
            AttackSpeed = speed;
            PhysDamage = phys;
            ElemDamage = elem;
        }
    }
}
