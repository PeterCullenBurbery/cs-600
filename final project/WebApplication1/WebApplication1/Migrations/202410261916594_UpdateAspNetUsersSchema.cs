namespace WebApplication1.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class UpdateAspNetUsersSchema : DbMigration
    {
        public override void Up()
        {

            


        }
        
        public override void Down()
        {

            DropColumn("dbo.AspNetUsers", "Address");
            DropColumn("dbo.AspNetUsers", "Birthdate");
            DropColumn("dbo.AspNetUsers", "Suffix");
            DropColumn("dbo.AspNetUsers", "LastName");
            DropColumn("dbo.AspNetUsers", "SecondMiddleName");
            DropColumn("dbo.AspNetUsers", "MiddleName");

        }
    }
}
