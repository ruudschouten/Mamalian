﻿using System.Collections.Generic;
using System.Data.SqlClient;
using MamalianDAL.Data;
using MamalianLib;

namespace MamalianDAL.Logic {
    public class InventorySQLContext : IInventoryContext {
        public List<Item> GetInventory(Player p) {
            List<Item> inventory = new List<Item>();
            foreach (var weapon in GetWeaponInventory(p)) {
                inventory.Add(weapon);
            }
            foreach (var armour in GetArmourInventory(p)) {
                inventory.Add(armour);
            }
            foreach (var potion in GetPotionInventory(p)) {
                inventory.Add(potion);
            }
            return inventory;
        }

        public List<Weapon> GetWeaponInventory(Player p) {
            List<Weapon> result = new List<Weapon>();
            SqlConnection con = Database.connection;
            string query = "SELECT * FROM Inventory " +
                           "INNER JOIN Item on Inventory.ItemId = Item.Id " +
                           "WHERE Inventory.PlayerId=@id AND Type=@type";
            SqlCommand command = new SqlCommand(query, con);
            command.Parameters.AddWithValue("@id", p.Id);
            command.Parameters.AddWithValue("@type", 1);
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read()) {
                result.Add(new WeaponSQLContext().CreateWeaponFromReader(reader));
            }
            return result;
        }

        public List<Armour> GetArmourInventory(Player p) {
            List<Armour> result = new List<Armour>();
            SqlConnection con = Database.connection;
            string query = "SELECT * FROM Inventory " +
                           "INNER JOIN Item on Inventory.ItemId = Item.Id " +
                           "WHERE Inventory.PlayerId=@id AND Type=@type";
            SqlCommand command = new SqlCommand(query, con);
            command.Parameters.AddWithValue("@id", p.Id);
            command.Parameters.AddWithValue("@type", 2);
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read()) {
                result.Add(new ArmourSQLContext().CreateArmourFromReader(reader));
            }
            return result;
        }

        public List<Potion> GetPotionInventory(Player p) {
            List<Potion> result = new List<Potion>();
            SqlConnection con = Database.connection;
            string query = "SELECT " +
                           "inv.Id as invId, " +
                           "s.Id as sId, s.Level, s.Experience, s.Health, s.Spirit, s.HealthRegen, s.SpiritRegen, s.Strength, s.Dexterity, s.Intelligence, " +
                           "i.Id, i.Type, i.Name, i.Description, i.GoldValue, i.AttackSpeed, i.PhysDamage, i.ElemDamage, i.PhysReduction, i.ElemReduction " +
                           "from Inventory inv " +
                           "INNER JOIN Item i on ItemId = i.Id " +
                           "INNER JOIN PotionStats on PotionId = i.Id " +
                           "INNER JOIN Stats s on PotionStats.StatsId = s.Id " +
                           "WHERE inv.PlayerId=@id AND Type=@type";
            SqlCommand command = new SqlCommand(query, con);
            command.Parameters.AddWithValue("@id", p.Id);
            command.Parameters.AddWithValue("@type", 3);
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read()) {
                result.Add(new PotionSQLContext().CreatePotionFromReader(reader));
            }
            return result;
        }
    }
}