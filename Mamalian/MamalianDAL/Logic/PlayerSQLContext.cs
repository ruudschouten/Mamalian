using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using MamalianDAL.Data;
using MamalianDAL.Repo;
using MamalianLib;

namespace MamalianDAL.Logic {
    public class PlayerSQLContext : IPlayerContext {

        public List<Player> GetAll() {
            List<Player> result = new List<Player>();
            SqlConnection con = Database.connection;
            string query = "SELECT " +
                           "p.Id as pId, p.Name, p.Gender, p.Race, p.Gold, p.Deaths, p.HighestWave, " +
                           "s.Id as sId, s.Level, s.Experience, s.Health, s.Spirit, s.HealthRegen, s.SpiritRegen, s.Strength, s.Dexterity, s.Intelligence, " +
                           "c.Id as cId, c.Name, c.PhysDamage, c.PhysReduction, c.ElemDamage, c.ElemReduction, c.Skills " +
                           "FROM PlayerStats " +
                           "LEFT OUTER JOIN Player p on PlayerStats.PlayerId = p.Id " +
                           "LEFT OUTER JOIN Stats s on PlayerStats.StatsId = s.Id " +
                           "LEFT OUTER JOIN Class c on p.Id = c.Id ";
            SqlCommand command = new SqlCommand(query, con);
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read()) {
                result.Add(CreatePlayerFromReader(reader));
            }
            return result;
        }

        public Player GetById(int id) {
            Player player = new Player();
            SqlConnection con = Database.connection;
            string query = "SELECT " +
                           "p.Id as pId, p.Name, p.Gender, p.Race, p.Gold, p.Deaths, p.HighestWave, " +
                           "s.Id as sId, s.Level, s.Experience, s.Health, s.Spirit, s.HealthRegen, s.SpiritRegen, s.Strength, s.Dexterity, s.Intelligence, " +
                           "c.Id as cId, c.Name, c.PhysDamage, c.PhysReduction, c.ElemDamage, c.ElemReduction, c.Skills " +
                           "FROM PlayerStats " +
                           "INNER JOIN Player p on PlayerStats.PlayerId = p.Id " +
                           "INNER JOIN Stats s on PlayerStats.StatsId = s.Id " +
                           "INNER JOIN Class c on p.Id = c.Id " +
                           "WHERE p.Id = @id";
            SqlCommand command = new SqlCommand(query, con);
            command.Parameters.AddWithValue("@id", id);
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read()) {
                player = CreatePlayerFromReader(reader);
            }
            return player;
        }

        public Player Insert(Player player) {
            if (player.Stats == null) throw new NoNullAllowedException("Stats can't be null");
            if (player.Class == null) throw new NoNullAllowedException("Class can't be null");
            SqlConnection con = Database.connection;

            string query = "INSERT INTO Player(Name, Gender, Race, Gold, Deaths, HighestWave) VALUES(" +
                           "@name, @gender, @race, @gold, @deaths, @wave)";

            SqlCommand command = new SqlCommand(query, con);
            command.Parameters.AddWithValue("@name", player.Name);
            command.Parameters.AddWithValue("@gender", player.Gender.ToString());
            command.Parameters.AddWithValue("@race", player.Race.ToString());
            command.Parameters.AddWithValue("@gold", player.Gold);
            command.Parameters.AddWithValue("@deaths", player.Deaths);
            command.Parameters.AddWithValue("@wave", player.HighestWave);
            command.ExecuteNonQuery();
            if (player.Id == 0) {
                query = "SELECT IDENT_CURRENT('Player')";
                var cmd = new SqlCommand(query, con);
                var id = cmd.ExecuteScalar();
                player.Id = Convert.ToInt32(id);
            }
            if (player.Class.Id == 0) {
                player.Class.Id = player.Id;
                player.Class = new ClassRepository(new ClassSQLContext()).Insert(player.Class);
            }
//            SetClassLink(player);
            if (player.Stats.Id == 0) {
                player.Stats = new StatsRepository(new StatsSQLContext()).Insert(player.Stats);
            }
            SetStatLink(player);

            return GetById(player.Id);
        }

        public bool Update(Player player) {
            if (player.Stats != null) {
                new StatsSQLContext().Update(player.Stats);
            }
            if (player.Class != null) {
                new ClassSQLContext().Update(player.Class);
            }
            SqlConnection con = Database.connection;
            string query = "UPDATE Player " +
                           "SET " +
                           "Name = @name, " +
                           "Gold = @gold, " +
                           "Deaths = @deaths, " +
                           "HighestWave = @wave " +
                           "WHERE Id = @id";
            SqlCommand command = new SqlCommand(query, con);
            command.Parameters.AddWithValue("@name", player.Name);
            command.Parameters.AddWithValue("@gold", player.Gold);
            command.Parameters.AddWithValue("@deaths", player.Deaths);
            command.Parameters.AddWithValue("@wave", player.HighestWave);
            command.Parameters.AddWithValue("@id", player.Id);
            if (Convert.ToInt32(command.ExecuteNonQuery()) > 0) {
                return true;
            }
            return false;
        }

        public bool SetStatLink(Player player) {
            SqlConnection con = Database.connection;
            string query = "INSERT INTO PlayerStats(PlayerId, StatsId) VALUES(@pId, @sId)";
            SqlCommand command = new SqlCommand(query, con);
            command.Parameters.AddWithValue("@pId", player.Id);
            command.Parameters.AddWithValue("@sId", player.Stats.Id);
            if (Convert.ToInt32(command.ExecuteNonQuery()) > 0) {
                return true;
            }
            return false;
        }

        public bool SetClassLink(Player player) {
            SqlConnection con = Database.connection;
            ClassSQLContext classSqlContext = new ClassSQLContext();
            if (classSqlContext.Insert(player.Class) != null) {
                return true;
            }
            return false;
        }

        public bool Delete(int id) {
            SqlConnection con = Database.connection;
            string query = "DELETE FROM Player WHERE Id = @id";
            SqlCommand command = new SqlCommand(query, con);
            command.Parameters.AddWithValue("@id", id);
            if (Convert.ToInt32(command.ExecuteNonQuery()) == 1) {
                return true;
            }
            return false;
        }

        public Player CreatePlayerFromReader(SqlDataReader reader) {
            Gender g = (Gender) Enum.Parse(typeof(Gender), Convert.ToString(reader["Gender"]));
            Race r = (Race) Enum.Parse(typeof(Race), Convert.ToString(reader["Race"]));
            Player p = new Player(
                Convert.ToInt32(reader["pId"]),
                Convert.ToString(reader["Name"]),
                g,
                r,
                Convert.ToInt32(reader["Gold"]),
                Convert.ToInt32(reader["Deaths"]),
                Convert.ToInt32(reader["HighestWave"]));

            Stats s = new StatsSQLContext().GetById(Convert.ToInt32(reader["sId"]));
            Class c = new ClassSQLContext().GetById(Convert.ToInt32(reader["cId"]));
            p.Stats = s;
            p.Class = c;
            p.Inventory = new InventorySQLContext().GetInventory(p);
            return p;
        }
    }
}