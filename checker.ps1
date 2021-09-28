param (
    [switch]$verbose
)
$path="C:\Windows\System32\"

Get-ChildItem -Path $path -File -Recurse | ForEach-Object { 
    $ext=($_.FullName -split "\.")[-1]
    $cond=($ext -eq "dll") -or ($ext -eq "exe")
    if($cond){
        $fileacl=Get-Acl $_.FullName
        if($fileacl.Owner -ne "NT SERVICE\TrustedInstaller"){$fileacl.Path}
        else{
            ForEach ($i in $fileacl.Access){
                if($i.IdentityReference -eq "NT SERVICE\TrustedInstaller"){
                    if($i.FileSystemRights -ne "FullControl"){$fileacl.Path}
                    break
                }
            }
        }
    }
} | ForEach-Object {
    if($verbose){Get-AuthenticodeSignature $_}
    else{
        $cond=(Get-AuthenticodeSignature $_).Status -ne "Valid"
        if($cond){$_}
    }
}