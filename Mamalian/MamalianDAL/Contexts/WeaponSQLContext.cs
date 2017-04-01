using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MamalianLib;

namespace MamalianDAL.Contexts {
    public class WeaponSQLContext: IContext<Weapon> {
        public List<Weapon> GetAll() {
            List<Weapon> result = new List<Weapon>();
            SqlConnection con = Database.connection;
            string query = "SELECT * FROM Item WHERE Type = @type";
            SqlCommand command = new SqlCommand(query, con);
            command.Parameters.AddWithValue("@type", 1);
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read()) {
                result.Add(CreateWeaponFromReader(reader));
            }
            return result;
        }

        public Weapon GetById(int id) {
            Weapon result = new Weapon();
            SqlConnection con = Database.connection;
            string query = "SELECT * FROM Item WHERE Id=@id";
            SqlCommand command = new SqlCommand(query, con);
            command.Parameters.AddWithValue("@id", id);
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read()) {
                result = CreateWeaponFromReader(reader);
            }
            return result;
        }

        public Weapon Insert(Weapon weapon) {
            SqlConnection con = Database.connection;
            string query = "INSERT INTO Item(Type, Name, Description, GoldValue, AttackSpeed, PhysDamage, ElemDamage) VALUES(" +
                           "@type, @name, @desc, @gold, @speed, @physD, @elemD)";
            SqlCommand command = new SqlCommand(query, con);
            command.Parameters.AddWithValue("@type", 1);
            command.Parameters.AddWithValue("@name", weapon.Name);
            command.Parameters.AddWithValue("@desc", weapon.Description);
            command.Parameters.AddWithValue("@gold", weapon.GoldValue);
            command.Parameters.AddWithValue("@physD", weapon.PhysDamage);
            command.Parameters.AddWithValue("@elemD", weapon.ElemDamage);
            command.ExecuteNonQuery();

            return GetById(weapon.Id);
        }

        public bool Update(Weapon weapon) {
            SqlConnection con = Database.connection;
            string query = "UPDATE Item " +
                           "SET " +
                           "Name = @name, " +
                           "Description = @desc, " +
                           "GoldValue = @gold, " +
                           "PhysDamage = @physD, " +
                           "ElemDamage = @elemD " +
                           "WHERE Id = @id";
            SqlCommand command = new SqlCommand(query, con);
            command.Parameters.AddWithValue("@name", weapon.Name);
            command.Parameters.AddWithValue("@desc", weapon.Description);
            command.Parameters.AddWithValue("@gold", weapon.GoldValue);
            command.Parameters.AddWithValue("@physD", weapon.PhysDamage);
            command.Parameters.AddWithValue("@elemD", weapon.ElemDamage);
            command.Parameters.AddWithValue("@id", weapon.Id);

            if (Convert.ToInt32(command.ExecuteNonQuery()) > 0) {
                return true;
            }
            return false;
        }

        public bool Delete(int id) {
            SqlConnection con = Database.connection;
            string query = "DELETE FROM Item WHERE Id = @id";
            SqlCommand command = new SqlCommand(query, con);
            command.Parameters.AddWithValue("@id", id);
            if (Convert.ToInt32(command.ExecuteNonQuery()) == 1) {
                return true;
            }
            return false;
        }

        public Weapon CreateWeaponFromReader(SqlDataReader reader) {
            var type = Convert.ToInt32(reader["Type"]);
            if(type != 1) throw new Exception("Item isn't the correct type");
//            var id= Convert.ToInt32(reader["Id"]);
//            var name =Convert.ToString(reader["Name"]);
//            var desc = Convert.ToString(reader["Description"]);
//            var gold = Convert.ToInt32(reader["GoldValue"]);
//            var speed = Convert.ToSingle(reader.GetFloat(5));
//            var physD = Convert.ToInt32(reader["PhysDamage"]);
//            var physR = Convert.ToInt32(reader["ElemDamage"]);

            Weapon w = new Weapon(
                Convert.ToInt32(reader["Id"]), 
                Convert.ToString(reader["Name"]),
                Convert.ToString(reader["Description"]),
                Convert.ToInt32(reader["GoldValue"]),
                Convert.ToSingle(reader["AttackSpeed"]),
                Convert.ToInt32(reader["PhysDamage"]),
                Convert.ToInt32(reader["ElemDamage"]));
            return w;
        }
    }
}
