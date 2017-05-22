using System;
using MamalianLib;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace MamalianUnitTest {
    [TestClass]
    public class CharacterUnitTest {
        [TestMethod]
        public void PlayerCreationTest() {
            Stats s = new Stats(1, 0, 50, 50, 0.5f, 0.5f, 10, 5, 5);
            Class c = new Class(1, "Warrior", 10, 5, 0, 0);
            Player p = new Player(1, "Speler", s, c, Gender.Male, Race.Horse, 50, 5, 10);
            Assert.IsNotNull(p.Stats, "Player doesn't have stats");
            Assert.IsNotNull(p.Class, "Player doesn't have a class");
            Assert.AreEqual(p.Name, "Speler", "Name wasn't stored");
            Assert.AreEqual(p.Gender, Gender.Male, "Gender wasn't stored");
            Assert.AreEqual(p.Race, Race.Horse, "Race wasn't stored");
            Assert.AreEqual(p.Gold, 50, "Gold wasn't stored");
            Assert.AreEqual(p.Deaths, 5, "Deaths wasn't stored");
            Assert.AreEqual(p.HighestWave, 10, "Waves weren't stored");
        }

        [TestMethod]
        public void PlayerUpdateTest() {
            Stats s = new Stats(1, 0, 50, 50, 0.5f, 0.5f, 10, 5, 5);
            Class c = new Class(1, "Warrior", 10, 5, 0, 0);
            Player p = new Player(1, "Speler", s, c, Gender.Male, Race.Horse, 50, 5, 10);
            p.Name = "NewSpeler";
            p.Gender = Gender.Female;
            p.Race = Race.Bird;
            p.Gold = 100;
            p.Deaths = 10;
            p.HighestWave = 5;
            Assert.AreNotEqual(p.Name, "Speler", "Name wasn't updated");
            Assert.AreNotEqual(p.Gender, Gender.Male, "Gender wasn't updated");
            Assert.AreNotEqual(p.Race, Race.Horse, "Race wasn't updated");
            Assert.AreNotEqual(p.Gold, 50, "Gold wasn't stored");
            Assert.AreNotEqual(p.Deaths, 5, "Deaths wasn't stored");
            Assert.AreNotEqual(p.HighestWave, 10, "Waves weren't stored");
        }

        [TestMethod]
        public void EnemyCreationTest() {
            Stats s = new Stats(1, 0, 50, 50, 0.5f, 0.5f, 10, 5, 5);
            Enemy e = new Enemy(1, "Speler", s, Gender.Male, Race.Horse, 10, 10, 5, 5);
            Assert.IsNotNull(e.Stats, "Player doesn't have stats");
            Assert.AreEqual(e.Name, "Speler", "Name wasn't stored");
            Assert.AreEqual(e.Gender, Gender.Male, "Gender wasn't stored");
            Assert.AreEqual(e.Race, Race.Horse, "Race wasn't stored");
            Assert.AreEqual(e.PhysDamage, 10, "Physical Damage wasn't stored");
            Assert.AreEqual(e.ElemDamage, 10, "Elemental Damage wasn't stored");
            Assert.AreEqual(e.PhysReduction, 5, "Physical Reduction wasn't stored");
            Assert.AreEqual(e.ElemReduction, 5, "Elemental Reduction wasn't stored");
        }

        [TestMethod]
        public void EnemyUpdateTest() {
            Stats s = new Stats(1, 0, 50, 50, 0.5f, 0.5f, 10, 5, 5);
            Enemy e = new Enemy(1, "Enemy", s, Gender.Male, Race.Horse, 10, 10, 5, 5);
            Assert.IsNotNull(e.Stats, "Enemy doesn't have stats");
            e.Name = "NewEnemy";
            e.Gender = Gender.Female;
            e.Race = Race.Bird;
            e.PhysDamage = 100;
            e.ElemDamage = 100;
            e.PhysReduction = 15;
            e.ElemReduction = 15;
            Assert.AreNotEqual(e.Name, "Enemy", "Name wasn't stored");
            Assert.AreNotEqual(e.Gender, Gender.Male, "Gender wasn't stored");
            Assert.AreNotEqual(e.Race, Race.Horse, "Race wasn't stored");
            Assert.AreNotEqual(e.PhysDamage, 10, "Physical Damage wasn't stored");
            Assert.AreNotEqual(e.ElemDamage, 10, "Elemental Damage wasn't stored");
            Assert.AreNotEqual(e.PhysReduction, 5, "Physical Reduction wasn't stored");
            Assert.AreNotEqual(e.ElemReduction, 5, "Elemental Reduction wasn't stored");
        }

        [TestMethod]
        public void AttackTest() {
            Stats s = new Stats(1, 0, 50, 50, 0.5f, 0.5f, 10, 5, 5);
            Enemy e = new Enemy(1, "Enemy", s, Gender.Male, Race.Horse, 10, 10, 5, 5);
            Class c = new Class(1, "Warrior", 10, 5, 0, 0);
            Player p = new Player(1, "Speler", s, c, Gender.Male, Race.Horse, 50, 15, 5);
            var pPreviousHealth = p.Stats.Health;
            var ePreviousHealth = e.Stats.Health;
            p.Attack(e);
            Assert.AreNotEqual(e.Stats.Health, ePreviousHealth, "Enemy wasn't damaged");
            e.Attack(p);
            Assert.AreNotEqual(p.Stats.Health, pPreviousHealth, "Player wasn't damaged");
        }
    }
}