using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MamalianLib {
    public class Team {
        public int Id { get; set; }
        public Player Host { get; set; }
        public Player Client { get; set; }

        public Team(int id, Player host) {
            Id = id;
            Host = host;
        }

        public Team() {
        }

        public void AddClient(Player client) {
            Client = client;
        }

        public override string ToString() {
            return $"Host: {Host.Name}\n" +
                   $"Client: {Client.Name}";
        }
    }
}
