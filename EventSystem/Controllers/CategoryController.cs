using EventSystem.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace EventSystem.Controllers
{
    public class CategoryController : ApiController
    {
        private DataContext _db = new DataContext();

        [HttpGet]
        public List<Categories> GetAll()
        {
            return _db.Categories.OrderBy(p => p.Id).ToList();
        }

        [HttpGet]
        public IHttpActionResult GetById(int Id)
        {
            Categories categories = _db.Categories.Where(p => p.Id == Id).FirstOrDefault();
            if (categories == null)
            {
                return NotFound();
            }
            return Ok(categories);
        }
    }
}
