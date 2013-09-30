using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
/// <summary>
/// Summary description for Database
/// </summary>
public class Database
{
    private static string ConnectionString = "Data Source=localhost;Initial Catalog=OLP;Persist Security Info=True;User ID=sa;Password=123";//WebConfigurationManager.OpenWebConfiguration("/OLP").ConnectionStrings.ConnectionStrings["OLPConnectionString"].ConnectionString;
    private static SqlConnection con = new SqlConnection(ConnectionString);
 
    public static DataTable ExecuteQuery(string Query)
    {
        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(Query, con);
        da.Fill(dt);
        return dt; 
    }

    public static int ExecuteNonQuery(string cmdText)
    {
        if(con.State == ConnectionState.Closed)
            con.Open();
        SqlCommand SC = new SqlCommand(cmdText, con);
        return SC.ExecuteNonQuery();
    }

}