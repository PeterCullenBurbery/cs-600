namespace Time.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class AddBirthDateAndTime : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.AspNetUsers", "BirthDate", c => c.DateTime());
            AddColumn("dbo.AspNetUsers", "BirthTime", c => c.Time(precision: 7));
        }
        
        public override void Down()
        {
            DropColumn("dbo.AspNetUsers", "BirthTime");
            DropColumn("dbo.AspNetUsers", "BirthDate");
        }
    }
}
