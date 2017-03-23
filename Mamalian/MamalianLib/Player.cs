﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MamalianLib {
    class Player : Character {
        public Class Class { get; set; }
        public int Gold { get; set; }
        public int Deaths { get; set; }
        public int HighestWave { get; set; }
        public List<Item> Inventory { get; set; } = new List<Item>();

        public Player(int id, string name, Stats stats, Class c, Gender g, Race r, int gold = 100, int deaths = 0, int highestWave = 0) {
            Id = id;
            Name = name;
            Stats = stats;
            Class = c;
            Gender = g;
            Race = r;
            Gold = gold;
            Deaths = deaths;
            HighestWave = highestWave;
        }
    }
}