using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MamalianDAL.Data;
using MamalianLib;

namespace MamalianDAL.Repo {
    public class ClassRepository : IClassContext {
        private IClassContext context;

        public ClassRepository(IClassContext context) {
            this.context = context;
        }
        public List<Class> GetAll() {
            return context.GetAll();
        }

        public Class GetById(int id) {
            return context.GetById(id);
        }

        public Class Insert(Class obj) {
            return context.Insert(obj);
        }

        public bool Update(Class obj) {
            return context.Update(obj);
        }

        public bool Delete(int id) {
            return context.Delete(id);
        }
    }
}
