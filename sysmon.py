import psutil
import datetime
import socket
import time
import os

while True:
    # Get CPU usage
    cpu_percent = psutil.cpu_percent()

    # Get CPU temperature
    try:
        cpu_temp = psutil.sensors_temperatures()['cpu-thermal'][0].current
    except KeyError:
        cpu_temp = "N/A"

    # Get CPU frequency
    cpu_freq = psutil.cpu_freq().current

    # Get memory usage
    memory = psutil.virtual_memory()
    memory_percent = memory.percent

    # Get disk usage
    disk = psutil.disk_usage('/')
    disk_percent = disk.percent

    # Get network usage
    net_io_counters = psutil.net_io_counters()
    net_sent = net_io_counters.bytes_sent
    net_recv = net_io_counters.bytes_recv

    # Get current time
    current_time = datetime.datetime.now().strftime("%I:%M:%S %p")

    # Get hostname
    hostname = socket.gethostname()

    os.system('clear')
    # Print the usage statistics
    if cpu_percent < 50:
        color = '\033[1;32m' # green
    else:
        color = '\033[1;31m' # red
    print(f"{color}CPU: {cpu_percent}%\033[0m")
    print("CPU Temp: ", cpu_temp)
    print("CPU Freq: ", cpu_freq, "Mhz")
    print("Memory: ", memory_percent, "%")
    print("Disk: ", disk_percent, "%")
    print("Network Sent: ", net_sent, "bytes")
    print("Network Received: ", net_recv, "bytes")
    print("Time: ", current_time)
    print("Hostname: ", hostname)
    print()
    # Sleep for 1 second
    time.sleep(1)
