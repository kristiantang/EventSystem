namespace EventSystem.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class InitialCreate : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Categories",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Name = c.String(nullable: false, maxLength: 50),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.Events",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Name = c.String(nullable: false, maxLength: 255),
                        EventStart = c.DateTime(nullable: false),
                        EventEnd = c.DateTime(nullable: false),
                        Price = c.Decimal(nullable: false, precision: 18, scale: 2),
                        NoOfTickets = c.Int(nullable: false),
                        Description = c.String(),
                        FK_Category = c.Int(nullable: false),
                        FK_Location = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Location", t => t.FK_Location)
                .ForeignKey("dbo.Categories", t => t.FK_Category)
                .Index(t => t.FK_Category)
                .Index(t => t.FK_Location);
            
            CreateTable(
                "dbo.EventsInOrders",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        FK_Event = c.Int(nullable: false),
                        FK_Order = c.Int(nullable: false),
                        Quantity = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Orders", t => t.FK_Order)
                .ForeignKey("dbo.Events", t => t.FK_Event)
                .Index(t => t.FK_Event)
                .Index(t => t.FK_Order);
            
            CreateTable(
                "dbo.Orders",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        FK_Customer = c.Int(nullable: false),
                        FK_Status = c.Int(nullable: false),
                        Created = c.DateTime(nullable: false),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Customers", t => t.FK_Customer)
                .ForeignKey("dbo.Status", t => t.FK_Status)
                .Index(t => t.FK_Customer)
                .Index(t => t.FK_Status);
            
            CreateTable(
                "dbo.Customers",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        FirstName = c.String(nullable: false, maxLength: 50),
                        LastName = c.String(nullable: false, maxLength: 50),
                        Adress = c.String(nullable: false, maxLength: 50),
                        ZipCode = c.Int(nullable: false),
                        City = c.String(nullable: false, maxLength: 50),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.Status",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Name = c.String(nullable: false, maxLength: 50),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.Location",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Adress = c.String(nullable: false, maxLength: 50),
                        Zipcode = c.Int(nullable: false),
                        City = c.String(nullable: false, maxLength: 50),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.Media",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Url = c.String(nullable: false),
                        FK_Type = c.Int(nullable: false),
                        FK_Event = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.MediaTypes", t => t.FK_Type)
                .ForeignKey("dbo.Events", t => t.FK_Event)
                .Index(t => t.FK_Type)
                .Index(t => t.FK_Event);
            
            CreateTable(
                "dbo.MediaTypes",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Name = c.String(nullable: false, maxLength: 50),
                    })
                .PrimaryKey(t => t.Id);
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.Events", "FK_Category", "dbo.Categories");
            DropForeignKey("dbo.Media", "FK_Event", "dbo.Events");
            DropForeignKey("dbo.Media", "FK_Type", "dbo.MediaTypes");
            DropForeignKey("dbo.Events", "FK_Location", "dbo.Location");
            DropForeignKey("dbo.EventsInOrders", "FK_Event", "dbo.Events");
            DropForeignKey("dbo.Orders", "FK_Status", "dbo.Status");
            DropForeignKey("dbo.EventsInOrders", "FK_Order", "dbo.Orders");
            DropForeignKey("dbo.Orders", "FK_Customer", "dbo.Customers");
            DropIndex("dbo.Media", new[] { "FK_Event" });
            DropIndex("dbo.Media", new[] { "FK_Type" });
            DropIndex("dbo.Orders", new[] { "FK_Status" });
            DropIndex("dbo.Orders", new[] { "FK_Customer" });
            DropIndex("dbo.EventsInOrders", new[] { "FK_Order" });
            DropIndex("dbo.EventsInOrders", new[] { "FK_Event" });
            DropIndex("dbo.Events", new[] { "FK_Location" });
            DropIndex("dbo.Events", new[] { "FK_Category" });
            DropTable("dbo.MediaTypes");
            DropTable("dbo.Media");
            DropTable("dbo.Location");
            DropTable("dbo.Status");
            DropTable("dbo.Customers");
            DropTable("dbo.Orders");
            DropTable("dbo.EventsInOrders");
            DropTable("dbo.Events");
            DropTable("dbo.Categories");
        }
    }
}
