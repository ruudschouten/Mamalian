using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MamalianDAL {
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
