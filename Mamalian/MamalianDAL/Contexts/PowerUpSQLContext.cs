using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MamalianLib;

namespace MamalianDAL.Contexts {
    public class PowerUpSQLContext : IContext<PowerUp> {
        public List<PowerUp> GetAll() {
            List<PowerUp> result = new List<PowerUp>();
            SqlConnection con = Database.connection;
            string query = "SELECT * FROM PowerUpBoost " +
                           "INNER JOIN PowerUps on PowerUpBoost.PowerUpId = PowerUps.Id " +
                           "INNER JOIN Stats on PowerUpBoost.StatsId = Stats.Id";
            SqlCommand command = new SqlCommand(query, con);
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read()) {
                result.Add(CreatePowerUpFromReader(reader));
            }
            return result;
        }

        public PowerUp GetById(int id) {
            PowerUp result = new PowerUp();
            SqlConnection con = Database.connection;
            string query = "SELECT * FROM PowerUpBoost " +
                           "INNER JOIN PowerUps on PowerUpBoost.PowerUpId = PowerUps.Id " +
                           "INNER JOIN Stats on PowerUpBoost.StatsId = Stats.Id " +
                           "WHERE PowerUpId=@id";
            SqlCommand command = new SqlCommand(query, con);
            command.Parameters.AddWithValue("@id", id);
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read()) {
                result = CreatePowerUpFromReader(reader);
            }
            return result;
        }

        public PowerUp Insert(PowerUp powerUp) {
            SqlConnection con = Database.connection;
            string query =
                "INSERT INTO PowerUps(Name, Description, Duration) VALUES(" +
                "@name, @desc, @dur)";
            SqlCommand command = new SqlCommand(query, con);
            command.Parameters.AddWithValue("@type", 2);
            command.Parameters.AddWithValue("@name", powerUp.Name);
            command.Parameters.AddWithValue("@desc", powerUp.Description);
            command.Parameters.AddWithValue("@dur", powerUp.Duration);
            command.ExecuteNonQuery();

            return GetById(powerUp.Id);
        }

        public bool Update(PowerUp powerUp) {
            SqlConnection con = Database.connection;
            string query = "UPDATE PowerUps " +
                           "SET " +
                           "Name = @name, " +
                           "Description = @desc, " +
                           "Duration = @dur " +
                           "WHERE Id = @id";
            SqlCommand command = new SqlCommand(query, con);
            command.Parameters.AddWithValue("@name", powerUp.Name);
            command.Parameters.AddWithValue("@desc", powerUp.Description);
            command.Parameters.AddWithValue("@dur", powerUp.Duration);
            command.Parameters.AddWithValue("@id", powerUp.Id);

            if (Convert.ToInt32(command.ExecuteNonQuery()) > 0) {
                return true;
            }
            return false;
        }

        public bool Delete(int id) {
            SqlConnection con = Database.connection;
            string query = "DELETE FROM PowerUps WHERE Id = @id";
            SqlCommand command = new SqlCommand(query, con);
            command.Parameters.AddWithValue("@id", id);
            if (Convert.ToInt32(command.ExecuteNonQuery()) == 1) {
                return true;
            }
            return false;
        }

        public PowerUp CreatePowerUpFromReader(SqlDataReader reader) {
            PowerUp p = new PowerUp(
                Convert.ToInt32(reader["Id"]),
                Convert.ToString(reader["Name"]),
                Convert.ToString(reader["Description"]),
                Convert.ToInt32(reader["Duration"]));
            p.AssignStats(new StatsSQLContext().GetById(Convert.ToInt32(reader["StatsId"])));
            return p;
        }
    }
}