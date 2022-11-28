using System.ComponentModel.DataAnnotations;

namespace VacationManagerWeb.Models
{
    public class Roles
    {
        [Key]
        public int Id { get; set; }
        [Required]
        public bool IsAdmin { get; set; }
    }
}
