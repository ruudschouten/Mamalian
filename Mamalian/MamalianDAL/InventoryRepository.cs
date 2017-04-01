using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MamalianDAL.Contexts;
using MamalianLib;

namespace MamalianDAL {
    public class InventoryRepository {
        private InventorySQLContext context;
        
        public InventoryRepository(InventorySQLContext context) {
            this.context = context;
        }
        
        public List<Item> GetInventory(Player p) {
            return context.GetInventory(p);
        }
    }
}
