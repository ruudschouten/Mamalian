﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MamalianDAL;
using MamalianDAL.Logic;
using MamalianDAL.Repo;
using MamalianLib;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace IntegrationUnitTests {
    [TestClass]
    public class StatsIntegrationtest {
        [TestMethod]
        public void StatsSelect() {
            StatsRepository repo = new StatsRepository(new StatsSQLContext());
            Stats s = repo.GetById(1);
            Assert.IsNotNull(s, "Stats wasn't correctly retrieved");
        }
        [TestMethod]
        public void MultiStatsSelect() {
            StatsRepository repo = new StatsRepository(new StatsSQLContext());
            List<Stats> s = repo.GetAll();
            Assert.IsNotNull(s, "Multiple stats weren't correctly retrieved");
        }

        [TestMethod]
        public void UpdateStats() {
            StatsRepository repo = new StatsRepository(new StatsSQLContext());
            Stats s = repo.GetById(2);
            s.Spirit += 10;
            int spirit = s.Spirit;
            repo.Update(s);
            s = repo.GetById(2);
            Assert.AreEqual(s.Spirit, spirit, "Stats weren't updated.");
            s.Spirit -= 10;
            repo.Update(s);
        }
    }
}
