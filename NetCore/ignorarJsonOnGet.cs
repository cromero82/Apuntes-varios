// On method ConfigureServices. agrega 

 // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
        // Another statements..
        
        
          services.AddMvc().SetCompatibilityVersion(CompatibilityVersion.Version_2_1)
            // Here solution
            .AddJsonOptions(o =>
            o.SerializerSettings.ReferenceLoopHandling = ReferenceLoopHandling.Ignore)
            // and after another inject dependencies for AddMvc() ... (broken from linea 9)
            .AddSessionStateTempDataProvider();
            
            // Another statements..
        }
        
  // Last solution is equal on .NET MVC5 y MVC6 to:
  //namespace Gijgo.Asp.NET.Examples.Controllers
  //{
    //public class PlayersController : Controller
    //{
        //public JsonResult Get(int? page, int? limit, string sortBy, string direction, string name, string nationality, string placeOfBirth)
        //{
          //return this.Json(new { records, total }, JsonRequestBehavior.AllowGet);
        //}
     //}
  //}
