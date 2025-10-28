# -------------------------------
# This Terraform configuration retrieves and outputs the domains associated with an Azure AD tenant.
# -------------------------------
data "azuread_domains" "this" {}


# -------------------------------
# This Terraform configuration creates Azure AD users.
# -------------------------------


resource "azuread_user" "this" {
  for_each = { for i in local.users : i.first_name => i }

  user_principal_name   = "${each.value.first_name}.${each.value.last_name}@${local.domain_names[0]}"
  display_name          = "${each.value.first_name} ${each.value.last_name}"
  job_title             = each.value.job_title
  department            = each.value.department
  password              = "P@ssw0rd1234!" # Use a secure password in production
  force_password_change = true

}

# -------------------------------
# This Terraform configuration creates groups and assigns users to them based on their job titles.  
# -------------------------------
resource "azuread_group" "Manager" {
  display_name = var.Manager
  security_enabled = true
  members      = compact([for x in local.users : x.job_title == "Manager" ? azuread_user.this[x.first_name].id : ""])
}

resource "azuread_group" "Engineer" {
  display_name = var.Engineer
  security_enabled = true
  members      = compact([for y in local.users : y.job_title == "Engineer" ? azuread_user.this[y.first_name].id : ""])
}