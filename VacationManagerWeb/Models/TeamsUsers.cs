using Microsoft.EntityFrameworkCore.Metadata.Internal;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace VacationManagerWeb.Models
{
    public class TeamsUsers
    {

        [Key]
        public int Id { get; set; }

        public Users Users { get; set; }
        [ForeignKey("Users")]
        public int UserId { get; set; }


        public Teams Teams { get; set; }
        [ForeignKey("Teams")]
        public int TeamId { get; set; }
    }
}
