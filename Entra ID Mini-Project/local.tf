locals {
  domain_names = data.azuread_domains.this.domains[*].domain_name # Extracting domain names from the data source
  users        = csvdecode(file("users.csv"))                     # Decoding CSV file into a map
}