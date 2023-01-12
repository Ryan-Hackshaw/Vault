import subprocess

import subprocess

nmap_flags = {
    "version": "-sV",
    "top_ports": "-top-ports 100",
    "os_detection": "-O",
    "no_ping": "-Pn",
    "fast_scan": "-F"
}

def run_nmap(nmap_cmd):
    process = subprocess.Popen(nmap_cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    stdout, stderr = process.communicate()
    return stdout.decode()

def main():
    print("Welcome to the interactive Nmap script!")
    print("Enter 'help' for a list of commands.")
    
    while True:
        cmd = input("> ").strip()

        if cmd == "help":
            print("Commands:")
            print("    help - Show this list of commands")
            print("    scan [ip/hostname] [flag1,flag2,...] - Perform a port scan on the specified IP or hostname")
            print("    os-detect [ip/hostname] [flag1,flag2,...] - Perform an OS detection scan on the specified IP or hostname")
            print("    flags - Show available scan flags")
            print("    exit - Exit the script")
        elif cmd.startswith("scan"):
            cmd_parts = cmd.split(" ")
            target = cmd_parts[1]
            flags = cmd_parts[2:]
            flags_str = " ".join([nmap_flags[flag] for flag in flags if flag in nmap_flags.keys()])
            output = run_nmap(f"nmap {flags_str} {target}")
            print(output)
        elif cmd.startswith("os-detect"):
            cmd_parts = cmd.split(" ")
            target = cmd_parts[1]
            flags = cmd_parts[2:]
            flags_str = " ".join([nmap_flags[flag] for flag in flags if flag in nmap_flags.keys()])
            output = run_nmap(f"nmap {flags_str} -O {target}")
            print(output)
        elif cmd == "flags":
            print("Available flags:")
            for flag, value in nmap_flags.items():
                print(f"    {flag} - {value}")
        elif cmd == "exit":
            break
        else:
            print("Invalid command. Enter 'help' for a list of commands.")

if __name__ == "__main__":
    main()
