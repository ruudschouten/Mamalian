using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MamalianLib;

namespace MamalianDAL.Contexts {
    public class ClassSQLContext :IContext<Class> {
        public List<Class> GetAll() {
            List<Class> result = new List<Class>();
            SqlConnection con = Database.connection;
            string query = "SELECT * FROM Class ORDER BY Id";
            SqlCommand command = new SqlCommand(query, con);
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read()) {
                result.Add(CreateClassFromReader(reader));
            }
            return result;
        }

        public Class GetById(int id) {
            Class result = new Class();
            SqlConnection con = Database.connection;
            string query = "SELECT * FROM Class WHERE Id=@id";
            SqlCommand command = new SqlCommand(query, con);
            command.Parameters.AddWithValue("@id", id);
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read()) {
                result = CreateClassFromReader(reader);
            }
            return result;
        }

        public Class Insert(Class Class) {
            SqlConnection con = Database.connection;
            string query = "INSERT INTO Class(Id, Name, PhysDamage, PhysReduction, ElemDamage, ElemReduction, Skills) VALUES(" +
                           "@id, @name, @physD, @physR, @elemD, @elemR, @skills)";
            SqlCommand command = new SqlCommand(query, con);
            command.Parameters.AddWithValue("@id", Class.Id);
            command.Parameters.AddWithValue("@name", Class.Name);
            command.Parameters.AddWithValue("@physD", Class.PhysDamage);
            command.Parameters.AddWithValue("@physR", Class.PhysReduction);
            command.Parameters.AddWithValue("@elemD", Class.ElemDamage);
            command.Parameters.AddWithValue("@elemR", Class.ElemReduction);
            command.Parameters.AddWithValue("@skills", getSkillsFromList(Class));
            command.ExecuteNonQuery();
            return GetById(Class.Id);
        }

        public bool Update(Class Class) {
            SqlConnection con = Database.connection;
            string query = "UPDATE Class " +
                           "SET " +
                           "Name = @name, " +
                           "PhysDamage = @physD, " +
                           "PhysReduction = @physR, " +
                           "ElemDamage = @elemD, " +
                           "ElemReduction = @elemR, " +
                           "Skills = @skills " +
                           "WHERE Id = @id";
            SqlCommand command = new SqlCommand(query, con);
            command.Parameters.AddWithValue("@name", Class.Name);
            command.Parameters.AddWithValue("@physD", Class.PhysDamage);
            command.Parameters.AddWithValue("@physR", Class.PhysReduction);
            command.Parameters.AddWithValue("@elemD", Class.ElemDamage);
            command.Parameters.AddWithValue("@elemR", Class.ElemReduction);
            command.Parameters.AddWithValue("@skills", getSkillsFromList(Class));
            command.Parameters.AddWithValue("@id", Class.Id);
            
            if (Convert.ToInt32(command.ExecuteNonQuery()) > 0) {
                return true;
            }
            return false;
        }

        public bool Delete(int id) {
            SqlConnection con = Database.connection;
            string query = "DELETE FROM Class WHERE Id = @id";
            SqlCommand command = new SqlCommand(query, con);
            command.Parameters.AddWithValue("@id", id);
            if (Convert.ToInt32(command.ExecuteNonQuery()) == 1) {
                return true;
            }
            return false;
        }

        private string getSkillsFromList(Class c) {
            string skills = "";
            foreach (var skill in c.Skills) {
                skills += $"{skill}, ";
            }
            return skills.Substring(0, skills.Length - 2);
        }

        public Class CreateClassFromReader(SqlDataReader reader) {
            Class c = new Class(
                Convert.ToInt32(reader["Id"]),
                Convert.ToString(reader["Name"]),
                Convert.ToInt32(reader["PhysDamage"]),
                Convert.ToInt32(reader["PhysReduction"]),
                Convert.ToInt32(reader["ElemDamage"]),
                Convert.ToInt32(reader["ElemReduction"]));
            foreach (var skill in Convert.ToString(reader["Skills"]).Split(',')) {
                c.AssignSkills(skill);
            }
            return c;
        }
    }
}
