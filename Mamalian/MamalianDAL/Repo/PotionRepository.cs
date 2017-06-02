using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MamalianDAL.Data;
using MamalianLib;

namespace MamalianDAL.Repo {
    public class PotionRepository : IPotionContext {
        private IPotionContext context;

        public PotionRepository(IPotionContext context) {
            this.context = context;
        }
        public List<Potion> GetAll() {
            return context.GetAll();
        }

        public Potion GetById(int id) {
            return context.GetById(id);
        }

        public Potion Insert(Potion obj) {
            return context.Insert(obj);
        }

        public bool Update(Potion obj) {
            return context.Update(obj);
        }

        public bool Delete(int id) {
            return context.Delete(id);
        }
    }
}
