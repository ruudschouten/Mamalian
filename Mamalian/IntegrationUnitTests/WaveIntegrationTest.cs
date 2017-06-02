using System;
using System.Collections.Generic;
using MamalianDAL;
using MamalianDAL.Logic;
using MamalianDAL.Repo;
using MamalianLib;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace IntegrationUnitTests {
    [TestClass]
    public class WaveIntegrationTest {
        [TestMethod]
        public void WaveSelect() {
            WaveRepository repo = new WaveRepository(new WaveSQLContext());
            Wave c = repo.GetById(1);
            Assert.IsNotNull(c, "Wave wasn't correctly retrieved");
        }
    }
}
