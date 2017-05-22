using System;
using MamalianLib;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace MamalianUnitTest {
    [TestClass]
    public class ClassUnitTest {
        [TestMethod]
        public void CreationTest() {
            Class c = new Class(1, "Warrior", 10, 5, 10, 5);
            Assert.AreEqual(c.Name, "Warrior", "Class name wasn't stored");
            Assert.AreEqual(c.PhysDamage, 10, "Physical damage wasn't stored");
            Assert.AreEqual(c.PhysReduction, 5, "Physical reduction wasn't stored");
            Assert.AreEqual(c.ElemDamage, 10, "Elemental damage wasn't stored");
            Assert.AreEqual(c.ElemReduction, 5, "Elemental reduction wasn't stored");
        }
        [TestMethod]
        public void UpdateTest() {
            Class c = new Class(1, "Warrior", 10, 5, 10, 5);
            c.Name = "Elementalist";
            c.PhysDamage = 5;
            c.PhysReduction = 10;
            c.ElemDamage = 15;
            c.ElemReduction = 20;
            Assert.AreNotEqual(c.Name, "Warrior", "Class name wasn't stored");
            Assert.AreNotEqual(c.PhysDamage, 10, "Physical damage wasn't stored");
            Assert.AreNotEqual(c.PhysReduction, 5, "Physical reduction wasn't stored");
            Assert.AreNotEqual(c.ElemDamage, 10, "Elemental damage wasn't stored");
            Assert.AreNotEqual(c.ElemReduction, 5, "Elemental reduction wasn't stored");
        }
        [TestMethod]
        public void AddSkillsTest() {
            Class c = new Class(1, "Warrior", 10, 5, 10, 5);
            var prevSkills = c.Skills.Count;
            c.AssignSkills("Sleep");
            c.AssignSkills("Rest");
            Assert.AreNotEqual(prevSkills, c.Skills.Count, "Skills weren't added");
        }
    }
}
