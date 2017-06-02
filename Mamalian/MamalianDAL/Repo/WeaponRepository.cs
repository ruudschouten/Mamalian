using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MamalianDAL.Data;
using MamalianLib;

namespace MamalianDAL.Repo {
    public class WeaponRepository : IWeaponContext {
        private IWeaponContext context;
        public WeaponRepository(IWeaponContext context) {
            this.context = context;
        }
        public List<Weapon> GetAll() {
            return context.GetAll();
        }

        public Weapon GetById(int id) {
            return context.GetById(id);
        }

        public Weapon Insert(Weapon obj) {
            return context.Insert(obj);
        }

        public bool Update(Weapon obj) {
            return context.Update(obj);
        }

        public bool Delete(int id) {
            return context.Delete(id);
        }
    }
}
