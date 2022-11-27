using Microsoft.AspNetCore.Mvc;
using System.Drawing.Printing;
using VacationManagerWeb.Data;
using VacationManagerWeb.Models;

namespace VacationManagerWeb.Controllers
{
    public class UsersController : Controller
    {
        private readonly ApplicationDbContext _db;

        public UsersController(ApplicationDbContext db)
        {
            _db = db;
        }

        public IActionResult Index()
        {
            IEnumerable<Users> odjUsersList = _db.Users.ToList();
            return View(odjUsersList);
        }

        public IActionResult Create()
        {
            return View("CreateUser");
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Create(Users obj)
        {
            if (ModelState.IsValid)
            {
                _db.Users.Add(obj);
                _db.SaveChanges();
                return RedirectToAction("Index");
            }
            return RedirectToAction("Index");
        }

        public IActionResult Edit(int? id)
        {
            if (id==null || id ==0)
            {
                return NotFound();
            }
            var UserFromDb = _db.Users.Find(id);
            return View("EditUser" , UserFromDb);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Edit(Users obj)
        {
            if (ModelState.IsValid)
            {
                _db.Users.Update(obj);
                _db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(obj);
        }

        public IActionResult Delete(int? id)
        {
            if (id == null || id == 0)
            {
                return NotFound();
            }
            var UserFromDb = _db.Users.Find(id);
            return View("DeleteUser", UserFromDb);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult DeletePost(int? id)
        {
            var obj = _db.Users.Find(id);
            if (obj == null)
            {
                return NotFound();
            }

            _db.Users.Remove(obj);
            _db.SaveChanges();
            return RedirectToAction("Index");
        }

        public IActionResult Details(int? id)
        {
            if (id == null || id == 0)
            {
                return NotFound();
            }
            var UserFromDb = _db.Users.Find(id);
            return View("UserDetails", UserFromDb);
        }

    }
}
