using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MamalianDAL.Data;
using MamalianLib;

namespace MamalianDAL.Repo {
    public class StatsRepository : IStatsContext {
        private IStatsContext context;

        public StatsRepository(IStatsContext context) {
            this.context = context;
        }
        public List<Stats> GetAll() {
            return context.GetAll();
        }

        public Stats GetById(int id) {
            return context.GetById(id);
        }

        public Stats Insert(Stats obj) {
            return context.Insert(obj);
        }

        public bool Update(Stats obj) {
            return context.Update(obj);
        }

        public bool Delete(int id) {
            return context.Delete(id);
        }
    }
}
