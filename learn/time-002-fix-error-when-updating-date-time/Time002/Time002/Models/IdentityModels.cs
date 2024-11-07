using System.Data.Entity;
using System.Security.Claims;
using System.Threading.Tasks;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using System;
using System.ComponentModel.DataAnnotations;

namespace Time002.Models
{
    public class ApplicationUser : IdentityUser
    {
        [Required(ErrorMessage = "First Name is required.")]
        [StringLength(50, ErrorMessage = "First Name cannot be longer than 50 characters.")]
        public string FirstName { get; set; }

        [StringLength(50, ErrorMessage = "Middle Name cannot be longer than 50 characters.")]
        public string MiddleName { get; set; } // Optional

        [Required(ErrorMessage = "Last Name is required.")]
        [StringLength(50, ErrorMessage = "Last Name cannot be longer than 50 characters.")]
        public string LastName { get; set; }

        [StringLength(10, ErrorMessage = "Suffix cannot be longer than 10 characters.")]
        public string Suffix { get; set; } // Optional

        [StringLength(50, ErrorMessage = "Second Middle Name cannot be longer than 50 characters.")]
        public string SecondMiddleName { get; set; } // Optional

        [Required(ErrorMessage = "Birth Date is required.")]
        public DateTime BirthDate { get; set; } // Stores date and time for birthdate

        public async Task<ClaimsIdentity> GenerateUserIdentityAsync(UserManager<ApplicationUser> manager)
        {
            var userIdentity = await manager.CreateIdentityAsync(this, DefaultAuthenticationTypes.ApplicationCookie);
            return userIdentity;
        }
    }


    public class ApplicationDbContext : IdentityDbContext<ApplicationUser>
    {
        public ApplicationDbContext()
            : base("DefaultConnection", throwIfV1Schema: false)
        {
        }

        public static ApplicationDbContext Create()
        {
            return new ApplicationDbContext();
        }
    }
}