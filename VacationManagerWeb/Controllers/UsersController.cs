using Microsoft.AspNetCore.Mvc;

namespace VacationManagerWeb.Controllers
{
    public class UsersController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Create()
        {
            return View("CreateUser");
        }
    }
}
