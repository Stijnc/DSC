Enum Ensure
{
   Absent
   Present
}
 
[DscResource()]
class iTimezone
{
   [DscResourceKey()]
   [string] $Timezone

   [DscResourceMandatory()]
   [Ensure] $Ensure
 
   [void] Set()
   {
      if($this.Ensure -eq [Ensure]::Present)
      {
        Try
        {
            Write-Verbose "Setting the TimeZone"
            $timezone = $this.Timezone
            Invoke-Expression "tzutil.exe /s ""$TimeZone"""
        }
        Catch
        {
            $ErrorMsg = $_.Exception.Message
            Write-Verbose $ErrorMsg
        }   
      }
    }
     
    [bool] Test()
    {
        $Get = $this.Get

        If($this.timezone -eq $Get.Timezone)
        {
            
            return $true
        }
        Else
        {
           
            return $false
        }  
    }
 
    [iTimezone] Get()
    {
        $Configuration = [hashtable]::new()
        $Configuration.Add("timezone",$this.Timezone)
        
        try {
            $CurrentTimeZone = Invoke-Expression "tzutil.exe /g"

            if($CurrentTimeZone -eq $this.Timezone)
            {
                Write-verbose "timezone is $currenttimezone"
                $Configuration.Add('Ensure','Present')
            }
            else 
            {
                $Configuration.Add('Ensure','Absent')
            }
        }
        catch {
             $exception = $_
             Write-Verbose "Error occurred"
             while ($exception.InnerException -ne $null)
             {
                 $exception = $exception.InnerException
                 Write-Verbose $exception.message
             }
          }

	    return $Configuration
     }
}
