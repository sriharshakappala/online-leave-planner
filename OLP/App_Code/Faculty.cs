using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// Summary description for Faculty
/// </summary>
public class Faculty
{

    #region Private Data

    private String _userName;
    private String _password;
    private String _securityQuestion;
    private String _answer;
    private String _departmentId;
    private String _name;
    private String _phoneNumber;
    private String _emailId;
    private int _CCLC;

    private String _oldUserName;
    #endregion

    #region Properties

    public String UserName
    {
        get { return _userName; }
        set 
        {
            if (UserName == null)
                _oldUserName = value;
            else
                _oldUserName = UserName;

            _userName = value; 
        }
    }
    public String Password
    {
        get { return _password; }
        set { _password = value; }
    }
    public String SecurityQuestion
    {
        get { return _securityQuestion; }
        set { _securityQuestion = value; }
    }
    public String Answer
    {
        get { return _answer; }
        set { _answer = value; }
    }
    public String DepartmentId
    {
        get { return _departmentId; }
        set { _departmentId = value; }
    }
    public String Name
    {
        get { return _name; }
        set { _name = value; }
    }
    public String PhoneNumber
    {
        get { return _phoneNumber; }
        set { _phoneNumber = value; }
    }
    public String EmailId
    {
        get { return _emailId; }
        set { _emailId = value; }
    }
    public int CCLC
    {
        get { return _CCLC; }
        set { _CCLC = value; }
    }

    #endregion

    #region Constructors

    public Faculty()
    {
    }

    public Faculty(String UserName, String Password, String DepartmentId, String Name, String PhoneNumber, String EmailId)
    {
        this.UserName = UserName;
        this.Password = Password;
        this.DepartmentId = DepartmentId;
        this.Name = Name;
        this.PhoneNumber = PhoneNumber;
        this.EmailId = EmailId;
    }

    #endregion

    #region Methods

    public bool Save()
    {
        if (UserName == null || Password == null || DepartmentId == null || Name == null)
            throw new InvalidValueException("UserName,Password,DepartmentId,Name should not be null");
        return Database.ExecuteNonQuery("INSERT INTO Faculty VALUES('" + UserName + "','" + Password + "','" + SecurityQuestion + "','" + Answer + "','" + DepartmentId + "','" + Name + "','" + PhoneNumber + "','" + EmailId + "'," + CCLC + ")") == 1;
    }

    public static Faculty GetByUserName(String UserName)
    {
        DataTable dt = Database.ExecuteQuery("SELECT * FROM Faculty WHERE User_Name = '" + UserName + "'");
        if (dt != null && dt.Rows.Count == 1)
        {
            Faculty f = new Faculty();
            f.UserName = dt.Rows[0][0].ToString();
            f.Password = dt.Rows[0][1].ToString();
            f.SecurityQuestion = dt.Rows[0][2].ToString();
            f.Answer = dt.Rows[0][3].ToString();
            f.DepartmentId = dt.Rows[0][4].ToString();
            f.Name = dt.Rows[0][5].ToString();
            f.PhoneNumber = dt.Rows[0][6].ToString();
            f.EmailId = dt.Rows[0][7].ToString();
            f.CCLC = int.Parse(dt.Rows[0][8].ToString());
            return f;
        }
        return null;
    }

    public static bool Delete(String UserName)
    {
        return Database.ExecuteNonQuery("DELETE FROM Faculty WHERE User_Name='" + UserName + "'") == 1 ;
    }

    public bool IsHOD()
    {
        HOD h = HOD.GetCurrentHOD(this.DepartmentId);
        if (h == null)      // NO HOD
            return false;
        return h.FacultyId == this.UserName;
    }

    public bool IsPrincipal()
    {
        Principal p = Principal.GetCurrentPrincipal();
        if (p == null)      // NO Principal
            return false;
        return p.FacultyId == this.UserName;
    }
    #endregion

}