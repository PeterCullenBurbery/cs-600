namespace Time002.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class AddUserDetails : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.AspNetUsers", "FirstName", c => c.String(nullable: false, maxLength: 50));
            AddColumn("dbo.AspNetUsers", "MiddleName", c => c.String(maxLength: 50));
            AddColumn("dbo.AspNetUsers", "LastName", c => c.String(nullable: false, maxLength: 50));
            AddColumn("dbo.AspNetUsers", "Suffix", c => c.String(maxLength: 10));
            AddColumn("dbo.AspNetUsers", "SecondMiddleName", c => c.String(maxLength: 50));
            AlterColumn("dbo.AspNetUsers", "BirthDate", c => c.DateTime(nullable: false));
        }
        
        public override void Down()
        {
            AlterColumn("dbo.AspNetUsers", "BirthDate", c => c.DateTime());
            DropColumn("dbo.AspNetUsers", "SecondMiddleName");
            DropColumn("dbo.AspNetUsers", "Suffix");
            DropColumn("dbo.AspNetUsers", "LastName");
            DropColumn("dbo.AspNetUsers", "MiddleName");
            DropColumn("dbo.AspNetUsers", "FirstName");
        }
    }
}
