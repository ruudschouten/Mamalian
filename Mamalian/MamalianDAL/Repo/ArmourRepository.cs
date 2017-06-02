using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MamalianDAL.Data;
using MamalianLib;

namespace MamalianDAL.Repo {
    public class ArmourRepository : IArmourContext {
        private IArmourContext context;

        public ArmourRepository(IArmourContext context) {
            this.context = context;
        }
        public List<Armour> GetAll() {
            return context.GetAll();
        }

        public Armour GetById(int id) {
            return context.GetById(id);
        }

        public Armour Insert(Armour obj) {
            return context.Insert(obj);
        }

        public bool Update(Armour obj) {
            return context.Update(obj);
        }

        public bool Delete(int id) {
            return context.Delete(id);
        }
    }
}
