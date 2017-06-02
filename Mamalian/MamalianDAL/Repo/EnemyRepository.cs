using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MamalianDAL.Data;
using MamalianLib;

namespace MamalianDAL.Repo {
    public class EnemyRepository : IEnemyContext {
        private IEnemyContext context;

        public EnemyRepository(IEnemyContext context) {
            this.context = context;
        }

        public List<Enemy> GetAll() {
            return context.GetAll();
        }

        public Enemy GetById(int id) {
            return context.GetById(id);
        }

        public Enemy Insert(Enemy obj) {
            return context.Insert(obj);
        }

        public bool Update(Enemy obj) {
            return context.Update(obj);
        }

        public bool Delete(int id) {
            return context.Delete(id);
        }
    }
}