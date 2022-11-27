using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace VacationManagerWeb.Models
{
    public class Vacations
    {
        [Key]
        public int Id { get; set; }

        public DateOnly? DateFrom { get; set; }
        public DateOnly? DateTo { get; set; }
        public DateTime DateRequest { get; set; } = DateTime.Now;

        public bool? HalfDay { get; set; }
        public bool? Accpeted { get; set; }

        [ForeignKey("Users")]
        public int Applicant { get; set; }
        public Users Users { get; set; }
    }
}
