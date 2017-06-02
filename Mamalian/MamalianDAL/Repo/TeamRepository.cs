using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MamalianDAL.Data;
using MamalianLib;

namespace MamalianDAL.Repo {
    public class TeamRepository : ITeamContext {
        private ITeamContext context;

        public TeamRepository(ITeamContext context) {
            this.context = context;
        }
        public List<Team> GetAll() {
            return context.GetAll();
        }

        public Team GetById(int id) {
            return context.GetById(id);
        }

        public Team Insert(Team obj) {
            return context.Insert(obj);
        }

        public bool Update(Team obj) {
            return context.Update(obj);
        }

        public bool Delete(int id) {
            return context.Delete(id);
        }
    }
}
