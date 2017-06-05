using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using MamalianDAL.Data;
using MamalianLib;

namespace MamalianDAL.Logic {
    public class EnemySQLContext : IEnemyContext {
        public List<Enemy> GetAll() {
            List<Enemy> result = new List<Enemy>();
            SqlConnection con = Database.connection;
            string query = "SELECT " +
                           "e.Id as eId, e.Name, e.Gender, e.Race, e.PhysDamage, e.ElemDamage, e.PhysReduction, e.ElemReduction, " +
                           "s.Id as sId, s.Level, s.Experience, s.Health, s.Spirit, s.HealthRegen, s.SpiritRegen, s.Strength, s.Dexterity, s.Intelligence " +
                           "FROM EnemyStats " +
                           "INNER JOIN Enemy e on EnemyStats.EnemyId = e.Id " +
                           "INNER JOIN Stats s on EnemyStats.StatsId = s.Id ";
            SqlCommand command = new SqlCommand(query, con);
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read()) {
                result.Add(CreateEnemyFromReader(reader));
            }
            return result;
        }

        public Enemy GetById(int id) {
            Enemy result = new Enemy();
            SqlConnection con = Database.connection;
            string query = "SELECT " +
                           "e.Id as eId, e.Name, e.Gender, e.Race, e.PhysDamage, e.ElemDamage, e.PhysReduction, e.ElemReduction, " +
                           "s.Id as sId, s.Level, s.Experience, s.Health, s.Spirit, s.HealthRegen, s.SpiritRegen, s.Strength, s.Dexterity, s.Intelligence " +
                           "FROM EnemyStats " +
                           "full JOIN Enemy e on EnemyStats.EnemyId = e.Id " +
                           "full JOIN Stats s on EnemyStats.StatsId = s.Id " +
                           "WHERE e.Id=@id";
            SqlCommand command = new SqlCommand(query, con);
            command.Parameters.AddWithValue("@id", id);
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read()) {
                result = CreateEnemyFromReader(reader);
            }
            return result;
        }

        public Enemy Insert(Enemy enemy) {
            SqlConnection con = Database.connection;
            string query =
                "INSERT INTO Enemy(Name, Gender, Race, PhysDamage, ElemDamage, PhysReduction, ElemReduction) VALUES(" +
                "@name, @gender, @race, @physD, @elemD, @physR, @elemR)";
            SqlCommand command = new SqlCommand(query, con);
            command.Parameters.AddWithValue("@name", enemy.Name);
            command.Parameters.AddWithValue("@gender", enemy.Gender.ToString());
            command.Parameters.AddWithValue("@race", enemy.Race.ToString());
            command.Parameters.AddWithValue("@physD", enemy.PhysDamage);
            command.Parameters.AddWithValue("@elemD", enemy.ElemDamage);
            command.Parameters.AddWithValue("@physR", enemy.PhysReduction);
            command.Parameters.AddWithValue("@elemR", enemy.ElemReduction);
            command.ExecuteNonQuery();

            query = "SELECT last_insert_rowid()";
            command = new SqlCommand(query, con);
            return CreateEnemyFromReader(command.ExecuteReader());
        }

        public bool Update(Enemy enemy) {
            if (enemy.Stats != null) {
                new StatsSQLContext().Update(enemy.Stats);
            }
            SqlConnection con = Database.connection;
            string query = "UPDATE Enemy " +
                           "SET " +
                           "Name = @name, " +
                           "Gender = @gender, " +
                           "Race = @race, " +
                           "PhysDamage = @physD, " +
                           "ElemDamage = @elemD, " +
                           "PhysReduction = @physR, " +
                           "ElemReduction = @elemR " +
                           "WHERE Id = @id";
            SqlCommand command = new SqlCommand(query, con);
            command.Parameters.AddWithValue("@name", enemy.Name);
            command.Parameters.AddWithValue("@gender", enemy.Gender.ToString());
            command.Parameters.AddWithValue("@race", enemy.Race.ToString());
            command.Parameters.AddWithValue("@physD", enemy.PhysDamage);
            command.Parameters.AddWithValue("@elemD", enemy.ElemDamage);
            command.Parameters.AddWithValue("@physR", enemy.PhysReduction);
            command.Parameters.AddWithValue("@elemR", enemy.ElemReduction);
            command.Parameters.AddWithValue("@id", enemy.Id);
            if (Convert.ToInt32(command.ExecuteNonQuery()) > 0) {
                return true;
            }
            return false;
        }

        public bool Delete(int id) {
            SqlConnection con = Database.connection;
            string query = "DELETE FROM Enemy WHERE Id = @id";
            SqlCommand command = new SqlCommand(query, con);
            command.Parameters.AddWithValue("@id", id);
            if (Convert.ToInt32(command.ExecuteNonQuery()) == 1) {
                return true;
            }
            return false;
        }

        public Enemy CreateEnemyFromReader(SqlDataReader reader) {
            Gender g = (Gender) Enum.Parse(typeof(Gender), Convert.ToString(reader["Gender"]));
            Race r = (Race) Enum.Parse(typeof(Race), Convert.ToString(reader["Race"]));
            Enemy e = new Enemy(
                Convert.ToInt32(reader["eId"]),
                Convert.ToString(reader["Name"]),
                g,
                r,
                Convert.ToInt32(reader["PhysDamage"]),
                Convert.ToInt32(reader["ElemDamage"]),
                Convert.ToInt32(reader["PhysReduction"]),
                Convert.ToInt32(reader["ElemReduction"]));
            if (reader["sId"] != DBNull.Value) {
                Stats s = new StatsSQLContext().GetById(Convert.ToInt32(reader["sId"]));
                e.Stats = s;
            }
            return e;
        }
    }
}