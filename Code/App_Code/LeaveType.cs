using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// Summary description for Department
/// </summary>
public class LeaveType
{
    private int _id;
    private String _name;
    private int _maxLeavesMonth;
    private int _maxLeavesYear;

    public int Id
    {
        get { return _id; }
        set { _id = value; }
    }

    public String Name
    {
        get { return _name; }
        set { _name = value; }
    }

    public int MaxLeavesMonth
    {
        get { return _maxLeavesMonth; }
        set { _maxLeavesMonth = value; }
    }

    public int MaxLeavesYear
    {
        get { return _maxLeavesYear; }
        set { _maxLeavesYear = value; }
    }

    public LeaveType()
    {
    }

    public LeaveType(String Name, int MaxLeavesMonth, int MaxLeavesYear)
    {
        this.Name = Name;
        this.MaxLeavesMonth = MaxLeavesMonth;
        this.MaxLeavesYear = MaxLeavesYear;
    }

    public bool Save()
    {
        if (Name == null)
            throw new InvalidValueException("Name,MaxLeavsMonth,MaxLeavsYear should not be NULL");
        return Database.ExecuteNonQuery("INSERT INTO Leave_Type VALUES('" + Name + "'," + MaxLeavesMonth + "," + MaxLeavesYear + ")") == 1;
    }

    public bool Update()
    {
        if (Name == null)
            throw new InvalidValueException("Name,MaxLeavsMonth,MaxLeavsYear should not be NULL");
        return Database.ExecuteNonQuery("UPDATE Leave_Type SET Name='" + Name + "',MaxLeavsMonth=" + MaxLeavesMonth + ",MaxLeavsYear=" + MaxLeavesYear + " WHERE Id = " + Id) == 1;
    }

    public static LeaveType GetById(string Id)
    {
        DataTable dt = Database.ExecuteQuery("SELECT * FROM Leave_Type WHERE Id = " + Id);
        if (dt != null && dt.Rows.Count == 1)
        {
            LeaveType lt = new LeaveType();
            lt.Id = int.Parse(dt.Rows[0][0].ToString());
            lt.Name = dt.Rows[0][1].ToString();
            lt.MaxLeavesMonth = int.Parse(dt.Rows[0][2].ToString());
            lt.MaxLeavesYear = int.Parse(dt.Rows[0][3].ToString());
            return lt;
        }
        return null;
    }
    public static LeaveType[] GetAll()
    {
        DataTable dt = Database.ExecuteQuery("SELECT * FROM Leave_Type");
        if (dt != null && dt.Rows.Count >= 1)
        {
            LeaveType[] lt = new LeaveType[dt.Rows.Count];
            for (int i = 0; i < lt.Length; i++)
            {
                lt[i] = new LeaveType();
                lt[i].Id = int.Parse(dt.Rows[i][0].ToString());
                lt[i].Name = dt.Rows[i][1].ToString();
                lt[i].MaxLeavesMonth = int.Parse(dt.Rows[i][2].ToString());
                lt[i].MaxLeavesYear = int.Parse(dt.Rows[i][3].ToString());
            }
            return lt;
        }
        return null;
    }
}