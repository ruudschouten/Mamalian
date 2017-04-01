using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MamalianLib;

namespace MamalianDAL {
    public class Repository<T> {
        private IContext<T> context;

        public Repository(IContext<T> context) {
            this.context = context;
        }

        public List<T> GetAll() {
            return context.GetAll();
        }

        public T GetById(int id) {
            return context.GetById(id);
        }

        public T Insert(T obj) {
            return context.Insert(obj);
        }

        public bool Update(T obj) {
            return context.Update(obj);
        }

        public bool Delete(int id) {
            return context.Delete(id);
        }
    }
}
