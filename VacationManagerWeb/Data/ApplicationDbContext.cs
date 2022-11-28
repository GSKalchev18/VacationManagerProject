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
        public DbSet<Roles> Roles { get; set; }

        public DbSet<TeamsProjects> TeamsProjects { get; set; }
        public DbSet<TeamsUsers> TeamsUsers { get; set; }
        public DbSet<UsersRoles> UsersRoles { get; set; }

        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : base(options)
        {

        }
    }
}
