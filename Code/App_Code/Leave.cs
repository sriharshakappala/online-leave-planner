using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// Summary description for Faculty
/// </summary>
public class Leave
{

    #region Private Data

    private int _id;
    private int _leaveTypeId;
    private String _applierId;
    private String _approverId;
    private DateTime _fromDate;
    private String _fromSession;
    private DateTime _toDate;
    private String _toSession;
    private String _reason;
    private String _phoneNumber;
    private String _status;
    private String _comment;

    #endregion

    #region Properties

    public int Id
    {
        get { return _id; }
        set { _id = value; }
    }

    public int LeaveTypeId
    {
        get { return _leaveTypeId; }
        set { _leaveTypeId = value; }
    }

    public String ApplierId
    {
        get { return _applierId; }
        set { _applierId = value; }
    }

    public String ApproverId
    {
        get { return _approverId; }
        set { _approverId = value; }
    }

    public DateTime FromDate
    {
        get { return _fromDate; }
        set { _fromDate = value; }
    }

    public String FromSession
    {
        get { return _fromSession; }
        set { _fromSession = value; }
    }

    public DateTime ToDate
    {
        get { return _toDate; }
        set { _toDate = value; }
    }

    public String ToSession
    {
        get { return _toSession; }
        set { _toSession = value; }
    }

    public String Reason
    {
        get { return _reason; }
        set { _reason = value; }
    }

    public String PhoneNumber
    {
        get { return _phoneNumber; }
        set { _phoneNumber = value; }
    }

    public String Status
    {
        get { return _status; }
        set { _status = value; }
    }

    public String Comment
    {
        get { return _comment; }
        set { _comment = value; }
    }

    #endregion

    #region Constructors

    public Leave()
    {
    }

    #endregion

    #region Methods

    public static Leave GetById(int Id)
    {
        DataTable dt = Database.ExecuteQuery("SELECT * FROM Leave WHERE Id = " + Id);

        if (dt != null && dt.Rows.Count == 1)
        {
            Leave l = new Leave();
            l.Id = int.Parse(dt.Rows[0][0].ToString());
            l.LeaveTypeId = int.Parse(dt.Rows[0][1].ToString());
            l.ApplierId = dt.Rows[0][2].ToString();
            l.ApproverId = dt.Rows[0][3].ToString();
            l.FromDate = DateTime.Parse(dt.Rows[0][4].ToString());
            l.FromSession = dt.Rows[0][5].ToString();
            l.ToDate = DateTime.Parse(dt.Rows[0][6].ToString());
            l.ToSession = dt.Rows[0][7].ToString();
            l.Reason = dt.Rows[0][8].ToString();
            l.PhoneNumber = dt.Rows[0][9].ToString();
            l.Status = dt.Rows[0][10].ToString();
            l.Comment = dt.Rows[0][11].ToString();

            return l;
        }
        return null;
    }

    public static bool Delete(int Id)
    {
        return Database.ExecuteNonQuery("DELETE FROM Leave WHERE Id=" + Id) == 1;
    }

    public static float LeaveCount(String ApplierId, int Month, int LeaveTypeId)
    {
        String Query = "SELECT From_Date,From_Session,To_Date,To_Session FROM Leave WHERE DatePart(month,From_Date) <= " + Month + " AND " + Month + " <= DatePart(month,To_Date) AND Status='Approved' AND Applier_Id='" + ApplierId + "' AND Leave_Type_Id = " + LeaveTypeId;
        DataTable dt = Database.ExecuteQuery(Query);
        float Count = 0;

        if (dt != null && dt.Rows.Count > 0)
        {
            foreach (DataRow dr in dt.Rows)
            {
                DateTime fd = DateTime.Parse(dr[0].ToString());
                String fs = dr[1].ToString();
                DateTime td = DateTime.Parse(dr[2].ToString());
                String ts = dr[3].ToString();

                Count += LeaveCount(Month, fd, fs, td, ts);
            }
        }
        return Count;
    }

    public static float LeaveCount(int Month, DateTime FromDate, String FromSession, DateTime ToDate, String ToSession)
    {
        float Count=0;
        if (FromDate.Month == Month && ToDate.Month == Month)
            Count += (ToDate - FromDate).Days + 0.5f + (ToSession=="Morning"?0:0.5f) - (FromSession=="Morning"?0:0.5f);
        else if (FromDate.Month == Month)
            Count += DateTime.DaysInMonth(FromDate.Year, Month) - FromDate.Day + 1 + (FromSession == "Morning" ? 0 : -0.5f);
        else if (ToDate.Month == Month)
            Count += ToDate.Day + (ToSession == "Morning" ? -0.5f : 0);
        else
        {
            if (FromDate.Month < Month)
                Count += DateTime.DaysInMonth(FromDate.Year, Month);
            else
                Count += DateTime.DaysInMonth(FromDate.Year + 1, Month);
        }
        return Count;
    }
    #endregion

}