using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _angularjsWebApi.Repository
{
    public interface IProductRepository<T> where T : class
    {
        T Select(int id);
        List<T> List();
        bool Insert(T model);
        bool Update(T model);
        bool Delete(int id);
    }
}
