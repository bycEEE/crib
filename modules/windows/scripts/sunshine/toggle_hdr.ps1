# Insert into the do/undo fields:
# C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy Bypass -File "<ScriptLocationDirectory>\togglehdr.ps1"

# https://github.com/FrogTheFrog/moondeck-buddy/wiki/Sunshine-setup

$source = @"
using System;
using System.Threading.Tasks;
using System.Runtime.InteropServices;
using System.Windows.Forms;
namespace Sunshine
{
    public class Utils
    {
        [DllImport("user32.dll")]
        public static extern void keybd_event(byte bVk, byte bScan, int dwFlags, int dwExtraInfo);

        private const int KEYEVENTF_EXTENDEDKEY = 0x0001;
        private const int KEYEVENTF_KEYUP = 0x0002;

        // From https://learn.microsoft.com/en-us/windows/win32/inputdev/virtual-key-codes
        private const byte VK_LWIN = 0x5B;
        private const byte VK_ALT = 0x12;
        private const byte VK_B = 0x42;

        public static void ToggleHdr()
        {
            // Press down the keyboard shortcut
            keybd_event(VK_ALT, 0, KEYEVENTF_EXTENDEDKEY, 0);
            keybd_event(VK_LWIN, 0, KEYEVENTF_EXTENDEDKEY, 0);
            keybd_event(VK_B, 0, KEYEVENTF_EXTENDEDKEY, 0);

            // Release the keyboard shortcut
            keybd_event(VK_B, 0, KEYEVENTF_EXTENDEDKEY | KEYEVENTF_KEYUP, 0);
            keybd_event(VK_LWIN, 0, KEYEVENTF_EXTENDEDKEY | KEYEVENTF_KEYUP, 0);
            keybd_event(VK_ALT, 0, KEYEVENTF_EXTENDEDKEY | KEYEVENTF_KEYUP, 0);
        }
    }
}
"@
Add-Type -TypeDefinition $source -ReferencedAssemblies "System.Windows.Forms"

Write-Output "Toggle HDR"
[Sunshine.Utils]::ToggleHdr()
Write-Output "HDR toggled"
