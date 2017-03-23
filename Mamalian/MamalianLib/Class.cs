using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MamalianLib {
    class Class {
        public int Id { get; set; }
        public string Name { get; set; }
        public int PhysDamage { get; set; }
        public int PhysReduction { get; set; }
        public int ElemDamage { get; set; }
        public int ElemReduction { get; set; }
        public List<string> Skills { get; set; } = new List<string>();

        public Class(int id, string name, int physD = 0, int physR = 0, int elemD = 0, int elemR = 0) {
            Id = id;
            Name = name;
            PhysDamage = physD;
            PhysReduction = physR;
            ElemDamage = elemD;
            ElemReduction = elemR;
            if (PhysDamage + ElemDamage == 0) {
                throw new Exception("Class needs to have at least one point of damage!");
            }
        }

        public void AssignSkills(string skill) {
            Skills.Add(skill);
        }
    }
}
