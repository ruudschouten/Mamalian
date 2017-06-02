using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MamalianLib;

namespace MamalianDAL.Data {
    public interface IInventoryContext {
        List<Item> GetInventory(Player p);
        List<Weapon> GetWeaponInventory(Player p);
        List<Armour> GetArmourInventory(Player p);
        List<Potion> GetPotionInventory(Player p);
    }
}
