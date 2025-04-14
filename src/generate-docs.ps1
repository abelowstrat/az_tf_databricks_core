# Define the base directory where your Terraform modules are located
$baseDir = "."

# Find all directories containing a main.tf file (assuming each module has a main.tf)
$moduleDirs = Get-ChildItem -Path $baseDir -Recurse -Filter "main.tf" | ForEach-Object { $_.Directory.FullName } | Sort-Object -Unique

# Iterate through each module directory and generate documentation
foreach ($dir in $moduleDirs) {
    Write-Host "Generating docs for module: $dir"
    terraform-docs markdown table $dir > "$dir\README.md"
}

Write-Host "Documentation generation complete."