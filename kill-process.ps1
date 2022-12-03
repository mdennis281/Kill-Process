<#
  Description:
	a searchable version of task manager's kill process functionality.
	behaves best when in a directory within the systems PATH.
	Once in the appropriate directory, it can be executed by running the command "kill-process"
	in powershell
	
  Author: Michael Dennis
  Creation Date: May, 27th 2019
#>

function kill-process() {
  $processes = get-process | Get-Unique | select Name,Company,Description,Responding,Path #gets all running processes
  $proc = $processes | Out-Gridview -PassThru -Title "Process Killer" #passthru flag added to allow for killing of more than one process
  ForEach ($p in $proc.Name){
    taskkill /im $p".exe" /f
  }
}

kill-process
