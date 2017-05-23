using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using MamalianASP.Models.API;

namespace MamalianASP.Controllers {
    public class ApiViewController : Controller {
        public ActionResult Index() {
            return View();
        }
    }
}