using System;
using System.Collections.Generic;
using MamalianDAL;
using MamalianDAL.Logic;
using MamalianDAL.Repo;
using MamalianLib;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace IntegrationUnitTests {
    [TestClass]
    public class TeamUnitTest {
        [TestMethod]
        public void TeamSelect() {
            TeamRepository repo = new TeamRepository(new TeamSQLContext());
            Team c = repo.GetById(1);
            Assert.IsNotNull(c, "Team wasn't correctly retrieved");
        }
        [TestMethod]
        public void TeamsSelect() {
            TeamRepository repo = new TeamRepository(new TeamSQLContext());
            List<Team> c = repo.GetAll();
            Assert.IsNotNull(c, "Teams weren't correctly retrieved");
        }

        [TestMethod]
        public void UpdateTeams() {
            TeamRepository repo = new TeamRepository(new TeamSQLContext());
            Team t = repo.GetById(1);
            t.Client = new PlayerSQLContext().GetById(2);
            repo.Update(t);
            Assert.IsNotNull(t.Client, "Client was't added.");
        }
    }
}
