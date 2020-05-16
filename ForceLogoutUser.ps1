function Logout-User {
    param(
    [Parameter(Mandatory=$true,position=1)]
    $username,

    [Parameter(Mandatory=$false,position=2)]
    $hostname = 'localhost'
    )
    begin{}
    process{
        $sessionId = ((quser /server:$hostname | ? {$_ -match $username}) -split ' +')[3]
        logoff $sessionId /server:$hostname
    }
    end{}
}