using System;
using System.Collections.Generic;
using MamalianDAL;
using MamalianDAL.Contexts;
using MamalianLib;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace TeamUnitTest {
    [TestClass]
    public class PowerUpUnitTest {
        [TestMethod]
        public void PowerUpSelect() {
            Repository<PowerUp> repo = new Repository<PowerUp>(new PowerUpSQLContext());
            PowerUp c = repo.GetById(1);
            Assert.IsNotNull(c, "PowerUp wasn't correctly retrieved");
        }
        [TestMethod]
        public void PowerUpsSelect() {
            Repository<PowerUp> repo = new Repository<PowerUp>(new PowerUpSQLContext());
            List<PowerUp> c = repo.GetAll();
            Assert.IsNotNull(c, "PowerUps weren't correctly retrieved");
        }

        [TestMethod]
        public void UpdatePowerUp() {
            Repository<PowerUp> repo = new Repository<PowerUp>(new PowerUpSQLContext());
            PowerUp powerUp = repo.GetById(1);
            powerUp.Duration += 20;
            int damage = powerUp.Duration;
            repo.Update(powerUp);
            powerUp = repo.GetById(1);
            Assert.AreEqual(powerUp.Duration, damage, "PowerUp wasn't updated.");
            powerUp.Duration -= 20;
            repo.Update(powerUp);
        }
    }
}
