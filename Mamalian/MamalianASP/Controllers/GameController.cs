using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MamalianASP.Models;
using MamalianDAL.Contexts;
using MamalianLib;

namespace MamalianASP.Controllers {
    public class GameController : Controller {
        // GET: Game
        public ActionResult Character() {
            return View();
        }

        public ActionResult Select() {
            return View(new PlayerSQLContext().GetAll());
        }

        public ActionResult Play(Player p) {
            return View(new PlayerSQLContext().GetById(p.Id));
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
            return Content(p.ToString());
        }
    }
}