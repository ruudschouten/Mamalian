using System;
using System.Collections.Generic;
using MamalianDAL;
using MamalianDAL.Logic;
using MamalianDAL.Repo;
using MamalianLib;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace IntegrationUnitTests {
    [TestClass]
    public class PlayerIntegrationTest {
        [TestMethod]
        public void PlayerSelect() {
            PlayerRepository repo = new PlayerRepository(new PlayerSQLContext());
            Player p = repo.GetById(1);
            Assert.IsNotNull(p, "Player wasn't correctly retrieved");
        }
        [TestMethod]
        public void PlayersSelect() {
            PlayerRepository repo = new PlayerRepository(new PlayerSQLContext());
            List<Player> p = repo.GetAll();
            Assert.IsNotNull(p, "Players weren't correctly retrieved");
        }

        [TestMethod]
        public void UpdatePlayer() {
            PlayerRepository repo = new PlayerRepository(new PlayerSQLContext());
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