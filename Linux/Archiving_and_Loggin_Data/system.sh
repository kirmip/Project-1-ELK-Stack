#!/bin/bash

#File output path variables
free_mem_path=~/backups/freemem/free_mem.txt
disk_usage_path=~/backups/diskuse/disk_usage.txt
open_list_path=~/backups/openlist/open_list.txt
free_disk_path=~/backups/freedisk/free_disk.txt

# Free memory output to a free_mem.txt file
free -h > $free_mem_path

# Disk usage output to a disk_usage.txt file
df -h > $disk_usage_path

# List open files to a open_list.txt file
lsof > $open_list_path

# Free disk space to a free_disk.txt file
du -h > $free_disk_path
