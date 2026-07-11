function projectcreator {
	#! Define Variables
	$foldername = Read-Host "What is the name of your project? "
	$description = Read-Host "Please enter a project description: "
	$currentdate = Get-Date -Format "mm-dd-yyyy"
	
	$aboutheader = @"
		## Project Info:

		ProjectName: **$foldername**

		Description: **$description**

		Date Created: **$currentdate**
"@
	
	$header = @"
	sd	
"@
	
	$ignorerequest = Read-Host "Do you want to add any files to your git ignore? "
		if($ignorerequest -like "Y") {
			Write-Output "Enter the file you want to add (Empty entry breaks the loop): "
			Write-Output ""
			$ignorefiles = while (1) { read-host | Set-Variable r; if (!$r) {break}; $r}
		}

	mkdir $foldername
	Cd $foldername
	
}