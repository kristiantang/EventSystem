using EventSystem.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace EventSystem.Controllers
{
    public class EventsController : ApiController
    {
        private DataContext _db = new DataContext();

        [Route("search")]
        public List<Events> GetTaskByName(string name)
        {
            return _db.Events.Where(p => name != null ? p.Name.StartsWith(name) : true).ToList();
        }

        [HttpGet]
        public List<Events> GetAll()
        {
            var data = _db.Events.OrderBy(p => p.Id).ToList();
            return data;
        }

        [HttpGet]
        public IHttpActionResult GetById(int Id)
        {
            Events events = _db.Events.Where(p => p.Id == Id).FirstOrDefault();
            if (events == null)
            {
                return NotFound();
            }
            return Ok(events);
        }
    }
}
