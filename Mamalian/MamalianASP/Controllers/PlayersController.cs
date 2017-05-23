using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using MamalianASP.Models;
using MamalianASP.Models.API;
using MamalianDAL;
using MamalianDAL.Contexts;
using MamalianLib;

namespace MamalianASP.Controllers {
    public class PlayersController : ApiController {
        public IEnumerable<PlayerModel> GetAllPlayers() {
            var repo = new Repository<Player>(new PlayerSQLContext());
            var players = repo.GetAll();
            IEnumerable<PlayerModel> list = players.Select(p => new PlayerModel {
                Id = p.Id,
                Name = p.Name,
                Class = p.Class.Name,
                Race = p.Race.ToString(),
                Gender = p.Gender.ToString(),
                Gold = p.Gold,
                Deaths = p.Deaths,
                HighestWave = p.HighestWave
            });
            return list;
        }

        public IHttpActionResult GetPlayer(int id) {
            var product = new Repository<Player>(new PlayerSQLContext()).GetById(id);
            if (product != null) {
                var model = new PlayerModel {
                    Id = product.Id,
                    Name = product.Name,
                    Class = product.Class.Name,
                    Race = product.Race.ToString(),
                    Gender = product.Gender.ToString(),
                    Gold = product.Gold,
                    Deaths = product.Deaths,
                    HighestWave = product.HighestWave
                };
                if (model == null) {
                    return NotFound();
                }
                return Ok(model);
            }
            return NotFound();
        }
    }
}