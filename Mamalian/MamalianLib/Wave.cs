using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MamalianLib {
    class Wave {
        public int Id { get; set; }
        public float StatMultiplier { get; set; }
        public int MaxMonsters { get; set; }
        public List<PowerUp> PowerUps { get; set; } = new List<PowerUp>();
        public List<Enemy> Enemies { get; set; } = new List<Enemy>();

        public Wave(int id, float statMod, int maxMon, List<Enemy> enemies) {
            Id = id;
            StatMultiplier = statMod;
            MaxMonsters = maxMon;
            Enemies = enemies;
        }
    }
}
