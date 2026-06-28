Import-Module WebAdministration

$publishFolder = "$env:WORKSPACE\publish"
$destination = "C:\inetpub\DemoWebApp"

Write-Host "Stopping IIS Website..."
Stop-WebSite -Name "Default Web Site"

Write-Host "Cleaning deployment folder..."
if (Test-Path $destination) {
    Remove-Item "$destination\*" -Recurse -Force
} else {
    New-Item -ItemType Directory -Path $destination
}

Write-Host "Copying published files..."
Copy-Item "$publishFolder\*" $destination -Recurse -Force

Write-Host "Starting IIS Website..."
Start-WebSite -Name "Default Web Site"

Write-Host "Deployment completed."
