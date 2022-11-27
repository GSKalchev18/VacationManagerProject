using Microsoft.EntityFrameworkCore;
using VacationManagerWeb.Models;

namespace VacationManagerWeb.Data
{
    public class ApplicationDbContext : DbContext
    {
        public DbSet<Users> Users { get; set; }
        public DbSet<Teams> Teams { get; set; }
        public DbSet<Vacations> Vacations { get; set; }
        public DbSet<Projects> Projects { get; set; }

        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : base(options)
        {

        }
    }
}
