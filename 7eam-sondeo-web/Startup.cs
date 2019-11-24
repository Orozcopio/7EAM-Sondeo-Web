using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(_7eam_sondeo_web.Startup))]
namespace _7eam_sondeo_web
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
