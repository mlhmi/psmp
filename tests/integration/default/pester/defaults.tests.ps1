describe "ansible_test_kitchen_windows_role ansible role" {
    Context "PSMP Installation Path" {
        $Path = "C:\Program Files (x86)\Cyberark\PSMP\Recordings"
        it "PSMP Recordings Directory Exists" {
            Test-Path -Path $Path | Should be $true
        }
    }
}