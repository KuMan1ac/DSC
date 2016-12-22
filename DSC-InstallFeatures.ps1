Configuration TestConfig{
    Node DC{
        WindowsFeature IIS{
        # Check Syntax first
        # Get-DscResource -Name windowsfeature -Syntax 
          Name = 'web-server'
          # Install IIS, so it is 'Present' xD
          Ensure = 'Present'
        }
        WindowsFeature IIS-Mgmt-Console{
            Name = 'Web-Mgmt-Tools'
            Ensure = 'Present'
        }
    }
}

# Output a config MOF file to destination folder
TestConfig -OutputPath C:\Dsc\Config
