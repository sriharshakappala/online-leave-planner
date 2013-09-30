using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

public class InvalidValueException : Exception
{
    String _Message;
    public InvalidValueException(string Message)
    {
        this._Message = Message;   
    }
    public override string Message
    {
        get
        {
            return _Message;
        }
    }
}

/// <summary>
/// Summary description for College
/// </summary>
public class College
{
    private String _Name;
    private String _Password;

    public String Name
    {
        get { return _Name; }
        set { _Name = value; }
    }

    public String Password
    {
        get { return _Password; }
        set { _Password = value; }
    }

    public College()
    {
        
    }

    public bool Save()
    {
        if (Name == null || Password == null)
            throw new InvalidValueException("Name and Password should not be NULL");
        return Database.ExecuteNonQuery("INSERT INTO College VALUES('" + Name + "','" + Password + "')") == 1;
    }

    public bool Update()
    {
        if (Name == null || Password == null)
            throw new InvalidValueException("Name and Password should not be NULL");
        return Database.ExecuteNonQuery("UPDATE College SET Name='"+Name+"',Password='"+Password+"'") == 1;
    }

    public static College GetByName(string Name)
    {
        DataTable dt = Database.ExecuteQuery("SELECT * FROM College WHERE Name='"+Name+"'");
        if (dt != null && dt.Rows.Count == 1)
        {
            College c = new College();
            c.Name = dt.Rows[0][0].ToString();
            c.Password = dt.Rows[0][1].ToString();
            return c;
        }
        return null;
    }

}