using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MamalianLib {
    public class Enemy : Character {
        public int PhysDamage { get; set; }
        public int ElemDamage { get; set; }
        public int PhysReduction { get; set; }
        public int ElemReduction { get; set; }

        public Enemy(int id, string name, Gender g, Race r, int physD, int elemD, int physR, int elemR) {
            Id = id;
            Name = name;
            Gender = g;
            Race = r;
            PhysDamage = physD;
            PhysReduction = physR;
            ElemDamage = elemD;
            ElemReduction = elemR;
        }

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

        public Enemy() {
        }

        public override void Attack(Player p) {
            p.Stats.Health -= CalculateDamage(PhysDamage, ElemDamage, p.Class.PhysReduction, p.Class.ElemReduction);
        }

        public override void Attack(Enemy e) {
            e.Stats.Health -= CalculateDamage(PhysDamage, ElemDamage, e.PhysReduction, e.ElemReduction);
        }

        public override string ToString() {
            return $"Name: {Name}\n" +
                   $"Stats________\n{Stats}\n" +
                   $"Gender: {Gender}\n" +
                   $"Race: {Race}\n" +
                   $"PhysDamage: {PhysDamage}\n" +
                   $"ElemDamage: {ElemDamage}\n" +
                   $"PhysReduction: {PhysReduction}\n" +
                   $"ElemReduction: {ElemReduction}";
        }
    }
}
