Add-Type -AssemblyName System.Windows.Forms
$clipboard = [System.Windows.Forms.Clipboard]::GetDataObject()
if ($clipboard.ContainsImage()) {
     $filename= Read-Host -Prompt "Enter name"
     $filename += '.png'
    [System.Drawing.Bitmap]$clipboard.getimage().Save($filename, [System.Drawing.Imaging.ImageFormat]::Png)
    Write-Output "clipboard content saved as $filename"
} else {
    Write-Output "clipboard does not contains image data"
}
