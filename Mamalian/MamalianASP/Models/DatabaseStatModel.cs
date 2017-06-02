using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MamalianDAL;
using MamalianDAL.Contexts;
using MamalianLib;

namespace MamalianASP.Models {
    public class DatabaseStatModel {
        public int SelectedId { get; set; }
        public IEnumerable<SelectListItem> GetStats() {
            var repo = new Repository<Stats>(new StatsSQLContext());
            var roles = repo.GetAll().Select(x => new SelectListItem {
                Value = x.Id.ToString(),
                Text = x.ToReadableString()
            });

            return new SelectList(roles, "Value", "Text");
        }

        public int Level { get; set; }
        public int Health { get; set; }
        public int Spirit { get; set; }
        public int Strength { get; set; }
        public int Dexterity { get; set; }
        public int Intelligence { get; set; }
    }
}