using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MamalianASP.Models;
using MamalianDAL;
using MamalianDAL.Logic;
using MamalianDAL.Repo;
using MamalianLib;

namespace MamalianASP.Controllers
{
    public class DatabaseController : Controller
    {
        // GET: Database
        public ActionResult Index() {
            return View();
        }
        public ActionResult Insert() {
            return View(new DatabaseStatModel());
        }
        public ActionResult Update() {
            return View(new DatabaseStatModel());
        }
        public ActionResult Delete() {
            return View(new DatabaseStatModel());
        }

        public ActionResult InsertFunction(DatabaseStatModel model) {
            var repo = new StatsRepository(new StatsSQLContext());
            Stats s = new Stats(model.Level, 0, model.Health, model.Spirit, 0,0,model.Strength, model.Dexterity, model.Intelligence);
            repo.Insert(s);
            return Content($"Succesfully inserted: {s.ToReadableString()}");
        }
        public ActionResult UpdateFunction(DatabaseStatModel model) {
            var repo = new StatsRepository(new StatsSQLContext());
            Stats s = repo.GetById(model.SelectedId);
            Stats prevS = new Stats(s.Level, s.Experience, s.Health, s.Spirit, s.HealthRegen, s.SpiritRegen, s.Strength, s.Dexterity, s.Intelligence);
            prevS.Id = s.Id;
            if (model.Level != 0) { s.Level = model.Level; }
            if (model.Health != 0) { s.Health = model.Health; }
            if (model.Spirit != 0) { s.Spirit = model.Spirit; }
            if (model.Strength != 0) { s.Strength = model.Strength; }
            if (model.Dexterity != 0) { s.Dexterity = model.Dexterity; }
            if (model.Intelligence != 0) { s.Intelligence = model.Intelligence; }
            repo.Update(s);
            return Content($"Succesfully updated </br>{prevS.ToReadableString()} </br>to </br>{s.ToReadableString()}");
        }
        public ActionResult DeleteFunction(DatabaseStatModel model) {
            var repo = new StatsRepository(new StatsSQLContext());
            repo.Delete(model.SelectedId);
            return Content($"Succesfully removed stat with {model.SelectedId} id");
        }
    }
}