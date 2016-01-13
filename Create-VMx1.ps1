# Script to create many VMs on many LUNs on current Hyper-V host asynchronously
# Script runs a separate job for each LUN. These jobs run in parallel (at the same time)
# Each job creates a number of VMs; one after the other (synchronously)
# Uses Create-VM.ps1 from https://superwidgets.wordpress.com/category/powershell/
# Sam Boutros - V1.0 - 7/3/2014
#
$ScriptRoot = "c:\support" # This is where Create-VM.ps1 should be and where the log files will be created
$VMPrefix = "V-2012R2-LAB" # VM Name prefix: it will be appended by LUN drive letter and VM Number.
$VMrootPath = "\VMs" # Each VM will be created in its own folder under the LUN drive letter and this root path.
$NumberofVMs = 10 # Per target LUN
$LUNs = @("e","f","j","l") # List of LUN drive letters
# (usually) common variables:
$VMG = 2 
$VMMemoryType = "Dynamic"
$VMStartupRAM = 1GB 
$VMminRAM = 512MB
$VMmaxRAM = 1GB
$vSwitch = "My_vSwitch"
$VMCores = 2 # Optional 
$VLAN = 19 # Optional
$AdditionalDisksTotal = 2 # Optional 
$AdditionalDisksSize = 1TB # Optional
$GoldenImageDiskPath = "E:\Golden\V-2012R2-3-C.VHDX" # This can be a UNC path like \\MyServer\Myshare\Myfolder\MyGoldenImage.vhdx
$CSV = $ScriptRoot + “\IOPS_” + (Get-Date -format yyyyMMdd_hhmmsstt) + “.csv”
# End Data Entry section
foreach ($LUN in $LUNs) {
    $ScriptBlock = {
        param($LUN,$ScriptRoot,$VMPrefix,$VMrootPath,$NumberofVMs,$VMG,$VMMemoryType,$VMStartupRAM,$VMminRAM,$VMmaxRAM,$vSwitch,$VMCores,$VLAN,$AdditionalDisksTotal,$AdditionalDisksSize,$GoldenImageDiskPath,$CSV) # accept variables across the job-context barrier
        Write-Output "Processing LUN: '$LUN'" 
        Set-Location $ScriptRoot # Scriptblock runs at %HomeDrive%\%HomePath\Documents folder by default (like c:\users\samb\documents)
        for ($i=1; $i -lt $NumberofVMs+1; $i++) {
            $VMName = $VMPrefix + $LUN + $i
            $VMFolder = $LUN + ":" + $VMrootPath + "\" + $VMName
            # Hardcode script path:
            C:\support\Create-VM.ps1 $VMName $VMFolder $vSwitch $GoldenImageDiskPath $VMG $VMMemoryType $VMStartupRAM $VMminRAM $VMmaxRAM $VMCores $VLAN $AdditionalDisksTotal $AdditionalDisksSize $CSV
        }
    }
    Start-Job $ScriptBlock -ArgumentList $LUN,$ScriptRoot,$VMPrefix,$VMrootPath,$NumberofVMs,$VMG,$VMMemoryType,$VMStartupRAM,$VMminRAM,$VMmaxRAM,$vSwitch,$VMCores,$VLAN,$AdditionalDisksTotal,$AdditionalDisksSize,$GoldenImageDiskPath,$CSV
}
While (Get-Job -State "Running") { Start-Sleep 2 } # Wait for all jobs to complete
Get-Job | Receive-Job 
Remove-Job * 