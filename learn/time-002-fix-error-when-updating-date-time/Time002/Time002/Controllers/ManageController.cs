using System;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin.Security;
using Time002.Models;

namespace Time002.Controllers
{
    [Authorize]
    public class ManageController : Controller
    {
        private ApplicationSignInManager _signInManager;
        private ApplicationUserManager _userManager;

        public ManageController()
        {
        }

        public ManageController(ApplicationUserManager userManager, ApplicationSignInManager signInManager)
        {
            UserManager = userManager;
            SignInManager = signInManager;
        }

        public ApplicationSignInManager SignInManager
        {
            get
            {
                return _signInManager ?? HttpContext.GetOwinContext().Get<ApplicationSignInManager>();
            }
            private set
            {
                _signInManager = value;
            }
        }

        public ApplicationUserManager UserManager
        {
            get
            {
                return _userManager ?? HttpContext.GetOwinContext().GetUserManager<ApplicationUserManager>();
            }
            private set
            {
                _userManager = value;
            }
        }

        // GET: /Manage/Index
        public async Task<ActionResult> Index(ManageMessageId? message)
        {
            ViewBag.StatusMessage =
                message == ManageMessageId.ChangePasswordSuccess ? "Your password has been changed."
                : message == ManageMessageId.SetPasswordSuccess ? "Your password has been set."
                : message == ManageMessageId.SetTwoFactorSuccess ? "Your two-factor authentication provider has been set."
                : message == ManageMessageId.Error ? "An error has occurred."
                : message == ManageMessageId.AddPhoneSuccess ? "Your phone number was added."
                : message == ManageMessageId.RemovePhoneSuccess ? "Your phone number was removed."
                : message == ManageMessageId.BirthDetailsUpdated ? "Your birth details have been updated."
                : "";

            var userId = User.Identity.GetUserId();
            var user = await UserManager.FindByIdAsync(userId);

            var model = new IndexViewModel
            {
                HasPassword = HasPassword(),
                PhoneNumber = await UserManager.GetPhoneNumberAsync(userId),
                TwoFactor = await UserManager.GetTwoFactorEnabledAsync(userId),
                Logins = await UserManager.GetLoginsAsync(userId),
                BrowserRemembered = await AuthenticationManager.TwoFactorBrowserRememberedAsync(userId),
                BirthDateTime = user.BirthDate,  // Populate BirthDateTime
                FirstName = user.FirstName,      // Populate FirstName
                MiddleName = user.MiddleName,    // Populate MiddleName
                SecondMiddleName = user.SecondMiddleName, // Populate SecondMiddleName
                LastName = user.LastName,        // Populate LastName
                Suffix = user.Suffix             // Populate Suffix
            };

            return View(model);
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> UpdateBirthDetails(IndexViewModel model)
        {
            if (!ModelState.IsValid)
            {
                return RedirectToAction("Index", new { Message = ManageMessageId.Error });
            }

            var userId = User.Identity.GetUserId();
            var user = await UserManager.FindByIdAsync(userId);

            if (user != null)
            {
                user.BirthDate = model.BirthDateTime;
                user.FirstName = model.FirstName;
                user.MiddleName = model.MiddleName;
                user.SecondMiddleName = model.SecondMiddleName;
                user.LastName = model.LastName;
                user.Suffix = model.Suffix;

                var result = await UserManager.UpdateAsync(user);
                if (result.Succeeded)
                {
                    return RedirectToAction("Index", new { Message = ManageMessageId.BirthDetailsUpdated });
                }

                AddErrors(result);
            }

            return RedirectToAction("Index", new { Message = ManageMessageId.Error });
        }






        // POST: /Manage/RemoveLogin
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> RemoveLogin(string loginProvider, string providerKey)
        {
            ManageMessageId? message;
            var result = await UserManager.RemoveLoginAsync(User.Identity.GetUserId(), new UserLoginInfo(loginProvider, providerKey));
            if (result.Succeeded)
            {
                var user = await UserManager.FindByIdAsync(User.Identity.GetUserId());
                if (user != null)
                {
                    await SignInManager.SignInAsync(user, isPersistent: false, rememberBrowser: false);
                }
                message = ManageMessageId.RemoveLoginSuccess;
            }
            else
            {
                message = ManageMessageId.Error;
            }
            return RedirectToAction("ManageLogins", new { Message = message });
        }

        #region Other Methods (For brevity, unchanged)
        // Other methods like AddPhoneNumber, EnableTwoFactorAuthentication remain unchanged.
        #endregion

        #region Helpers
        // XSRF Protection, Error Management, etc.
        private const string XsrfKey = "XsrfId";

        private IAuthenticationManager AuthenticationManager
        {
            get { return HttpContext.GetOwinContext().Authentication; }
        }

        private void AddErrors(IdentityResult result)
        {
            foreach (var error in result.Errors)
            {
                ModelState.AddModelError("", error);
            }
        }

        private bool HasPassword()
        {
            var user = UserManager.FindById(User.Identity.GetUserId());
            return user?.PasswordHash != null;
        }

        public enum ManageMessageId
        {
            AddPhoneSuccess,
            ChangePasswordSuccess,
            SetTwoFactorSuccess,
            SetPasswordSuccess,
            RemoveLoginSuccess,
            RemovePhoneSuccess,
            Error,
            BirthDetailsUpdated // New Message
        }
        #endregion
    }
}
