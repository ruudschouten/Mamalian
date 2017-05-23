using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Xml;
using MamalianLib;

namespace MamalianASP.Models.API {
    public class PlayerModel {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Class { get; set; }
        public string Race { get; set; }
        public string Gender { get; set; }
        public int Gold { get; set; }
        public int Deaths { get; set; }
        public int HighestWave { get; set; }

        //public PlayerModel(Player p) {
        //    Id = p.Id;
        //    Name = p.Name;
        //    Class = p.Class.Name;
        //    Race = p.Race.ToString();
        //    Gender = p.Gender.ToString();
        //    Gold = p.Gold;
        //    Deaths = p.Deaths;
        //    HighestWave = p.HighestWave;
        //}
    }
}