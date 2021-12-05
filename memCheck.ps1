# memory threshold
$lowMem = 100
 
$pcname = Read-Host "Enter PC Name: "
 
# get system info of remote PC connected to network, 's' flag is for the remote PC
# find to only get line with available phys mem
$mem = systeminfo /s $pcname | find "Available Physical Memory"
 
# remove all other characters on line so only bytes are put in variable
$mem = $mem -replace "[^0-9]"
 
# create window to display status of remote devices memory
$wshell = New-Object -ComObject Wscript.Shell
 
<# if memory equal to less than 100 bytes then display message indicating not enough memory to operate
will probably tweak the number, wrote this script because of issue with memory on devices and they couldn't
open any programs, hoping this script is light weight enough to run remotely and get info
#> 
if ($mem -le $lowMem){
$Output = $wshell.Popup("Device " + $pcname + " doesn't have enough memory, only " + $mem + " bytes.")
}
else {
 
$Output = $wshell.Popup("Device " + $pcname + " has enough memory, " + $mem + " bytes.")
 
}
 
<#
Sources:
https://social.technet.microsoft.com/Forums/en-US/3b35f96f-9955-4fee-bb8b-6642d2849cfd/remove-characters-except-numbers-from-variable-string?forum=winserverpowershell
https://www.kjctech.net/4-types-of-notifications-generated-in-powershell/
https://www.tutorialspoint.com/powershell/if_else_statement_in_powershell.htm
https://stackoverflow.com/questions/56232593/how-to-append-new-line-text-inside-a-log-file-using-powershell-script
https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/out-file?view=powershell-7.2
#>
