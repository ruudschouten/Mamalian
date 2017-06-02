using System;
using System.Collections.Generic;
using MamalianDAL;
using MamalianDAL.Logic;
using MamalianDAL.Repo;
using MamalianLib;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace IntegrationUnitTests {
    [TestClass]
    public class PowerUpUnitTest {
        [TestMethod]
        public void PowerUpSelect() {
            PowerUpRepository repo = new PowerUpRepository(new PowerUpSQLContext());
            PowerUp c = repo.GetById(1);
            Assert.IsNotNull(c, "PowerUp wasn't correctly retrieved");
        }
        [TestMethod]
        public void PowerUpsSelect() {
            PowerUpRepository repo = new PowerUpRepository(new PowerUpSQLContext());
            List<PowerUp> c = repo.GetAll();
            Assert.IsNotNull(c, "PowerUps weren't correctly retrieved");
        }

        [TestMethod]
        public void UpdatePowerUp() {
            PowerUpRepository repo = new PowerUpRepository(new PowerUpSQLContext());
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
