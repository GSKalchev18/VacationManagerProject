using System.ComponentModel.DataAnnotations.Schema;

namespace VacationManagerWeb.Models
{
    public class UsersRoles
    {
        public Users Users { get; set; }
        [ForeignKey("Users")]
        public int UserId { get; set; }


        public Roles Roles { get; set; }
        [ForeignKey("Roles")]
        public int RoleId { get; set; }
    }
}
