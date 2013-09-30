using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// Summary description for Section
/// </summary>
public class Section
{

    #region Private Data

    private int _id;
    private String _departmentId;
    private int _year;
    private String _name;

    #endregion

    #region Properties

    public int Id
    {
        get { return _id; }
        set { _id = value; }
    }

    public String DepartmentId
    {
        get { return _departmentId; }
        set { _departmentId = value; }
    }
    
    public int Year
    {
        get { return _year; }
        set { _year = value; }
    }
    
    public String Name
    {
        get { return _name; }
        set { _name = value; }
    }

    #endregion

    #region Constructors

    public Section()
    {
    }

    public Section(String DepartmentId, int Year, String Name)
    {
        this.DepartmentId = DepartmentId;
        this.Year = Year;
        this.Name = Name;
    }

    #endregion

    #region Methods

    public bool Save()
    {
        if (DepartmentId == null && Name == null)
            throw new InvalidValueException("DepartmentId,Name should not be NULL");
        return Database.ExecuteNonQuery("INSERT INTO Section VALUES('" + DepartmentId + "'," + Year + ",'" + Name + "')") == 1;
    }

    public bool Update()
    {
        if (DepartmentId == null && Name == null)
            throw new InvalidValueException("DepartmentId,Name should not be NULL");
        return Database.ExecuteNonQuery("UPDATE Section SET Department_Id='" + DepartmentId + "',Year=" + Year + ",Name='" + Name + "' WHERE Id = " + Id) == 1;
    }

    public static Section GetById(int Id)
    {
        DataTable dt = Database.ExecuteQuery("SELECT * FROM Section WHERE Id = " + Id);
        if (dt != null && dt.Rows.Count == 1)
        {
            Section s = new Section();
            s.Id = int.Parse(dt.Rows[0][0].ToString());
            s.DepartmentId = dt.Rows[0][1].ToString();
            s.Year = int.Parse(dt.Rows[0][2].ToString());
            s.Name = dt.Rows[0][3].ToString();
            return s;
        }
        return null;
    }

    public static Object GetTemplateId(int SectionId)
    {
        DataTable dt = Database.ExecuteQuery("SELECT     TimeTableTemplate.Id "+
                                             "FROM         Period INNER JOIN "+
                                             "                      TimeTableTemplate ON Period.Template_Id = TimeTableTemplate.Id INNER JOIN "+
                                             "                      Working_Hours ON Period.Id = Working_Hours.Period_Id "+
                                             "WHERE Working_Hours.Section_ID = "+SectionId);
        if (dt != null && dt.Rows.Count >= 1)
            return int.Parse(dt.Rows[0][0].ToString());
        return null;
    }
    #endregion

}