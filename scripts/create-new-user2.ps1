# Import the CSV file
$users = Import-Csv -Path "path\to\your\users.csv"

# Loop through each user in the CSV file
foreach ($user in $users) {
    # Create a new user
    New-LocalUser -Name $user.Name -Password (ConvertTo-SecureString $user.Password -AsPlainText -Force) -FullName $user.FullName -Description $user.Description
    
    # Add the user to a group if specified
    if ($user.Group) {
        Add-LocalGroupMember -Group $user.Group -Member $user.Name
    }
}

Write-Host "User creation process completed."