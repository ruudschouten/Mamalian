using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MamalianDAL;
using MamalianDAL.Logic;
using MamalianDAL.Repo;
using MamalianLib;

namespace MamalianASP.Models {
    public class CharacterPlayModel {
        public int PlayerId { get; set; }
        public Player Player { get; set; }
        public Wave FirstWave => new WaveRepository(new WaveSQLContext()).GetById(1);
    }
}