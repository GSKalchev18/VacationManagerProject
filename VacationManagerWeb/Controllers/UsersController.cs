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

        public IActionResult Edit()
        {
            return View("EditUser");
        }

        public IActionResult Details()
        {
            return View("UserDetails");
        }

    }
}
