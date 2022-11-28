using System.ComponentModel.DataAnnotations.Schema;

namespace VacationManagerWeb.Models
{
    public class TeamsProjects
    {

        public Projects Projects { get; set; }
        [ForeignKey("Projects")]
        public int ProjectId { get; set; }


        public Teams Teams { get; set; }
        [ForeignKey("Teams")]
        public int TeamId { get; set; }
    }
}
