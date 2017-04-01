using System;
using System.Collections.Generic;
using System.Diagnostics.Eventing.Reader;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MamalianDAL {
    public interface IContext<T> {
        List<T> GetAll();
        T GetById(int id);
        T Insert(T obj);
        bool Update(T obj);
        bool Delete(int id); 
    }
}