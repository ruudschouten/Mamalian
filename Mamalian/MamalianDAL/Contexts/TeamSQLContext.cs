using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using MamalianLib;

namespace MamalianDAL.Contexts {
    public class TeamSQLContext : IContext<Team> {
        public List<Team> GetAll() {
            List<Team> result = new List<Team>();
            SqlConnection con = Database.connection;
            string query = "SELECT * FROM TeamUpWith";
            SqlCommand command = new SqlCommand(query, con);
            command.Parameters.AddWithValue("@type", 2);
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read()) {
                result.Add(CreateTeamFromReader(reader));
            }
            return result;
        }

        public Team GetById(int id) {
            Team result = new Team();
            SqlConnection con = Database.connection;
            string query = "SELECT * FROM TeamUpWith WHERE SessionId=@id";
            SqlCommand command = new SqlCommand(query, con);
            command.Parameters.AddWithValue("@id", id);
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read()) {
                result = CreateTeamFromReader(reader);
            }
            return result;
        }

        public Team Insert(Team Team) {
            SqlConnection con = Database.connection;
            string query =
                "INSERT INTO TeamUpWith(PlayerHost) VALUES(" +
                "@host)";
            SqlCommand command = new SqlCommand(query, con);
            command.Parameters.AddWithValue("@host", Team.Host.Id);
            command.ExecuteNonQuery();

            return GetById(Team.Id);
        }

        public bool Update(Team Team) {
            if (Team.Client == null) {
                throw new NoNullAllowedException("Client can't be null");}
            SqlConnection con = Database.connection;
            string query = "UPDATE TeamUpWith " +
                           "SET PlayerJoin = @client " +
                           "WHERE SessionId = @id";
            SqlCommand command = new SqlCommand(query, con);
            command.Parameters.AddWithValue("@client", Team.Client.Id);
            command.Parameters.AddWithValue("@id", Team.Id);

            if (Convert.ToInt32(command.ExecuteNonQuery()) > 0) {
                return true;
            }
            return false;
        }

        public bool Delete(int id) {
            SqlConnection con = Database.connection;
            string query = "DELETE FROM TeamUpWith WHERE SessionId = @id";
            SqlCommand command = new SqlCommand(query, con);
            command.Parameters.AddWithValue("@id", id);
            if (Convert.ToInt32(command.ExecuteNonQuery()) == 1) {
                return true;
            }
            return false;
        }

        public Team CreateTeamFromReader(SqlDataReader reader) {
            PlayerSQLContext context = new PlayerSQLContext();
            int h = Convert.ToInt32(reader["PlayerHost"]);
            Player host = context.GetById(h);
            Team t = new Team(Convert.ToInt32(reader["SessionId"]), host);
            if (!String.IsNullOrEmpty(reader["PlayerJoin"].ToString())) {
                Player client = context.GetById(Convert.ToInt32(reader["PlayerJoin"]));
                t.AddClient(client);
            }
            return t;
        }
    }
}
