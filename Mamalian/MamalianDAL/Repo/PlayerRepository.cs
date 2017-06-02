using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MamalianDAL.Data;
using MamalianLib;

namespace MamalianDAL.Repo {
    public class PlayerRepository : IPlayerContext {
        private IPlayerContext context;
        public PlayerRepository(IPlayerContext context) {
            this.context = context;
        }
        public List<Player> GetAll() {
            return context.GetAll();
        }

        public Player GetById(int id) {
            return context.GetById(id);
        }

        public Player Insert(Player obj) {
            return context.Insert(obj);
        }

        public bool Update(Player obj) {
            return context.Update(obj);
        }

        public bool Delete(int id) {
            return context.Delete(id);
        }
    }
}
