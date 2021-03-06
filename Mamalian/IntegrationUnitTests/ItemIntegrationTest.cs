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
    public class ItemIntegrationTest {
        #region Item
        [TestMethod]
        public void TestInventory() {
            InventoryRepository repo = new InventoryRepository(new InventorySQLContext());
            List<Item> inventory = repo.GetInventory(new Player(1, "Muh neer", Gender.Male, Race.Cat, 0, 0, 0));
            Assert.IsNotNull(inventory, "Inventory wasn't correctly retrieved");
        }
        #endregion
        #region Weapon
        [TestMethod]
        public void WeaponSelect() {
            WeaponRepository repo = new WeaponRepository(new WeaponSQLContext());
            Weapon c = repo.GetById(4);
            Assert.IsNotNull(c, "Weapon wasn't correctly retrieved");
        }
        [TestMethod]
        public void WeaponsSelect() {
            WeaponRepository repo = new WeaponRepository(new WeaponSQLContext());
            List<Weapon> c = repo.GetAll();
            Assert.IsNotNull(c, "Weapons weren't correctly retrieved");
        }

        [TestMethod]
        public void UpdateWeapon() {
            WeaponRepository repo = new WeaponRepository(new WeaponSQLContext());
            Weapon c = repo.GetById(4);
            c.PhysDamage += 20;
            int damage = c.PhysDamage;
            repo.Update(c);
            c = repo.GetById(4);
            Assert.AreEqual(c.PhysDamage, damage, "Weapon wasn't updated.");
            c.PhysDamage -= 20;
            repo.Update(c);
        }
        #endregion
        #region Armour
        [TestMethod]
        public void ArmourSelect() {
            ArmourRepository repo = new ArmourRepository(new ArmourSQLContext());
            Armour c = repo.GetById(3);
            Assert.IsNotNull(c, "Armour wasn't correctly retrieved");
        }
        [TestMethod]
        public void ArmoursSelect() {
            ArmourRepository repo = new ArmourRepository(new ArmourSQLContext());
            List<Armour> c = repo.GetAll();
            Assert.IsNotNull(c, "Armours weren't correctly retrieved");
        }

        [TestMethod]
        public void UpdateArmour() {
            ArmourRepository repo = new ArmourRepository(new ArmourSQLContext());
            Armour c = repo.GetById(3);
            c.PhysReduction += 20;
            int reduction = c.PhysReduction;
            repo.Update(c);
            c = repo.GetById(3);
            Assert.AreEqual(c.PhysReduction, reduction, "Armour wasn't updated.");
            c.PhysReduction -= 20;
            repo.Update(c);
        }
        #endregion
        #region Potion
        [TestMethod]
        public void PotionSelect() {
            PotionRepository repo = new PotionRepository(new PotionSQLContext());
            Potion c = repo.GetById(1);
            Assert.IsNotNull(c, "Potion wasn't correctly retrieved");
        }
        [TestMethod]
        public void PotionsSelect() {
            PotionRepository repo = new PotionRepository(new PotionSQLContext());
            List<Potion> c = repo.GetAll();
            Assert.IsNotNull(c, "Potions weren't correctly retrieved");
        }

        [TestMethod]
        public void UpdatePotion() {
            PotionRepository repo = new PotionRepository(new PotionSQLContext());
            Potion c = repo.GetById(1);
            c.Stats.Spirit += 20;
            int spirit = c.Stats.Spirit;
            repo.Update(c);
            c = repo.GetById(1);
            Assert.AreEqual(c.Stats.Spirit, spirit, "Potion wasn't updated.");
            c.Stats.Spirit -= 20;
            repo.Update(c);
        }
        #endregion
    }
}
