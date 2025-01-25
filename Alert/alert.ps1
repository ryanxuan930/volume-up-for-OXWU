Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;
public class VolumeControl {
    [DllImport("user32.dll")]
    public static extern int SendMessageW(IntPtr hWnd, uint Msg, IntPtr wParam, IntPtr lParam);
}
"@
$HWND_BROADCAST = [IntPtr]0xffff
$WM_APPCOMMAND = 0x319
$APPCOMMAND_VOLUME_UP = 0xA0000
$APPCOMMAND_VOLUME_MUTE = 0x80000
[VolumeControl]::SendMessageW($HWND_BROADCAST, $WM_APPCOMMAND, 0, [IntPtr]$APPCOMMAND_VOLUME_MUTE)
for ($i = 0; $i -lt 50; $i++) {
    [VolumeControl]::SendMessageW($HWND_BROADCAST, $WM_APPCOMMAND, 0, [IntPtr]$APPCOMMAND_VOLUME_UP)
}
$musicFile = ".\alert.wav"
if (!(Test-Path $musicFile)) {
    exit 1
}
for ($i = 1; $i -le 4; $i++) {
    $player = New-Object System.Media.SoundPlayer $musicFile
    $player.PlaySync()
}

