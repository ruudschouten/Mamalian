using System;
using System.Collections.Generic;
using MamalianDAL;
using MamalianDAL.Contexts;
using MamalianLib;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace TeamUnitTest {
    [TestClass]
    public class PlayerIntegrationTest {
        [TestMethod]
        public void PlayerSelect() {
            Repository<Player> repo = new Repository<Player>(new PlayerSQLContext());
            Player p = repo.GetById(1);
            Assert.IsNotNull(p, "Player wasn't correctly retrieved");
        }
        [TestMethod]
        public void PlayersSelect() {
            Repository<Player> repo = new Repository<Player>(new PlayerSQLContext());
            List<Player> p = repo.GetAll();
            Assert.IsNotNull(p, "Players weren't correctly retrieved");
        }

        [TestMethod]
        public void UpdatePlayer() {
            Repository<Player> repo = new Repository<Player>(new PlayerSQLContext());
            Player p = repo.GetById(2);
            p.Stats.Spirit += 10;
            int spirit = p.Stats.Spirit;
            repo.Update(p);
            p = repo.GetById(2);
            Assert.AreEqual(p.Stats.Spirit, spirit, "Stats weren't updated.");
            p.Stats.Spirit -= 10;
            repo.Update(p);
        }
    }
}