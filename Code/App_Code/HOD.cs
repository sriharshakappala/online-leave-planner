using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;


/// <summary>
/// Summary description for HOD
/// </summary>
public class HOD
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

    public HOD()
    {

    }

    public HOD(String FacultyId, int Priority)
    {
        this.FacultyId = FacultyId;
        this.Priority = Priority;
    }

    public bool Save()
    {
        if (FacultyId == null || Priority == null)
            throw new InvalidValueException("FacultyId and Priority should not be NULL");
        return Database.ExecuteNonQuery("INSERT INTO HOD VALUES('" + FacultyId + "'," + Priority + ")") == 1;
    }

    public bool Update()
    {
        if (FacultyId == null || Priority == null)
            throw new InvalidValueException("FacultyId and Priority should not be NULL");
        return Database.ExecuteNonQuery("UPDATE HOD SET Faculty_Id='" + FacultyId + "',Priority=" + Priority + " WHERE Faculty_Id = '" + OldFacultyId + "'") == 1;
    }

    public static HOD GetByFacultyId(string FacultyId)
    {
        DataTable dt = Database.ExecuteQuery("SELECT * FROM HOD WHERE Faculty_Id='" + FacultyId + "'");
        if (dt != null && dt.Rows.Count == 1)
        {
            HOD h = new HOD();
            h.FacultyId = dt.Rows[0][0].ToString();
            h.Priority = int.Parse(dt.Rows[0][1].ToString());
            return h;
        }
        return null;
    }

    public static HOD GetByPriority(String DepartmentId,int Priority)
    {
        DataTable dt = Database.ExecuteQuery("SELECT h.Faculty_Id,h.Priority FROM HOD h,Faculty f WHERE h.Faculty_Id = f.User_Name AND h.Priority=" + Priority + " AND f.Department_Id = '"+DepartmentId+"'" );
        
        if (dt != null && dt.Rows.Count == 1)
        {
            HOD h = new HOD();
            h.FacultyId = dt.Rows[0][0].ToString();
            h.Priority = int.Parse(dt.Rows[0][1].ToString());
            return h;
        }
        return null;
    }

    public static HOD GetCurrentHOD(String DepartmentId)
    {
        String Query = "SELECT User_Name FROM [Current_HODs_View] WHERE Department_Id = '" + DepartmentId + "'";
        DataTable dt = Database.ExecuteQuery(Query);
        if (dt != null && dt.Rows.Count > 0)
        {
            String FacultyId = dt.Rows[0][0].ToString();
            return HOD.GetByFacultyId(FacultyId);
        }
        return null;
    }
}