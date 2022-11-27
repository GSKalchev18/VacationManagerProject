using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace VacationManagerWeb.Models
{
    public class Projects
    {
        [Key]
        public int Id { get; set; }
        [MaxLength(300)]
        public string? Description { get; set; }

        [ForeignKey("Teams")]
        public int TeamId { get; set; }
        public Teams Teams { get; set; }

        public ICollection<Teams> Team { get; set; } = new HashSet<Teams>();
    }
}
