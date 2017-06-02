using System.Data.SqlClient;

namespace MamalianDAL.Data {
    public class Database {
        private static readonly string connectionString = "Data Source=DESKTOP-V8K6H38;Initial Catalog=Mamalian;Integrated Security=True";

        public static SqlConnection connection {
            get {
                SqlConnection connection = new SqlConnection(connectionString);
                connection.Open();
                return connection;
            }
        }
    }
}
