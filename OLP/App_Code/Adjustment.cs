using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
/// <summary>
/// Summary description for Adjustment
/// </summary>
public class Adjustment
{

    #region PrivateData
    private int _id;
    private int _leaveId;
    private int _workingHourId;
    private DateTime _date;
    private String _facultyId;
    #endregion

    #region Properties
    public int Id
    {
        get { return _id; }
        set { _id = value; }
    }

    public String FacultyId
    {
        get { return _facultyId; }
        set { _facultyId = value; }
    }

    public int LeaveId
    {
        get { return _leaveId; }
        set { _leaveId = value; }
    }

    public int WorkingHourId
    {
        get { return _workingHourId; }
        set { _workingHourId = value; }
    }
    public DateTime Date
    {
        get { return _date; }
        set { _date = value; }
    }
    #endregion

    #region Constructors

    public Adjustment()
    {
    }
    public Adjustment(int LeaveId, int WorkingHourId, DateTime Date, String FacultyId)
    {
        this.LeaveId = LeaveId;
        this.WorkingHourId = WorkingHourId;
        this.Date = Date;
        this.FacultyId = FacultyId;
    }

    #endregion

    #region Methods

    public bool Save()
    {
        if (LeaveId == null || WorkingHourId == null || Date == null)
            throw new InvalidValueException("LeaveId,WorkingHourId,Date should not be NULL");
        return Database.ExecuteNonQuery("INSERT INTO Adjustment VALUES(" + LeaveId + "," + WorkingHourId + ",'" + Date.ToString("MM/dd/yyyy") + "',NULL)") == 1;
    }

    public bool Update()
    {
        if (LeaveId == null || WorkingHourId == null || Date == null)
            throw new InvalidValueException("LeaveId,WorkingHourId,Date should not be NULL");
        String FID = FacultyId == null ? "null" : "'" + FacultyId + "'";
        return Database.ExecuteNonQuery("UPDATE Adjustment SET Faculty_Id='" + FacultyId + "',Date='" + Date.ToString("MM/dd/yyyy") + "',Leave_Id=" + LeaveId + ", Working_Hour_Id=" + WorkingHourId + " WHERE Id = " + Id) == 1;
    }

    public static Adjustment GetById(int Id)
    {
        String Query = "SELECT * FROM Adjustment WHERE Id = " + Id;
        DataTable dt = Database.ExecuteQuery(Query);
        if (dt != null && dt.Rows.Count > 0)
        {
            Adjustment a = new Adjustment();
            a.Id = int.Parse(dt.Rows[0][0].ToString());
            a.LeaveId = int.Parse(dt.Rows[0][1].ToString());
            a.WorkingHourId = int.Parse(dt.Rows[0][2].ToString());
            a.Date = DateTime.Parse(dt.Rows[0][3].ToString());
            a.FacultyId = dt.Rows[0][4].ToString();

            return a;
        }
        return null;
    }
    public static bool CreateAdjustments(int LeaveId, DateTime Date,String Session ,string FacultyId)
    {
        WorkingHours[] whs = WorkingHours.Get(FacultyId, (int)Date.DayOfWeek,Session);
        if( whs != null)
        foreach (WorkingHours wh in whs)
        {
            new Adjustment(LeaveId, wh.Id, Date, null).Save();
        }

        return true; ;
    }

    public bool Delete()
    {
        return Database.ExecuteNonQuery("DELETE FROM Adjustment WHERE Id=" + Id) == 1;
    }

    #endregion
}