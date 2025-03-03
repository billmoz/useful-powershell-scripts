# This should parse inputfile.txt for any email addresses
# and export to a csv file outputfile.txt.
 
# Define the path to the input text file and the output CSV file
$inputFile = "/path/to/your/inputfile.txt"
$outputFile = "/path/to/your/outputfile.csv"

# Read the content of the input text file
$content = Get-Content -Path $inputFile

# Define a regular expression pattern for email addresses
$emailPattern = "[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}"

# Initialize an array to store the extracted email addresses
$emailAddresses = @()

# Loop through each line in the content
foreach ($line in $content) {
    # Find all matches for the email pattern in the current line
    $matches = [regex]::Matches($line, $emailPattern)
    
    # Add each matched email address to the array
    foreach ($match in $matches) {
        $emailAddresses += [PSCustomObject]@{EmailAddress = $match.Value}
    }
}

# Export the array of email addresses to a CSV file
$emailAddresses | Export-Csv -Path $outputFile -NoTypeInformation

Write-Output "Email addresses have been extracted and saved to $outputFile"
