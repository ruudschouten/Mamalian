using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;
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
    }
}