using System;
using MamalianLib;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace MamalianUnitTest {
    [TestClass]
    public class StatsUnitTest {
        [TestMethod]
        public void CreationTest() {
            Stats s = new Stats(1, 0, 50, 50, 0.5f, 0.5f, 10, 5, 5);
            Assert.AreEqual(s.Level, 1, "Level wasn't stored");
            Assert.AreEqual(s.Experience, 0, "Experience wasn't stored");
            Assert.AreEqual(s.Health, 50, "Health wasn't stored");
            Assert.AreEqual(s.Spirit, 50, "Spirit wasn't stored");
            Assert.AreEqual(s.HealthRegen, 0.5f, "Health regen wasn't stored");
            Assert.AreEqual(s.SpiritRegen, 0.5f, "Spirit regen wasn't stored");
            Assert.AreEqual(s.Strength, 10, "Strength wasn't stored");
            Assert.AreEqual(s.Dexterity, 5, "Dexterity wasn't stored");
            Assert.AreEqual(s.Intelligence, 5, "Intelligence wasn't stored");
        }

        [TestMethod]
        public void UpdateTest() {
            Stats s = new Stats(1, 0, 50, 50, 0.5f, 0.5f, 10, 5, 5);
            s.Level = 2;
            s.Experience = 50;
            s.Health = 100;
            s.Spirit = 100;
            s.HealthRegen = 2;
            s.SpiritRegen = 2;
            s.Strength = 20;
            s.Dexterity = 20;
            s.Intelligence = 20;
            Assert.AreNotEqual(s.Level, 1, "Level wasn't stored");
            Assert.AreNotEqual(s.Experience, 0, "Experience wasn't stored");
            Assert.AreNotEqual(s.Health, 50, "Health wasn't stored");
            Assert.AreNotEqual(s.Spirit, 50, "Spirit wasn't stored");
            Assert.AreNotEqual(s.HealthRegen, 0.5f, "Health regen wasn't stored");
            Assert.AreNotEqual(s.SpiritRegen, 0.5f, "Spirit regen wasn't stored");
            Assert.AreNotEqual(s.Strength, 10, "Strength wasn't stored");
            Assert.AreNotEqual(s.Dexterity, 5, "Dexterity wasn't stored");
            Assert.AreNotEqual(s.Intelligence, 5, "Intelligence wasn't stored");
        }
    }
}
