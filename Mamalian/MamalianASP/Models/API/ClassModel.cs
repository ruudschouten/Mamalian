using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MamalianASP.Models.API {
    public class ClassModel {
        public int Id { get; set; }
        public string Name { get; set; }
        public int PhysicalDamage { get; set; }
        public int PhysicalReduction { get; set; }
        public int ElementalDamage { get; set; }
        public int ElementalReduction { get; set; }

        public ClassModel(MamalianLib.Class c) {
            Id = c.Id;
            Name = c.Name;
            PhysicalDamage = c.PhysDamage;
            PhysicalReduction = c.PhysReduction;
            ElementalDamage = c.ElemDamage;
            ElementalReduction = c.ElemReduction;
        }
    }
}