Currently works on build 5.0.9883.0

Powershell v5 (5.0.9926.2) has errors:

PSDesiredStateConfiguration\Configuration : The term 'iTimezone' is not recognized as the name of a cmdlet, function, script file, or operable program. Check the spelling of the name, or if a path 
was included, verify that the path is correct and try again.
At line:1 char:1
+ Configuration RomanceTime {
+ ~~~~~~~~~~~~~
    + CategoryInfo          : ObjectNotFound: (iTimezone:String) [Configuration], ParentContainsErrorRecordException
    + FullyQualifiedErrorId : CommandNotFoundException,Configuration
 
Errors occurred while processing configuration 'RomanceTime'.
At C:\windows\system32\windowspowershell\v1.0\Modules\PSDesiredStateConfiguration\PSDesiredStateConfiguration.psm1:3187 char:5
+     throw $errorRecord
+     ~~~~~~~~~~~~~~~~~~
    + CategoryInfo          : InvalidOperation: (RomanceTime:String) [], InvalidOperationException
    + FullyQualifiedErrorId : FailToProcessConfiguration
