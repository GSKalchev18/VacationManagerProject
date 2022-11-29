using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
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
            List<Teams> odjTeamsList = _db.Teams.ToList();
            List<Users> odjUsersList = _db.Users.ToList();
            TeamsUsersModel objTeamsUsersModel = new TeamsUsersModel();
            objTeamsUsersModel.TeamsViewModel = odjTeamsList;
            objTeamsUsersModel.UsersViewModel = odjUsersList;

            return View(objTeamsUsersModel);
        }

        public IActionResult Create()
        {
            ViewBag.TeamLeader = new SelectList(_db.Users, "Id", "Username");
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

        public IActionResult Delete(int? id)
        {
            if (id == null || id == 0)
            {
                return NotFound();
            }
            var TeamFromDb = _db.Teams.Find(id);
            return View("DeleteTeam", TeamFromDb);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult DeletePost(int? id)
        {
            var obj = _db.Teams.Find(id);
            if (obj == null)
            {
                return NotFound();
            }

            _db.Teams.Remove(obj);
            _db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}
