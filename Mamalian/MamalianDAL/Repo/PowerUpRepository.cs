using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MamalianDAL.Data;
using MamalianLib;

namespace MamalianDAL.Repo {
    public class PowerUpRepository : IPowerUpContext {
        private IPowerUpContext context;

        public PowerUpRepository(IPowerUpContext context) {
            this.context = context;
        }
        public List<PowerUp> GetAll() {
            return context.GetAll();
        }

        public PowerUp GetById(int id) {
            return context.GetById(id);
        }

        public PowerUp Insert(PowerUp obj) {
            return context.Insert(obj);
        }

        public bool Update(PowerUp obj) {
            return context.Update(obj);
        }

        public bool Delete(int id) {
            return context.Delete(id);
        }
    }
}
