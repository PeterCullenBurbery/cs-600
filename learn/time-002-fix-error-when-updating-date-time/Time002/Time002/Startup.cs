using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Time002.Startup))]
namespace Time002
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
