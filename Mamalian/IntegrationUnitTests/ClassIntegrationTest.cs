﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MamalianDAL;
using MamalianDAL.Contexts;
using MamalianLib;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace TeamUnitTest {
    [TestClass]
    public class ClassIntegrationTest {
        [TestMethod]
        public void ClassSelect() {
            Repository<Class> repo = new Repository<Class>(new ClassSQLContext());
            Class c = repo.GetById(1);
            Assert.IsNotNull(c, "Class wasn't correctly retrieved");
        }
        [TestMethod]
        public void ClassesSelect() {
            Repository<Class> repo = new Repository<Class>(new ClassSQLContext());
            List<Class> c = repo.GetAll();
            Assert.IsNotNull(c, "Classes weren't correctly retrieved");
        }

        [TestMethod]
        public void UpdateClass() {
            Repository<Class> repo = new Repository<Class>(new ClassSQLContext());
            Class c = repo.GetById(2);
            c.PhysDamage += 20;
            int damage = c.PhysDamage;
            repo.Update(c);
            c = repo.GetById(2);
            Assert.AreEqual(c.PhysDamage, damage, "Class wasn't updated.");
            c.PhysDamage -= 20;
            repo.Update(c);
        }
    }
}