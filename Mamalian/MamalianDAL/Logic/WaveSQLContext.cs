using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using MamalianDAL.Data;
using MamalianLib;

namespace MamalianDAL.Logic {
    public class WaveSQLContext : IWaveContext {
        public List<Wave> GetAll() {
            List<Wave> result = new List<Wave>();
            SqlConnection con = Database.connection;
            string query = "SELECT * FROM Wave";
            SqlCommand command = new SqlCommand(query, con);
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read()) {
                result.Add(CreateWaveFromReader(reader));
            }
            con.Close();
            return result;
        }

        public List<Enemy> GetAllEnemies(int id) {
            List<Enemy> result = new List<Enemy>();
            SqlConnection con = Database.connection;
            string query = "SELECT * FROM WaveEnemies WHERE WaveId = @id";
            SqlCommand command = new SqlCommand(query, con);
            command.Parameters.AddWithValue("@id", id);
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read()) {
                result.Add(new EnemySQLContext().GetById(Convert.ToInt32(reader["EnemyId"])));
            }
            con.Close();
            return result;
        }

        public List<PowerUp> GetAllPowerUps(int id) {
            List<PowerUp> result = new List<PowerUp>();
            SqlConnection con = Database.connection;
            string query = "SELECT * FROM WavePowerUps WHERE Id = @id";
            SqlCommand command = new SqlCommand(query, con);
            command.Parameters.AddWithValue("@id", id);
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read()) {
                result.Add(new PowerUpSQLContext().GetById(Convert.ToInt32(reader["PowerUpId"])));
            }
            con.Close();
            return result;
        }

        public Wave GetById(int id) {
            Wave result = new Wave();
            SqlConnection con = Database.connection;
            string query = "SELECT * FROM Wave WHERE Id=@id";
            SqlCommand command = new SqlCommand(query, con);
            command.Parameters.AddWithValue("@id", id);
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read()) {
                result = CreateWaveFromReader(reader);
            }
            return result;
        }

        public Wave Insert(Wave Wave) {
            if (Wave.Enemies == null) throw new NoNullAllowedException("Enemies can't be null");
            if (Wave.PowerUps == null) throw new NoNullAllowedException("PowerUps can't be null");
            SqlConnection con = Database.connection;
            string query =
                "INSERT INTO Wave(StatMultiplier, MaxMonsters) VALUES(" +
                "@mult, @max)";
            SqlCommand command = new SqlCommand(query, con);
            command.Parameters.AddWithValue("@mult", Wave.StatMultiplier);
            command.Parameters.AddWithValue("@max", Wave.MaxMonsters);
            command.ExecuteNonQuery();

            return GetById(Wave.Id);
        }

        public bool Update(Wave Wave) {
            var context = new EnemySQLContext();
            foreach (var enemy in Wave.Enemies) {
                context.Update(enemy);
            }
            var c = new PowerUpSQLContext();
            foreach (var powerUp in Wave.PowerUps) {
                c.Update(powerUp);
            }

            SqlConnection con = Database.connection;
            string query = "UPDATE Waves " +
                           "SET " +
                           "StatMultiplier = @mult, " +
                           "MaxMonsters = @max " +
                           "WHERE Id = @id";
            SqlCommand command = new SqlCommand(query, con);
            command.Parameters.AddWithValue("@mult", Wave.StatMultiplier);
            command.Parameters.AddWithValue("@max", Wave.MaxMonsters);
            command.Parameters.AddWithValue("@id", Wave.Id);

            if (Convert.ToInt32(command.ExecuteNonQuery()) > 0) {
                return true;
            }
            return false;
        }

        public bool Delete(int id) {
            SqlConnection con = Database.connection;
            string query = "DELETE FROM Waves WHERE Id = @id";
            SqlCommand command = new SqlCommand(query, con);
            command.Parameters.AddWithValue("@id", id);
            if (Convert.ToInt32(command.ExecuteNonQuery()) == 1) {
                return true;
            }
            return false;
        }

        public Wave CreateWaveFromReader(SqlDataReader reader) {
            int id = Convert.ToInt32(reader["Id"]);
            Wave w = new Wave(
                id,
                Convert.ToInt32(reader["StatMultiplier"]),
                Convert.ToInt32(reader["MaxMonsters"]));
            w.Enemies = GetAllEnemies(id);
            w.PowerUps = GetAllPowerUps(id);
            return w;
        }
    }
}