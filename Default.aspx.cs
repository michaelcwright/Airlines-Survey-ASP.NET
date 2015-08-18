using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;



public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Page.IsPostBack)
        {
            Page.Validate();
            if (Page.IsValid)
            {

                //transfers input fields to variables
                form1.Visible = false;
                asms.Visible = true;
                string FlightNumber = flightNumber.Text;
                string FlightDate = Date.Text;
                string friendStaffs = friendStaff.SelectedValue;
                string spaceLuggages = spaceLuggage.SelectedValue;
                string comforts = Comfort.SelectedValue;
                string Cleanlinesss = Cleanliness.SelectedValue;
                string Noises = Noise.SelectedValue;

               
                //initiates db
                SqlConnection dbConnection = new SqlConnection("Data Source=.\\SQLEXPRESS;Integrated Security=true");
                try
                {
                    dbConnection.Open();
                    dbConnection.ChangeDatabase("AirlineDatabase");

                }
                catch (SqlException exception)
                {
                    if (exception.Number == 911)
                    {
                        //if doesnt find create db
                        SqlCommand sqlCommand = new SqlCommand("CREATE DATABASE AirlineDatabase", dbConnection);
                        sqlCommand.ExecuteNonQuery();
                        asms.Text = "<p><br />Successfully created the database.</p>";
                        dbConnection.ChangeDatabase("AirlineDatabase");
                    }
                    else
                        Response.Write("<p><br />Error code " + exception.Number
                            + ": " + exception.Message + "</p>");
                }
                finally
                {
                    asms.Text += "<p><br />Successfully selected the database.</p>";
                }
                try
                {
                    string SQLString = "SELECT * FROM survey";
                    SqlCommand checkIDTable = new SqlCommand(SQLString, dbConnection);
                    SqlDataReader idRecords = checkIDTable.ExecuteReader();
                    idRecords.Close();
                }
                catch (SqlException exception)
                {
                    if (exception.Number == 208)
                    {
                        //creates table
                        SqlCommand sqlCommand = new SqlCommand("CREATE TABLE survey (FlightNumber VARCHAR(10), FlightDate VARCHAR(10), FriendStaff VARCHAR(10), SpaceLuggage VARCHAR(10), Comfort VARCHAR(10), Cleanliness VARCHAR(10), Noise VARCHAR(10)  )", dbConnection);
                        sqlCommand.ExecuteNonQuery();
                        asms.Text += "<p><br />Successfully created the table.</p>";
                    }
                    else
                        asms.Text += "<p>Error code " + exception.Number
                            + ": " + exception.Message + "</p>";
                }
                finally
                {
                    //inserts variables into db
                    string surveyInfo = "INSERT INTO survey VALUES('"
                        + FlightNumber + "', '"
                        + FlightDate + "', '"
                        + friendStaffs + "', '"
                        + spaceLuggages + "', '" + comforts + "', '" + Cleanlinesss + "', '" + Noises + "')";
                    SqlCommand sqlCommand = new SqlCommand(surveyInfo, dbConnection);
                    sqlCommand.ExecuteNonQuery();
                }

                //creates text file with date
                string log = @"C:\log" + DateTime.Now.ToString("dd-MM-yyyy hh-mm-ss") + ".txt";
                using (FileStream fs = new FileStream(log, FileMode.Create))
                {
                    using (StreamWriter sw = new StreamWriter(fs))
                    {
                        //writes data into file
                        sw.Write(FlightNumber + sw.NewLine);
                        sw.Write(FlightDate + sw.NewLine);
                        sw.Write(friendStaffs + sw.NewLine);
                        sw.Write(spaceLuggages + sw.NewLine);
                        sw.Write(comforts + sw.NewLine);
                        sw.Write(Cleanlinesss + sw.NewLine);
                        sw.Write(Noises + sw.NewLine);
                    }
                }


                asms.Text += "<br /><p>Thank you for completing the survey!</p>";
                dbConnection.Close();
            }
        }
    }
}
