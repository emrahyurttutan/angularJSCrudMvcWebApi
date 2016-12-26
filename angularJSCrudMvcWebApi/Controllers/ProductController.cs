using _angularjsWebApi.Concrete;
using _angularjsWebApi.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace _angularjsWebApi.Controllers
{
    public class ProductController : ApiController
    {
        ProductConcrete _pc = new ProductConcrete();
        // GET: api/Product
        public IHttpActionResult Get()
        {
            return Json(_pc.List());
        }

        // GET: api/Product/5
        public IHttpActionResult Get(int id)
        {
            return Json(_pc.Select(id));
        }

        // POST: api/Product
        public bool Post([FromBody]Product value )
        {
            return _pc.Insert(value);
        }

        // PUT: api/Product/5
        public bool Put([FromBody]Product value)
        {
            return _pc.Update(value);
        }

        // DELETE: api/Product/5
        public bool Delete(int id)
        {
            return _pc.Delete(id);
        }
    }
}
