using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MamalianDAL.Data;
using MamalianDAL.Logic;
using MamalianLib;

namespace MamalianDAL {
    public class InventoryRepository : IInventoryContext {
        private IInventoryContext context;
        
        public InventoryRepository(IInventoryContext context) {
            this.context = context;
        }
        
        public List<Item> GetInventory(Player p) {
            return context.GetInventory(p);
        }

        public List<Weapon> GetWeaponInventory(Player p) {
            return context.GetWeaponInventory(p);
        }

        public List<Armour> GetArmourInventory(Player p) {
            return context.GetArmourInventory(p);
        }

        public List<Potion> GetPotionInventory(Player p) {
            return context.GetPotionInventory(p);
        }
    }
}
