function Invoke-OS {
    $scriptfile = $MyInvocation.PSCommandPath
    $directory = Split-Path $scriptfile
    $scriptname = Split-Path $scriptfile -Leaf

    $os_script = $null
    if ($IsMacOS) {
        $os_script = (Join-Path $directory "mac" $scriptname)
    }
    if ($null -eq $os_script) {
        $os_script = (Join-Path $directory\"windows" $scriptname)
    }

    if (Test-Path $os_script) {
        Write-Host $os_script
        & $os_script
    }
}

Function Install-Python {
    Set-Location $PSScriptRoot

    if (-Not (Test-Path (Join-Path $PSScriptRoot ../venv))) {
        if ($IsMacOS) {
            python3 -m venv ../venv
            Copy-Item (Join-Path $PSScriptRoot mac activate.ps1) ../venv/bin/
        }
        else {
            python -m venv ../venv
        }
    }
    if ($IsMacOS) {
        . ../venv/bin/activate.ps1
    } else {
        . ..\venv\Scripts\Activate.ps1
    }
    
}

Function PipInstall {
    Param([parameter(position=1)]$Pattern,
          [parameter(position=2)]$Package="")
    if ($Package -eq "")
    {
      $Package = $Pattern
    }
    if ( -Not (&pip3 list | Select-String -Pattern $Pattern -Quiet) )
    {
      &pip3 install $Package
    }
    else
    {
      Write-Host $Pattern " installed"
    }
}