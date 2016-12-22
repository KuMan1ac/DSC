# Make Sure PSRemoting is Enabled, use Enable-PSRemoting
# DSC LCM Push Example Script
$remote="srv1,srv2"
[DscLocalConfigurationManager()]
Configuration LCMPush{
    node $remote{
        Settings{
            AllowModuleOverwrite = $true
            # 3 Choices: ApplyAndAutoCorrect,ApplyAndMonitor,ApplyOnly
            ConfigurationMode = 'ApplyAndAutoCorrect'
            # Use Push method
            RefreshMode = 'Push'
        }
    }
}

# Create the Computer .Meta.Mof in destination Floder
LCMPush -OutputPath C:\Dsc\LCM

# Just Do It. Configure LCM with .Meta.Mof files
Set-DscLocalConfigurationManager -ComputerName $remote -Path C:\Dsc\LCM -Verbose

# Check LCM Status
Get-DscLocalConfigurationManager -CimSession $remote

# Send to remote target server LCM to finish configuration
Start-DscConfiguration -Path C:\Dsc\Config -ComputerName $remote -Verbose -Force -Wait
