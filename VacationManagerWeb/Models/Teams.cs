using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace VacationManagerWeb.Models
{
    public class Teams
    {
        [Key]
        public int Id { get; set; }    
        [Required]
        [MaxLength(32)]
        public string Name { get; set; }

        public string? Developers { get; set; }

        [ForeignKey("Projects")]
        public int ProjectId { get; set; }
        public Projects Projects { get; set; }

        [ForeignKey("Users")]
        public int TeamLeader { get; set; }
        public Users Users { get; set; }

        public ICollection<Projects> Project { get; set; } = new HashSet<Projects>();
        public ICollection<Users> User { get; set; } = new HashSet<Users>();

    }
}
