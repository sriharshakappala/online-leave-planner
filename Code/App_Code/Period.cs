using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// Summary description for Period
/// </summary>
public class Period
{

    #region Private Data

    int _id;
    int _templateId;
    DateTime _startTime;
    String _session;

    #endregion

    #region Properties

    public int Id
    {
        get { return _id; }
        set { _id = value; }
    }
    public int TemplateId
    {
        get { return _templateId; }
        set { _templateId = value; }
    }
    public DateTime StartTime
    {
        get { return _startTime; }
        set { _startTime = value; }
    }
    public String Session
    {
        get { return _session; }
        set { _session = value; }
    }

    #endregion

    #region Constructor

    public Period()
    {
    }

    public Period(int Id, int TemplateId, DateTime StartTime, String Session)
    {
        this.Id = Id;
        this.TemplateId = TemplateId;
        this.StartTime = StartTime;
        this.Session = Session;
    }

    #endregion

    #region Methods

    public bool Save()
    {
        if (TemplateId == null || StartTime == null || Session == null)
            throw new InvalidValueException("TemplateId,StartTime and Session should not be NULL");
        return Database.ExecuteNonQuery("INSERT INTO Period VALUES(" + TemplateId + ",'" + StartTime + "','"+Session+"')") == 1;
    }

    public bool Update()
    {
        if (TemplateId == null || StartTime == null || Session == null)
            throw new InvalidValueException("TemplateId,StartTime and Session should not be NULL");
        return Database.ExecuteNonQuery("UPDATE Period SET Template_Id='" + TemplateId + "',Start_Time='" + StartTime + "', Session = '"+Session+"' WHERE Id = " + Id) == 1;
    }

    public static Period[] GetByTemplateId(int TemplateId)
    {
        DataTable dt = Database.ExecuteQuery("SELECT * FROM Period WHERE Template_Id = " + TemplateId);
        if (dt != null && dt.Rows.Count >= 1)
        {
            Period[] p = new Period[dt.Rows.Count];
            int i = 0;
            foreach (DataRow r in dt.Rows)
            {
                p[i] = new Period();
                p[i].Id = int.Parse(r[0].ToString());
                p[i].TemplateId = int.Parse(r[1].ToString());
                p[i].StartTime = DateTime.Parse(r[2].ToString());
                p[i].Session = r[3].ToString();
                i++;
            }
            return p;
        }
        return null;
    }

    #endregion
}