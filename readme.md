# Context-Arsenal 🚀

A lightweight, interactive batch script to quickly add any tool (IDA Pro, x64dbg, HxD, etc.) to your Windows right-click context menu.

Designed for malware analysts, reverse engineers, and developers who want to customize their environment efficiently.

## ⚡ How to Use

1. **Download** the `ContextMenuManager.bat` script.
2. Right-click the file and select **Run as Administrator** (Required to modify Registry).
3. **Paste the full path** of your tool (.exe) when prompted.
4. **Enter the Name** you want to display in the menu (e.g., `Analyze with IDA`).
5. Press any key to add another tool, or `Ctrl+C` to exit.

## 📝 Example Interaction

```text
Enter the full path of the .exe: "C:\Tools\IDA Pro\ida64.exe"

Enter the Name to display in menu: IDA Pro 9.0

[+] Registering "IDA Pro 9.0"...
[OK] Successfully added.
