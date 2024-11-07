namespace Time002.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class RemoveBirthTimeColumn : DbMigration
    {
        public override void Up()
        {
            DropColumn("dbo.AspNetUsers", "BirthTime"); // Remove BirthTime
                                                        // BirthDate remains unchanged
        }

        public override void Down()
        {
            AddColumn("dbo.AspNetUsers", "BirthTime", c => c.Time(nullable: true, precision: 7)); // Revert if needed
        }
    }
}
