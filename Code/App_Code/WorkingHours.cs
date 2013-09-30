using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
/// <summary>
/// Summary description for WorkingHours
/// </summary>
public class WorkingHours
{

    #region PrivateData
    private int _id;
    private String _facultyId;
    private int _day;
    private int _sectionId;
    private int _periodId;
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

    public int Day
    {
        get { return _day; }
        set { _day = value; }
    }

    public int SectionId
    {
        get { return _sectionId; }
        set { _sectionId = value; }
    }
    public int PeriodId
    {
        get { return _periodId; }
        set { _periodId = value; }
    }
    #endregion

    #region Constructors
    public WorkingHours()
    {
    }

    public WorkingHours(String FacultyId, int Day, int SectionId, int PeriodId)
    {
        this.FacultyId = FacultyId;
        this.Day = Day;
        this.SectionId = SectionId;
        this.PeriodId = PeriodId;
    }
    #endregion

    #region Methods
    public bool Save()
    {
        if (Day == null || SectionId == null || PeriodId == null)
            throw new InvalidValueException("Day,SectionId and PeriodId should not be NULL");
        String FID = FacultyId == null ? "null" : "'" + FacultyId + "'";
        return Database.ExecuteNonQuery("INSERT INTO Working_Hours VALUES(" + FID + "," + Day + "," + SectionId + "," + PeriodId + ")") == 1;
    }

    public bool Update()
    {
        if (Day == null || SectionId == null || PeriodId == null)
            throw new InvalidValueException("Day,SectionId and PeriodId should not be NULL");
        return Database.ExecuteNonQuery("UPDATE Working_Hours SET Faculty_Id='" + FacultyId + "',Day=" + Day + ",Section_Id=" + SectionId + " Period_Id=" + PeriodId + " WHERE Id = " + Id) == 1;
    }

    public static WorkingHours[] GetBySectionId(int SectionId)
    {
        DataTable dt = Database.ExecuteQuery("SELECT * FROM Working_Hours WHERE Section_Id = " + SectionId);
        if (dt != null && dt.Rows.Count >= 1)
        {
            WorkingHours[] wh = new WorkingHours[dt.Rows.Count];
            int i = 0;
            foreach (DataRow r in dt.Rows)
            {
                wh[i] = new WorkingHours();
                wh[i].Id = int.Parse(r[0].ToString());
                wh[i].FacultyId = r[1].ToString();
                wh[i].Day = int.Parse(r[2].ToString());
                wh[i].SectionId = int.Parse(r[3].ToString());
                wh[i].PeriodId = int.Parse(r[4].ToString());
                i++;
            }
            return wh;
        }
        return null;
    }

    public static WorkingHours[] Get(string FacultyId, int Day,String Session)
    {
        DataTable dt = Database.ExecuteQuery("SELECT * FROM Working_Hours_View WHERE Faculty_Id = '" +FacultyId+"' AND Day = " + Day +" AND Session <> '"+Session+"'");
        if (dt != null && dt.Rows.Count >= 1)
        {
            WorkingHours[] wh = new WorkingHours[dt.Rows.Count];
            int i = 0;
            foreach (DataRow r in dt.Rows)
            {
                wh[i] = new WorkingHours();
                wh[i].Id = int.Parse(r[0].ToString());
                wh[i].FacultyId = r[1].ToString();
                wh[i].Day = int.Parse(r[2].ToString());
                wh[i].SectionId = int.Parse(r[3].ToString());
                wh[i].PeriodId = int.Parse(r[4].ToString());
                i++;
            }
            return wh;
        }
        return null;
    }

    public static String GetClass(string FacultyId, int Day, DateTime StartTime,DateTime EndTime)
    {
        DataTable dt = Database.ExecuteQuery("SELECT Year,Department_Id,Section_Name FROM Working_Hours_View WHERE Faculty_Id = '" + FacultyId + "' AND Day = " + Day + " AND dbo.ExtractTime(Start_Time) = dbo.ExtractTime('" + StartTime.ToString("HH:mm") + "') AND dbo.ExtractTime(End_Time) = dbo.ExtractTime('" + EndTime.ToString("HH:mm") + "')");
        if (dt != null && dt.Rows.Count >= 1)
        {
            return dt.Rows[0][0] + "-" + dt.Rows[0][1] + "-" + dt.Rows[0][2];
        }
        return " ";
    }
    public bool Delete()
    {
        return Database.ExecuteNonQuery("DELETE FROM Working_Hours WHERE Id=" + Id) == 1;
    }

    public static int CreateEmptyCells(int SectionId, int TemplateId)
    {
        Period[] periods = Period.GetByTemplateId(TemplateId);

        for (int i = 1; i <= 6; i++)                           // 1--6  -->  Monday--Saturday
        {
            foreach (Period p in periods)
            {
                if (!WorkingHours.IsExists(i, SectionId, p.Id))
                {
                    WorkingHours wh = new WorkingHours(null, i, SectionId, p.Id);
                    wh.Save();
                }
            }
        }
        return periods.Length;
    }

    public static int DeleteEmptyCells(int SectionId)
    {
        return Database.ExecuteNonQuery("DELETE FROM Working_Hours WHERE Section_Id=" + SectionId + " AND Faculty_Id IS NULL");
    }

    public static bool IsExists(int Day, int SectionId, int PeriodId)
    {
        DataTable dt = Database.ExecuteQuery("SELECT * FROM Working_Hours WHERE Day=" + Day + " AND Section_Id=" + SectionId + " AND Period_Id=" + PeriodId);
        return (dt != null) && (dt.Rows.Count > 0);
    }
    #endregion

}