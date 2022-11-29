using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using VacationManagerWeb.Data;
using VacationManagerWeb.Models;

namespace VacationManagerWeb.Controllers
{
    public class ProjectsController : Controller
    {
        private readonly ApplicationDbContext _db;

        public ProjectsController(ApplicationDbContext db)
        {
            _db = db;
        }

        public IActionResult Index()
        {
            IEnumerable<Projects> odjPeojectsList = _db.Projects.ToList();
            return View(odjPeojectsList);
        }

        public IActionResult Create()
        {
            ViewBag.TeamId = new SelectList(_db.Teams, "Id", "Name");
            return View("CreateProject");
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Create(Projects obj)
        {
            if (ModelState.IsValid)
            {
                _db.Projects.Add(obj);
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
            var ProjectFromDb = _db.Projects.Find(id);
            return View("DeleteTeam", ProjectFromDb);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult DeletePost(int? id)
        {
            var obj = _db.Projects.Find(id);
            if (obj == null)
            {
                return NotFound();
            }

            _db.Projects.Remove(obj);
            _db.SaveChanges();
            return RedirectToAction("Index");
        }

        public IActionResult Edit(int? id)
        {
            if (id == null || id == 0)
            {
                return NotFound();
            }
            var ProjectsFromDb = _db.Projects.Find(id);
            ViewBag.TeamId = new SelectList(_db.Teams, "Id", "Name");
            return View("Edit", ProjectsFromDb);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Edit(Projects obj)
        {
            if (ModelState.IsValid)
            {
                _db.Projects.Update(obj);
                _db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(obj);
        }
    }
}
