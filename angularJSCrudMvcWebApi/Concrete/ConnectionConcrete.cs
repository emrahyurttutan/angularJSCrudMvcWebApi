using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace _angularjsWebApi.Concrete
{
    public class ConnectionConcrete : IDisposable
    {
        string _connStr = ConfigurationManager.ConnectionStrings["CString"].ConnectionString;
        SqlConnection _conn;
        public ConnectionConcrete()
        {
            _conn = new SqlConnection(_connStr);
            _conn.Open();
        }
        public bool ExecuteNonQuery(string sql, CommandType type = CommandType.Text, params SqlParameter[] parameters)
        {
            try
            {
                var cmd = new SqlCommand
                {
                    Connection = _conn,
                    CommandText = sql,
                    CommandType = type
                };
                cmd.Parameters.AddRange(parameters);
                return Convert.ToBoolean(cmd.ExecuteNonQuery());
            }
            catch (Exception ex)
            {
                return false;
            }
        }
        public IEnumerable<T> ExecuteRead<T>(string sql, CommandType type = CommandType.Text, params SqlParameter[] parameters)where T : new()
        {
            var cmd = new SqlCommand
            {
                Connection = _conn,
                CommandType = type,
                CommandText = sql
            };
            cmd.Parameters.AddRange(parameters);
            var reader = cmd.ExecuteReader();
            var tip = typeof(T);
            while (reader.Read())
            {
                var t = new T();
                foreach (var p in tip.GetProperties())
                {
                    p.SetValue(t, reader[p.Name]);
                }
                yield return t;
            }
        }
        public void Dispose()
        {
            _conn.Close();
            _conn.Dispose();
        }
    }
}