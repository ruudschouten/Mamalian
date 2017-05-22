using System;
using MamalianLib;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace MamalianUnitTest {
    [TestClass]
    public class ItemUnitTest {
        [TestMethod]
        public void WeaponCreationTest() {
            Weapon w = new Weapon(1, "Sword", "A dead normal sword", 50, 1.5f, 19, 0);
            Assert.AreEqual("Sword", w.Name, "Name wasn't stored");
            Assert.AreEqual("A dead normal sword", w.Description, "Description wasn't stored");
            Assert.AreEqual(50, w.GoldValue, "Name wasn't stored");
            Assert.AreEqual(1.5f, w.AttackSpeed, "Name wasn't stored");
            Assert.AreEqual(19, w.PhysDamage, "Phys damage wasn't stored");
            Assert.AreEqual(0, w.ElemDamage, "Elem damage wasn't stored");
        }
        [TestMethod]
        public void WeaponUpdateTest() {
            Weapon w = new Weapon(1, "Sword", "A dead normal sword", 50, 1.5f, 19, 0);
            w.Name = "Spear";
            w.Description = "A sword taped onto a stick";
            w.GoldValue = 150;
            w.AttackSpeed = 5;
            w.PhysDamage = 20;
            w.ElemDamage = 15;
            Assert.AreNotEqual("Sword", w.Name, "Name wasn't stored");
            Assert.AreNotEqual("A dead normal sword", w.Description, "Description wasn't stored");
            Assert.AreNotEqual(50, w.GoldValue, "Name wasn't stored");
            Assert.AreNotEqual(1.5f, w.AttackSpeed, "Name wasn't stored");
            Assert.AreNotEqual(19, w.PhysDamage, "Phys damage wasn't stored");
            Assert.AreNotEqual(0, w.ElemDamage, "Elem damage wasn't stored");
        }

        [TestMethod]
        public void ArmourCreationTest() {
            Armour a = new Armour(1, "Helmet", "A dead normal helmet", 50, 19, 0);
            Assert.AreEqual("Helmet", a.Name, "Name wasn't stored");
            Assert.AreEqual("A dead normal helmet", a.Description, "Description wasn't stored");
            Assert.AreEqual(50, a.GoldValue, "Gold wasn't stored");
            Assert.AreEqual(19, a.PhysReduction, "Phys reduction wasn't stored");
            Assert.AreEqual(0, a.ElemReduction, "Elem reduction wasn't stored");
        }
        [TestMethod]
        public void ArmourUpdateTest() {
            Armour a = new Armour(1, "Helmet", "A dead normal helmet", 50, 19, 0);
            a.Name = "Gloves";
            a.Description = "A piece of leather where you stick your hands into";
            a.GoldValue = 150;
            a.PhysReduction = 30;
            a.ElemReduction = 15;
            Assert.AreNotEqual("Sword", a.Name, "Name wasn't stored");
            Assert.AreNotEqual("A dead normal helmet", a.Description, "Description wasn't stored");
            Assert.AreNotEqual(50, a.GoldValue, "Name wasn't stored");
            Assert.AreNotEqual(19, a.PhysReduction, "Phys reduction wasn't stored");
            Assert.AreNotEqual(0, a.ElemReduction, "Elem reduction wasn't stored");
        }

        [TestMethod]
        public void PotionCreationTest() {
            Stats s = new Stats(0, 0, 0, 0, 15, 0, 0);
            Potion p = new Potion(1, "Strong potion", "A potion which will make you strong", 150, s);
            Assert.AreEqual("Strong potion", p.Name, "Name wasn't stored");
            Assert.AreEqual("A potion which will make you strong", p.Description, "Description wasn't stored");
            Assert.AreEqual(150, p.GoldValue, "Gold wasn't stored");
            Assert.AreEqual(s, p.Stats, "Stats wasn't stored");
        }
        [TestMethod]
        public void PotionUpdateTest() {
            Stats s = new Stats(0, 0, 0, 0, 15, 0, 0);
            Potion p = new Potion(1, "Strong potion", "A potion which will make you strong", 150, s);
            p.Name = "Dexterious potion";
            p.Description = "A potion which will make you dexterious";
            p.GoldValue = 50;
            p.Stats = new Stats(0,0,0,0,0,15,0);
            Assert.AreNotEqual("Strong potion", p.Name, "Name wasn't stored");
            Assert.AreNotEqual("A potion which will make you strong", p.Description, "Description wasn't stored");
            Assert.AreNotEqual(150, p.GoldValue, "Gold wasn't stored");
            Assert.AreNotEqual(s, p.Stats, "Stats wasn't stored");
        }
    }
}