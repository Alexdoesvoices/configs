function alias-list {

    # Define the directory path

    $AliasPath = "C:\Users\alexr\scripts\ps"


    Write-Host "Scanning custom alias scripts in: $AliasPath" -ForegroundColor Cyan

    

    # Iterate through all .ps1 files in the directory

    Get-ChildItem -Path $AliasPath -Filter "*.ps1" | ForEach-Object {

        

        # Display the file name in Green

        Write-Host "`n--- $($_.Name) ---" -ForegroundColor Green

        

        # Array to hold PSCustomObjects for sorting purposes

        $AliasObjects = @()


        # 1. Get content and filter for lines containing 'Set-Alias'

        $rawLines = Get-Content $_.FullName | 

            Select-String -Pattern 'Set-Alias ' | 

            Select-Object -ExpandProperty Line

            

        # 2. Parse each line using a single regex to extract all required parts

        foreach ($line in $rawLines) {

            # Regex captures:

            # $1: Alias Name (\S+)

            # $2: Function Name (\S+)

            # $3: Optional Description (.*) - captured only if '#' is present

            if ($line -match '^\s*Set-Alias\s+(\S+)\s+(\S+)(?:\s+#\s*(.*))?') {

                

                # Determine the final output description

                $Description = if ($Matches.ContainsKey(3) -and $Matches[3].Trim()) { 

                                    # Use the comment/description if it exists

                                    $Matches[3].Trim() 

                                } else { 

                                    # Fallback to the Function Name if no comment is found

                                    $Matches[2] 

                                }

                

                # Store the data in an object for easy sorting

                $AliasObjects += [PSCustomObject]@{

                    AliasName = $Matches[1]

                    Description = $Description

                }

            }

        }

        

        # 3. Sort the collected objects by the Alias Name

        $SortedAliases = $AliasObjects | Sort-Object -Property AliasName

        

        # 4. Iterate through the sorted objects and apply colored output

        foreach ($obj in $SortedAliases) {

            # Print Alias Name in White

            Write-Host -NoNewline $obj.AliasName -ForegroundColor White

            

            # Print Separator ( : ) in Yellow

            Write-Host -NoNewline ' : ' -ForegroundColor Yellow

            

            # Print Description/Function in White (forces newline)

            Write-Host $obj.Description -ForegroundColor White

        }

    }

    

    Write-Host "`nScan complete." -ForegroundColor Cyan

}


# Set the alias for easy use

Set-Alias alist alias-list



