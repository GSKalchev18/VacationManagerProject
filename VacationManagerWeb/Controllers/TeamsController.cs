using Microsoft.AspNetCore.Mvc;
using System;
using VacationManagerWeb.Data;
using VacationManagerWeb.Models;

namespace VacationManagerWeb.Controllers
{
    public class TeamsController : Controller
    {
        private readonly ApplicationDbContext _db;

        public TeamsController(ApplicationDbContext db)
        {
            _db = db;
        }

        public IActionResult Index()
        {
            IEnumerable<Teams> odjTeamsList = _db.Teams.ToList();
            return View(odjTeamsList);
        }

        public IActionResult Create()
        {
            //ViewBag.TeamLeader = User;
            return View("CreateTeam");
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Create(Teams obj)
        {
            if (ModelState.IsValid)
            {
                _db.Teams.Add(obj);
                _db.SaveChanges();
                return RedirectToAction("Index");
            }
            return RedirectToAction("Index");
        }
    }
}
