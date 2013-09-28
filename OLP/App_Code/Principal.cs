using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;


/// <summary>
/// Summary description for Principal
/// </summary>
public class Principal
{
    private String _facultyId;
    private int _priority;

    private String OldFacultyId;

    public String FacultyId
    {
        get { return _facultyId; }
        set
        {
            if (FacultyId == null)
                OldFacultyId = value;
            else
                OldFacultyId = FacultyId;
            _facultyId = value;
        }
    }

    public int Priority
    {
        get { return _priority; }
        set { _priority = value; }
    }

    public Principal()
    {

    }

    public Principal(String FacultyId, int Priority)
    {
        this.FacultyId = FacultyId;
        this.Priority = Priority;
    }

    public bool Save()
    {
        if (FacultyId == null || Priority == null)
            throw new InvalidValueException("FacultyId and Priority should not be NULL");
        return Database.ExecuteNonQuery("INSERT INTO Principal VALUES('" + FacultyId + "'," + Priority + ")") == 1;
    }

    public bool Update()
    {
        if (FacultyId == null || Priority == null)
            throw new InvalidValueException("FacultyId and Priority should not be NULL");
        return Database.ExecuteNonQuery("UPDATE Principal SET Faculty_Id='" + FacultyId + "',Priority=" + Priority + " WHERE Faculty_Id = '" + OldFacultyId + "'") == 1;
    }

    public static Principal GetByFacultyId(string FacultyId)
    {
        DataTable dt = Database.ExecuteQuery("SELECT * FROM Principal WHERE Faculty_Id='" + FacultyId + "'");
        if (dt != null && dt.Rows.Count == 1)
        {
            Principal p = new Principal();
            p.FacultyId = dt.Rows[0][0].ToString();
            p.Priority = int.Parse(dt.Rows[0][1].ToString());
            return p;
        }
        return null;
    }

    public static Principal GetByPriority(int Priority)
    {
        DataTable dt = Database.ExecuteQuery("SELECT * FROM Principal WHERE Priority=" + Priority );
        if (dt != null && dt.Rows.Count == 1)
        {
            Principal p = new Principal();
            p.FacultyId = dt.Rows[0][0].ToString();
            p.Priority = int.Parse(dt.Rows[0][1].ToString());
            return p;
        }
        return null;
    }
    
    public static Principal GetCurrentPrincipal()
    {
        String Query = "SELECT * FROM [Current_Principal_View]";
        DataTable dt = Database.ExecuteQuery(Query);
        if (dt != null && dt.Rows.Count > 0)
        {
            Principal p = new Principal();
            p.FacultyId = dt.Rows[0][0].ToString();
            p.Priority = int.Parse(dt.Rows[0][1].ToString());

            return p;
        }
        return null;
    }
}