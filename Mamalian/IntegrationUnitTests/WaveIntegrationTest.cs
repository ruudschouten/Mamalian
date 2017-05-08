using System;
using System.Collections.Generic;
using MamalianDAL;
using MamalianDAL.Contexts;
using MamalianLib;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace IntegrationUnitTests {
    [TestClass]
    public class WaveIntegrationTest {
        [TestMethod]
        public void WaveSelect() {
            Repository<Wave> repo = new Repository<Wave>(new WaveSQLContext());
            Wave c = repo.GetById(1);
            Assert.IsNotNull(c, "Wave wasn't correctly retrieved");
        }
    }
}
