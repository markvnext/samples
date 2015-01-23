using Microsoft.AspNet.Mvc;
using MvcSample.Web.Models;
using System.IO;
using System.Threading.Tasks;

namespace MvcSample.Web
{
    public class EchoController : Controller
    {
    	[HttpPost("echo")]
        public async Task<IActionResult> Index()
        {
        	using (var reader = new StreamReader(Request.Body))
            {
	            var body = await reader.ReadToEndAsync();
	        	return Content(body);
            }
        } 
    }
}