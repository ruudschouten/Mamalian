using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using MamalianDAL.Data;
using MamalianLib;

namespace MamalianDAL.Logic {
    public class ArmourSQLContext : IArmourContext {
        public List<Armour> GetAll() {
            List<Armour> result = new List<Armour>();
            SqlConnection con = Database.connection;
            string query = "SELECT * FROM Item WHERE Type = @type";
            SqlCommand command = new SqlCommand(query, con);
            command.Parameters.AddWithValue("@type", 2);
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read()) {
                result.Add(CreateArmourFromReader(reader));
            }
            return result;
        }

        public Armour GetById(int id) {
            Armour result = new Armour();
            SqlConnection con = Database.connection;
            string query = "SELECT * FROM Item WHERE Id=@id";
            SqlCommand command = new SqlCommand(query, con);
            command.Parameters.AddWithValue("@id", id);
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read()) {
                result = CreateArmourFromReader(reader);
            }
            return result;
        }

        public Armour Insert(Armour armour) {
            SqlConnection con = Database.connection;
            string query =
                "INSERT INTO Item(Type, Name, Description, GoldValue, PhysReduction, ElemReduction) VALUES(" +
                "@type, @name, @desc, @gold, @physR, @elemR)";
            SqlCommand command = new SqlCommand(query, con);
            command.Parameters.AddWithValue("@type", 2);
            command.Parameters.AddWithValue("@name", armour.Name);
            command.Parameters.AddWithValue("@desc", armour.Description);
            command.Parameters.AddWithValue("@gold", armour.GoldValue);
            command.Parameters.AddWithValue("@physR", armour.PhysReduction);
            command.Parameters.AddWithValue("@elemR", armour.ElemReduction);
            command.ExecuteNonQuery();

            return GetById(armour.Id);
        }

        public bool Update(Armour armour) {
            SqlConnection con = Database.connection;
            string query = "UPDATE Item " +
                           "SET " +
                           "Name = @name, " +
                           "Description = @desc, " +
                           "GoldValue = @gold, " +
                           "PhysReduction = @physR, " +
                           "ElemReduction = @elemR " +
                           "WHERE Id = @id";
            SqlCommand command = new SqlCommand(query, con);
            command.Parameters.AddWithValue("@name", armour.Name);
            command.Parameters.AddWithValue("@desc", armour.Description);
            command.Parameters.AddWithValue("@gold", armour.GoldValue);
            command.Parameters.AddWithValue("@physR", armour.PhysReduction);
            command.Parameters.AddWithValue("@elemR", armour.ElemReduction);
            command.Parameters.AddWithValue("@id", armour.Id);

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

        public Armour CreateArmourFromReader(SqlDataReader reader) {
            var type = Convert.ToInt32(reader["Type"]);
            if (type != 2) throw new Exception("Item isn't the correct type");

            Armour w = new Armour(
                Convert.ToInt32(reader["Id"]),
                Convert.ToString(reader["Name"]),
                Convert.ToString(reader["Description"]),
                Convert.ToInt32(reader["GoldValue"]),
                Convert.ToInt32(reader["PhysReduction"]),
                Convert.ToInt32(reader["ElemReduction"]));
            return w;
        }
    }
}
