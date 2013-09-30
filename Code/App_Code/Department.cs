using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// Summary description for Department
/// </summary>
public class Department
{
    private String _id;
    private String _password;
    private String _name;

    private String _oldId;

    public String Id
    {
        get { return _id; }
        set
        {
            if (_id == null)
                _oldId = value;
            else
                _oldId = Id;
            _id = value;
        }
    }

    public String Password
    {
        get { return _password; }
        set { _password = value; }
    }

    public String Name
    {
        get { return _name; }
        set { _name = value; }
    }

    public Department()
    {
    }

    public Department(String Id, String Password, String Name)
    {
        this.Id = Id;
        this.Password = Password;
        this.Name = Name;
    }

    public bool Save()
    {
        if (Id == null || Name == null || Password == null)
            throw new InvalidValueException("ID,Name,Password should not be NULL");
        return Database.ExecuteNonQuery("INSERT INTO Department VALUES('" + Id + "','" + Password + "','" + Name + "')") == 1;
    }

    public bool Update()
    {
        if (Id == null || Name == null || Password == null)
            throw new InvalidValueException("Id,Name,Password should not be NULL");
        return Database.ExecuteNonQuery("UPDATE Department SET Id='" + Id + "',Password='" + Password + "',Name='" + Name + "' WHERE Id = '"+_oldId+"'") == 1;
    }

    public static Department GetById(string Id)
    {
        DataTable dt = Database.ExecuteQuery("SELECT * FROM Department WHERE Id = '" + Id + "'");
        if (dt != null && dt.Rows.Count == 1)
        {
            Department d = new Department();
            d.Id = dt.Rows[0][0].ToString();
            d.Password = dt.Rows[0][1].ToString();
            d.Name = dt.Rows[0][2].ToString();
            return d;
        }
        return null;
    }

    public HOD GetHOD()
    {
        return HOD.GetCurrentHOD(Id);
    }
}