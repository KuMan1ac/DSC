# This Script Contains a Configuration to generate MOF files for Windows Feature Installation.
# This Example installs IIS and IIS Management Console

# $remote stands for remote servers for feature installtion
$remote="srv1, srv2"

# Name a Configuration, You Should Check Syntax first, using: Get-DscResource -Name windowsfeature -Syntax 
Configuration TestConfig{
    Node $remote{
        WindowsFeature IIS{
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
