using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace VacationManagerWeb.Migrations
{
    public partial class AddVirtualList : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "TeamsId",
                table: "Users",
                type: "int",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_Users_TeamsId",
                table: "Users",
                column: "TeamsId");

            migrationBuilder.AddForeignKey(
                name: "FK_Users_Teams_TeamsId",
                table: "Users",
                column: "TeamsId",
                principalTable: "Teams",
                principalColumn: "Id");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Users_Teams_TeamsId",
                table: "Users");

            migrationBuilder.DropIndex(
                name: "IX_Users_TeamsId",
                table: "Users");

            migrationBuilder.DropColumn(
                name: "TeamsId",
                table: "Users");
        }
    }
}
