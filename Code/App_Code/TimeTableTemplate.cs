using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// Summary description for Template
/// </summary>
public class TimeTableTemplate
{

    #region Private Data
    int _id;
    String _name;
    int _periodDuration;
    #endregion

    #region Properties
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
    public int PeriodDuration
    {
        get { return _periodDuration; }
        set { _periodDuration = value; }
    }
    #endregion

    #region Constructor
    public TimeTableTemplate()
    {
    }

    public TimeTableTemplate(int Id, String Name, int PeriodDuration)
    {
        this.Id = Id;
        this.Name = Name;
        this.PeriodDuration = PeriodDuration;
    } 
    #endregion

    #region Methods

    public bool Save()
    {
        if (Name == null || PeriodDuration == null )
            throw new InvalidValueException("Name and PeriodDuration should not be NULL");
        return Database.ExecuteNonQuery("INSERT INTO TimeTableTemplate VALUES('"+Name+"',"+PeriodDuration+")") == 1;
    }

    public bool Update()
    {
        if (Name == null || PeriodDuration == null)
            throw new InvalidValueException("Name and PeriodDuration should not be NULL");
        return Database.ExecuteNonQuery("UPDATE TimeTableTemplate SET Name='" + Name + "',Period_Duration=" + PeriodDuration  + " WHERE Id = " + Id) == 1;
    }

    public static int GetNoOfPeriods(int TemplateId)
    {
        DataTable dt = Database.ExecuteQuery("SELECT * FROM Period WHERE Template_Id = " + TemplateId);
        if (dt != null)
            return dt.Rows.Count;
        return 0;
    }
    #endregion

}