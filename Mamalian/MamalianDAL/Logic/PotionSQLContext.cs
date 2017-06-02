using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using MamalianDAL.Data;
using MamalianLib;

namespace MamalianDAL.Logic {
    public class PotionSQLContext : IPotionContext {
        public List<Potion> GetAll() {
            List<Potion> result = new List<Potion>();
            SqlConnection con = Database.connection;
            string query = "SELECT * FROM PotionStats " +
                           "INNER JOIN Stats ON PotionStats.StatsId = Stats.Id " +
                           "INNER JOIN Item ON Item.Id = PotionStats.PotionId " +
                           "WHERE Item.Type = @type";
            SqlCommand command = new SqlCommand(query, con);
            command.Parameters.AddWithValue("@type", 3);
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read()) {
                result.Add(CreatePotionFromReader(reader));
            }
            return result;
        }

        public Potion GetById(int id) {
            Potion result = new Potion();
            SqlConnection con = Database.connection;
            string query = "SELECT * FROM PotionStats " +
                           "INNER JOIN Stats ON PotionStats.StatsId = Stats.Id " +
                           "INNER JOIN Item ON Item.Id = PotionStats.PotionId " +
                           "WHERE Item.Id=@id AND Item.Type = @type ";
            SqlCommand command = new SqlCommand(query, con);
            command.Parameters.AddWithValue("@id", id);
            command.Parameters.AddWithValue("@type", 3);
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read()) {
                result = CreatePotionFromReader(reader);
            }
            return result;
        }

        public Potion Insert(Potion potion) {
            if (potion.Stats == null) {
                throw new NoNullAllowedException("Stats can't be null");
            }
            SqlConnection con = Database.connection;
            string query =
                "INSERT INTO Item(Type, Name, Description, GoldValue) VALUES(" +
                "@type, @name, @desc, @gold)";
            SqlCommand command = new SqlCommand(query, con);
            command.Parameters.AddWithValue("@type", 3);
            command.Parameters.AddWithValue("@name", potion.Name);
            command.Parameters.AddWithValue("@desc", potion.Description);
            command.Parameters.AddWithValue("@gold", potion.GoldValue);
            command.ExecuteNonQuery();

            return GetById(potion.Id);
        }

        public bool Update(Potion potion) {
            if (potion.Stats != null) {
                new StatsSQLContext().Update(potion.Stats);
            }
            SqlConnection con = Database.connection;
            string query = "UPDATE Item " +
                           "SET " +
                           "Name = @name, " +
                           "Description = @desc, " +
                           "GoldValue = @gold " +
                           "WHERE Id = @id";
            SqlCommand command = new SqlCommand(query, con);
            command.Parameters.AddWithValue("@name", potion.Name);
            command.Parameters.AddWithValue("@desc", potion.Description);
            command.Parameters.AddWithValue("@gold", potion.GoldValue);
            command.Parameters.AddWithValue("@id", potion.Id);

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

        public Potion CreatePotionFromReader(SqlDataReader reader) {
            var type = Convert.ToInt32(reader["Type"]);
            if (type != 3) throw new Exception("Item isn't the correct type");

            Potion p = new Potion(
                Convert.ToInt32(reader["Id"]),
                Convert.ToString(reader["Name"]),
                Convert.ToString(reader["Description"]),
                Convert.ToInt32(reader["GoldValue"]));
            Stats s = new StatsSQLContext().CreateStatsFromReader(reader);
            p.Stats = s;
            return p;
        }
    }
}