function Install-Package {
        param( [String]$package)
        $l = & brew list 
        if (-not $l.Contains($package)) {
        	& brew install $package 
        }
}

function Install-Cask {
	param( [String]$package)
	$l = & brew cask list
	if (-not $l.Contains($package)) {
		& brew cask install $package
	}
}
