using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using MamalianASP.Models;
using MamalianDAL;
using MamalianDAL.Logic;
using MamalianDAL.Repo;
using MamalianLib;

namespace MamalianASP.Controllers {
    public class GameController : Controller {
        private int playerId;
        // GET: Game
        public ActionResult Character() {
            return View();
        }

        public ActionResult Select() {
            return View(new CharacterSelectModel());
        }

        public ActionResult Play(int id) {
            Player p = new PlayerRepository(new PlayerSQLContext()).GetById(id);
            if (p != null) {
                return View(p);
            }
            return Content("Please enter an existing ID");
        }

        [HttpPost]
        public ActionResult CreatePlayer(CharacterViewModel model) {
            string name = model.Name;
            int strength = model.Strength;
            int dexterity = model.Dexterity;
            int intelligence = model.Intelligence;
            Gender gender = model.Gender;
            Race race = model.Race;
            Models.Class c = model.Class;
            switch (race) {
                case Race.Cat:
                    strength = 8;
                    dexterity = 8;
                    intelligence = 5;
                    break;
                case Race.Dog:
                    strength = 8;
                    dexterity = 5;
                    intelligence = 8;
                    break;
                case Race.Fish:
                    strength = 3;
                    dexterity = 10;
                    intelligence = 8;
                    break;
                case Race.Bird:
                    strength = 4;
                    dexterity = 7;
                    intelligence = 10;
                    break;
                case Race.Horse:
                    strength = 10;
                    dexterity = 6;
                    intelligence = 5;
                    break;
            }
            Player p = new Player(name, gender, race, c.ToString(), strength, dexterity, intelligence);
            var repo = new PlayerRepository(new PlayerSQLContext());
            Player player = repo.Insert(p);
            playerId = player.Id;
            return RedirectToAction("CreatedPlayer", "Game", new {id = player.Id});
        }

        public ActionResult CreatedPlayer(int id) {
            var repo = new PlayerRepository(new PlayerSQLContext());
            Player p = repo.GetById(id);
            var select = new CharacterSelectModel();
            select.SelectedPlayer = p;
            select.SelectedPlayerId = p.Id;
            playerId = p.Id;
            return View(select);
        }

        [HttpPost]
        public ActionResult StartPlaying(CharacterSelectModel model) {
            return RedirectToAction("Play", "Game", new {Id = model.SelectedPlayerId});
        }
    }
}