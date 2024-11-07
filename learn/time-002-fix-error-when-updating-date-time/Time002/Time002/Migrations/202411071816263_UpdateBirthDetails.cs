namespace Time002.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class UpdateBirthDetails : DbMigration
    {
        public override void Up()
        {
// DropColumn("dbo.AspNetUsers", "BirthTime");
        }
        
        public override void Down()
        {
            AddColumn("dbo.AspNetUsers", "BirthTime", c => c.Time(precision: 7));
        }
    }
}
