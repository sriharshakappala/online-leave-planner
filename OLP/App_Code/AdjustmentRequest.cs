using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for AdjustmentRequest
/// </summary>
public class AdjustmentRequest
{
    private int _adjustmentId;

    public int AdjustmentId
    {
        get { return _adjustmentId; }
        set { _adjustmentId = value; }
    }
    private String _facultyId;

    public String FacultyId
    {
        get { return _facultyId; }
        set { _facultyId = value; }
    }
    private String _status;

    public String Status
    {
        get { return _status; }
        set { _status = value; }
    }
    private String _comment;

    public String Comment
    {
        get { return _comment; }
        set { _comment = value; }
    }

	public AdjustmentRequest()
	{
	}

    public bool Save()
    {
        String cmd = "INSERT INTO AdjustmentRequest VALUES(" + AdjustmentId + ",'" + FacultyId + "','" + Status + "','" + Comment + "')";
        return Database.ExecuteNonQuery(cmd) == 1;
    }

    public static void DeletePendingRequests(int AdjustmentId)
    { 
        String cmd = "DELETE FROM AdjustmentRequest WHERE AdjusmentId = "+AdjustmentId+" AND Status!='Approved'";
        Database.ExecuteNonQuery(cmd);
        return;
    }
}