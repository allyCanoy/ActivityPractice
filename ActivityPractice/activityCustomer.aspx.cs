using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ActivityPractice
{
    public partial class activityCustomer : System.Web.UI.Page
    {
        /*========= SQL CONNECTION =========*/
        SqlConnection sqlCon = new SqlConnection(@"Data Source=ICTG-UNIT37;initial Catalog=VantageDB;integrated Security=True;");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                btnDeleteCustomer.Enabled = false; //disable delete button in page load
                GenerateCustomerID(); //function to generate customer id
                fillGridView(); //function to show data in tables
            }
        }

        /*============================================= CLEAR FUNCTIONS =============================================*/
        protected void btnClearCustomer_Click(object sender, EventArgs e)
        {
            clear();
        }

        public void clear()
        {
            hfCustomer.Value = "";
            txtFname.Text = txtMname.Text = txtLname.Text = txtBirth.Text = txtOcc.Text = "";

            if (isFemale.Checked)
            {
                isFemale.Checked = false;
            }
            if (isMale.Checked)
            {
                isMale.Checked = false;
            }

            lblSuccess.Text = lblError.Text = "";

            btnSaveCustomer.Text = "Insert";
            btnDeleteCustomer.Enabled = false;
        }

        /*============================================= SAVE FUNCTIONS =============================================*/
        protected void btnSaveCustomer_Click(object sender, EventArgs e)
        {
            //open connection
            if (sqlCon.State == ConnectionState.Closed)
                sqlCon.Open();

            //validate if fields are filled
            if(txtFname.Text == "" || txtMname.Text == "" || txtLname.Text == "" || txtBirth.Text == "")
            {
                lblError.Text = "All fields required. Except occupation.";
            }
            else
            {
                try
                {
                    bool rdbtnBit = isFemale.Checked; //boolean for radio button gender

                    //SQL COMMAND
                    SqlCommand sqlCmd = new SqlCommand("createUpdateCustomer", sqlCon);
                    sqlCmd.CommandType = CommandType.StoredProcedure;

                    sqlCmd.Parameters.AddWithValue("@id", (hfCustomer.Value == "" ? 0 : Convert.ToInt32(hfCustomer.Value)));
                    sqlCmd.Parameters.AddWithValue("@cusNum", lblCustomerNumberID.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@fname", txtFname.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@mname", txtMname.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@lname", txtLname.Text.Trim());

                    //date validation [accepts year input from 1901-2023]
                    sqlCmd.Parameters.AddWithValue("@gender", rdbtnBit);
                    sqlCmd.Parameters.AddWithValue("@occ", txtOcc.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@createdDate", DateTime.Now);
                    sqlCmd.Parameters.AddWithValue("@modifiedDate", DateTime.Now);

                    sqlCmd.ExecuteNonQuery();
                    sqlCon.Close();

                    string id = hfCustomer.Value;
                    clear();

                    if (id == "")
                        lblSuccess.Text = "Customer inserted successfully.";
                    else
                        lblSuccess.Text = "Customer updated successfully.";

                    GenerateCustomerID();
                    fillGridView();
                }
                catch(Exception)
                {
                    lblError.Text = "Data is not inserted";
                   // lblError.Text = "[C]The customer already exists.";
                }
            }
        }

        /*============================================= DELETE FUNCTIONS =============================================*/
        protected void btnDeleteCustomer_Click(object sender, EventArgs e)
        {
            if (sqlCon.State == ConnectionState.Closed)
                sqlCon.Open();

            SqlCommand sqlCmd = new SqlCommand("customerDeleteByID", sqlCon);
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.Parameters.AddWithValue("@id", Convert.ToInt32(hfCustomer.Value));
            sqlCmd.ExecuteNonQuery();
            sqlCon.Close();
            clear();

            fillGridView();
            GenerateCustomerID();
        }

        /*============================================= OTHER FUNCTIONS =============================================*/
        //function to display gender "Female" or "Male" in datagridview
        protected string GetGenderText(bool isFemale)
        {
            return isFemale ? "Female" : "Male";
        }

        /*======= FUNCTION TO DATA IN THE TABLE ========*/
        protected void lnk_OnClick(object sender, EventArgs e)
        {
            int id = Convert.ToInt32((sender as LinkButton).CommandArgument);

            if (sqlCon.State == ConnectionState.Closed) //sql connection
                sqlCon.Open();

            /*stored procedure to view and update the data*/
            SqlDataAdapter sqlDa = new SqlDataAdapter("customerViewByID", sqlCon);
            sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
            sqlDa.SelectCommand.Parameters.AddWithValue("@id", id);
            DataTable dtbl = new DataTable();
            sqlDa.Fill(dtbl);
            sqlCon.Close();

            hfCustomer.Value = id.ToString(); //hides the id

            lblCustomerNumberID.Text = dtbl.Rows[0]["customerNumber"].ToString(); //MAY ERROR DITO

            txtFname.Text = dtbl.Rows[0]["firstName"].ToString();
            txtMname.Text = dtbl.Rows[0]["middleName"].ToString();
            txtLname.Text = dtbl.Rows[0]["lastName"].ToString();
            txtBirth.Text = dtbl.Rows[0]["birthdate"].ToString();
            txtOcc.Text = dtbl.Rows[0]["occupation"].ToString();

            btnSaveCustomer.Text = "Update";
            btnDeleteCustomer.Enabled = true;

        }
        /*======= FUNCTION TO FILL TABLE WITH DATA ========*/
        void fillGridView()
        {
            /*to open the sql connection*/
            if (sqlCon.State == ConnectionState.Closed)
                sqlCon.Open();

            /*call stored procedure to view all the data*/
            SqlDataAdapter sqlDa = new SqlDataAdapter("customerViewAll", sqlCon);
            sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable dtbl = new DataTable();
            sqlDa.Fill(dtbl);
            sqlCon.Close();
            gvCustomer.DataSource = dtbl;
            gvCustomer.DataBind();
        }

        /*====================== CUSTOMER ID GENERATE ===================================*/
        
        private string GenerateCustomerID()
        {
            string customerNumber = string.Empty;
            string currentDate = DateTime.Now.ToString("yyyyMMdd"); //get the date today

            /*====================== NEW APPROACH ===================================*/
            int sequenceNumber = 1;

            //keep generating customer numbers until a unique one is found
            while (true)
            {
                customerNumber = currentDate + sequenceNumber.ToString("D4");

                //check if the customer number already exist in the database
                if (!CustomerNumberExistsInDatabase(customerNumber))
                {
                    lblCustomerNumberID.Text = customerNumber;
                    break;
                }
                sequenceNumber++; //increment
                
            }
            return customerNumber;
            //lblCustomerNumberID.Text = customerNumber;
        }

        private bool CustomerNumberExistsInDatabase(string customerNumber)
        {
            if (sqlCon.State == ConnectionState.Closed)
                sqlCon.Open();

            SqlCommand sqlCmd = new SqlCommand("SELECT COUNT(*) FROM Customer WHERE customerNumber = @cusNum", sqlCon);
            sqlCmd.Parameters.AddWithValue("@cusNum", customerNumber);
            int count = (int)sqlCmd.ExecuteScalar();
            return count > 0;
        }



    }
}