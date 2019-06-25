Function CondaInstall {
    Param([parameter(position=1)]$Pattern,
          [parameter(position=2)]$Package="")
    if ($Package -eq "")
    {
      $Package = $Pattern
    }
    if ( -Not (&pip list | Select-String -Pattern $Pattern -Quiet) )
    {
        Write-Host $Package "conda install"
        conda install $Package -y
        if ($LASTEXITCODE -eq 1)
        {
            Write-Host $Pattern "failed installation with conda"
            &pip install $Package --no-deps
            $requires = &pip show $Package | Select-String Requires
            $deps = $requires.ToString().Split(':')[1].Split(',')
            foreach ($dep in $deps) {
                Write-Host $dep
                CondaInstall $dep.Trim()
            }
        }
    }
}

Function CondaRequirements {
    Param([parameter(position=1)]$requirements="requirements.txt")
    foreach ($req in (Get-Content $requirements)) {
        Write-Host $req
        CondaInstall $req
    }
}