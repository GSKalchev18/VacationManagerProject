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

        [ForeignKey("Users")]
        public int? TeamLeader { get; set; }
        public Users? Users { get; set; }

    }
}
