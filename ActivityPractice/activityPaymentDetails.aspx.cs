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
    public partial class activityPaymentDetails : System.Web.UI.Page
    {
        /*========= SQL CONNECTION =========*/
        SqlConnection sqlCon = new SqlConnection(@"Data Source=ICTG-UNIT37;initial Catalog=VantageDB;integrated Security=True;");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //Populate dropdownlist
                populateCustomerDropdownList();
                populateProductDropdownList();
            }
        }

        //funtion to populate customer dropdown list
        private void populateCustomerDropdownList()
        {
            //to open sql connection
            if (sqlCon.State == ConnectionState.Closed)
                sqlCon.Open();

            SqlCommand sqlCmd = new SqlCommand("callCustomerColumns", sqlCon);
            sqlCmd.CommandType = CommandType.StoredProcedure;
            SqlDataReader reader = sqlCmd.ExecuteReader();

            var customerName = new List<string>();
            while (reader.Read())
            {
                string fName = reader["firstName"].ToString(); //to fetch the first name in Customer table
                string mName = reader["middleName"].ToString();//to fetch the middle name in Customer table
                string lName = reader["lastName"].ToString();//to fetch the last name in Customer table
                string fullName = $"{fName} {mName} {lName}"; //string interpolation to call the fname, mname, and lname
                customerName.Add(fullName);
            }
            ddlCustomerList.DataSource = customerName;
            ddlCustomerList.DataBind();
            ddlCustomerList.Items.Insert(0, new ListItem("Select Customer", ""));
            reader.Close();
        }


        private void populateProductDropdownList()
        {
            //to open sql connection
            if (sqlCon.State == ConnectionState.Closed)
                sqlCon.Open();

            SqlCommand sqlCmd = new SqlCommand("callProductColumns", sqlCon);
            sqlCmd.CommandType = CommandType.StoredProcedure;
            SqlDataReader reader = sqlCmd.ExecuteReader();

            var products = new List<string>();
            while (reader.Read())
            {
                string proCode = reader["code"].ToString(); //to fetch the first name in Customer table
                string proDesc = reader["productDescription"].ToString();//to fetch the middle name in Customer table
                //string proAmount = reader["amount"].ToString();

                string productList = $"{proCode} - {proDesc}"; //string interpolation to call the fname, mname, and lname
                products.Add(productList);
            }
            ddLProducts.DataSource = products;
            ddLProducts.DataBind();
            ddLProducts.Items.Insert(0, new ListItem("Select Product", "")); //front pick

            reader.Close();
        }



        //function for button to display in the gridview
        protected void btnAddProductTo_Click(object sender, EventArgs e)
        {
            //open connection
            if (sqlCon.State == ConnectionState.Closed)
                sqlCon.Open();

            ddlCustomerList.Enabled = false;
        }


        //display the selected item to textbox customer
        protected void ddlCustomerList_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtCustomerName.Text = ddlCustomerList.SelectedValue;
        }

        //display the selected item to textbox products
        protected void ddLProducts_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtProductName.Text = ddLProducts.SelectedValue; //to display the selected product in a textbox


           /* //open connection
            if (sqlCon.State == ConnectionState.Closed)
                sqlCon.Open();

            string query = "SELECT amount FROM Products WHERE code = @proCode";
            SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
            SqlDataReader reader = sqlCmd.ExecuteReader();
            */



        }




    }
}