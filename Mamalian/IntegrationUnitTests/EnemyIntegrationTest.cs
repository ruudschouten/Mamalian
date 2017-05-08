using System;
using System.Collections.Generic;
using MamalianDAL;
using MamalianDAL.Contexts;
using MamalianLib;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace IntegrationUnitTests {
    [TestClass]
    public class EnemyIntegrationTest {
        [TestMethod]
        public void EnemySelect() {
            Repository<Enemy> repo = new Repository<Enemy>(new EnemySQLContext());
            Enemy e = repo.GetById(1);
            Assert.IsNotNull(e, "Enemy wasn't correctly retrieved");
        }
        [TestMethod]
        public void EnemysSelect() {
            Repository<Enemy> repo = new Repository<Enemy>(new EnemySQLContext());
            List<Enemy> e = repo.GetAll();
            Assert.IsNotNull(e, "Enemies weren't correctly retrieved");
        }

        [TestMethod]
        public void UpdateEnemy() {
            Repository<Enemy> repo = new Repository<Enemy>(new EnemySQLContext());
            Enemy e = repo.GetById(2);
            e.Stats.Spirit += 10;
            int spirit = e.Stats.Spirit;
            repo.Update(e);
            e = repo.GetById(2);
            Assert.AreEqual(e.Stats.Spirit, spirit, "Stats weren't updated.");
            e.Stats.Spirit -= 10;
            repo.Update(e);
        }
    }
}
