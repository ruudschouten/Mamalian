using System.Collections.Generic;

namespace MamalianDAL.Data {
    public interface IContext<T> {
        List<T> GetAll();
        T GetById(int id);
        T Insert(T obj);
        bool Update(T obj);
        bool Delete(int id); 
    }
}