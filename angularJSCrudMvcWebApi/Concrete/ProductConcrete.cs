
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using _angularjsWebApi.Models;
using _angularjsWebApi.Repository;

namespace _angularjsWebApi.Concrete
{
    public class ProductConcrete:IProductRepository<Product>
    {
        public Product Select(int id)
        {
            using (var db = new ConnectionConcrete())
            {
                return db.ExecuteRead<Product>("SP_Select", CommandType.StoredProcedure, new[] { new SqlParameter("@id", id) }).FirstOrDefault();
            }
        }

        public List<Product> List()
        {
            using (var db = new ConnectionConcrete())
            {
                return db.ExecuteRead<Product>("SPSelectProducts", CommandType.StoredProcedure).ToList();
            }
        }

        public bool Insert(Product model)
        {

            using (var db = new ConnectionConcrete())
            {
                return db.ExecuteNonQuery("SP_Insert",CommandType.StoredProcedure,new []{new SqlParameter("@name",model.Name), new SqlParameter("@price",model.Price)});
            }
        }

        public bool Update(Product model)
        {

            using (var db = new ConnectionConcrete())
            {
                return db.ExecuteNonQuery("SP_Update", CommandType.StoredProcedure, new[] { new SqlParameter("@id", model.Id), new SqlParameter("@name", model.Name), new SqlParameter("@price", model.Price) });
            }
        }

        public bool Delete(int id)
        {

            using (var db = new ConnectionConcrete())
            {
                return db.ExecuteNonQuery("SP_Delete", CommandType.StoredProcedure, new[] { new SqlParameter("@id", id) });
            }
        }
    }
}