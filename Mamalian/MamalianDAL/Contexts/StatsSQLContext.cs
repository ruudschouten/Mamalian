using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MamalianLib;

namespace MamalianDAL.Contexts {
    public class StatsSQLContext : IContext<Stats> {
        public List<Stats> GetAll() {
            List<Stats> result = new List<Stats>();
            SqlConnection con = Database.connection;
            string query = "SELECT * FROM Stats ORDER BY Id";
            SqlCommand command = new SqlCommand(query, con);
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read()) {
                result.Add(CreateStatsFromReader(reader));
            }
            return result;
        }

        public Stats GetById(int id) {
            Stats result = new Stats();
            SqlConnection con = Database.connection;
            string query = "SELECT * FROM Stats WHERE Id=@id";
            SqlCommand command = new SqlCommand(query, con);
            command.Parameters.AddWithValue("@id", id);
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read()) {
                result = CreateStatsFromReader(reader);
            }
            return result;
        }

        public Stats Insert(Stats Stats) {
            SqlConnection con = Database.connection;
            string query =
                "INSERT INTO Stats(Level, Experience, Health, Spirit, HealthRegen, SpiritRegen, Strength, Dexterity, Intelligence) " +
                "VALUES(@level, @exp, @health, @spirit, @healthR, @spiritR, @str, @dex, @int)";
            SqlCommand command = new SqlCommand(query, con);
            command.Parameters.AddWithValue("@level", Stats.Level);
            command.Parameters.AddWithValue("@exp", Stats.Experience);
            command.Parameters.AddWithValue("@health", Stats.Health);
            command.Parameters.AddWithValue("@spirit", Stats.Spirit);
            command.Parameters.AddWithValue("@healthR", Stats.HealthRegen);
            command.Parameters.AddWithValue("@spiritR", Stats.SpiritRegen);
            command.Parameters.AddWithValue("@str", Stats.Strength);
            command.Parameters.AddWithValue("@dex", Stats.Dexterity);
            command.Parameters.AddWithValue("@int", Stats.Intelligence);
            command.ExecuteNonQuery();

            if (Stats.Id == 0) {
                query = "SELECT IDENT_CURRENT('Stats')";
                var cmd = new SqlCommand(query, con);
                var id = cmd.ExecuteScalar();
                Stats.Id = Convert.ToInt32(id);
            }

            return GetById(Stats.Id);
        }

        public bool Update(Stats Stats) {
            SqlConnection con = Database.connection;
            string query = "UPDATE Stats " +
                           "SET " +
                           "Level = @level, " +
                           "Experience = @exp, " +
                           "Health = @health, " +
                           "Spirit = @spirit, " +
                           "HealthRegen = @healthR, " +
                           "SpiritRegen = @spiritR, " + 
                           "Strength = @str, " + 
                           "Dexterity = @dex, " +
                           "Intelligence = @int " +
                           "WHERE Id = @id; ";
            SqlCommand command = new SqlCommand(query, con);
            command.Parameters.AddWithValue("@level", Stats.Level);
            command.Parameters.AddWithValue("@exp", Stats.Experience);
            command.Parameters.AddWithValue("@health", Stats.Health);
            command.Parameters.AddWithValue("@spirit", Stats.Spirit);
            command.Parameters.AddWithValue("@healthR", Stats.HealthRegen);
            command.Parameters.AddWithValue("@spiritR", Stats.SpiritRegen);
            command.Parameters.AddWithValue("@str", Stats.Strength);
            command.Parameters.AddWithValue("@dex", Stats.Dexterity);
            command.Parameters.AddWithValue("@int", Stats.Intelligence);
            command.Parameters.AddWithValue("@id", Stats.Id);
            if (Convert.ToInt32(command.ExecuteNonQuery()) > 0) {
                return true;
            }
            return false;
        }

        public bool Delete(int id) {
            SqlConnection con = Database.connection;
            string query = "DELETE FROM Stats WHERE Id = @id";
            SqlCommand command = new SqlCommand(query, con);
            command.Parameters.AddWithValue("@id", id);
            if (Convert.ToInt32(command.ExecuteNonQuery()) == 1) {
                return true;
            }
            return false;
        }

        public Stats CreateStatsFromReader(SqlDataReader reader) {
            return new Stats(
                Convert.ToInt32(reader["Level"]),
                Convert.ToInt32(reader["Experience"]),
                Convert.ToInt32(reader["Health"]),
                Convert.ToInt32(reader["Spirit"]),
                Convert.ToSingle(reader["HealthRegen"]),
                Convert.ToSingle(reader["SpiritRegen"]),
                Convert.ToInt32(reader["Strength"]),
                Convert.ToInt32(reader["Dexterity"]),
                Convert.ToInt32(reader["Intelligence"])) {Id = Convert.ToInt32(reader["Id"])};
        }
    }
}