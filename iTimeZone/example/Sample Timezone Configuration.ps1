Configuration RomanceTime {

    Import-DscResource -ModuleName iTimezone

    iTimezone Test {
        Ensure = 'Present'
        Timezone = 'Romance Standard Time'
    }
    
}

RomanceTime
Start-DscConfiguration -Path .\RomanceTime -Verbose -wait -Force
