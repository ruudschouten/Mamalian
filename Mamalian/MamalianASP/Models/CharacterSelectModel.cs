using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MamalianDAL;
using MamalianDAL.Logic;
using MamalianDAL.Repo;
using MamalianLib;

namespace MamalianASP.Models
{
    public class CharacterSelectModel
    {
        public int SelectedPlayerId { get; set; }
        public Player SelectedPlayer { get; set; }
        public IEnumerable<SelectListItem> GetPlayers() {
            var playerRepo = new PlayerRepository(new PlayerSQLContext());
            var roles = playerRepo.GetAll().Select(x => new SelectListItem {
                                    Value = x.Id.ToString(),
                                    Text = x.Name
                                });

            return new SelectList(roles, "Value", "Text");
        }
    }
}