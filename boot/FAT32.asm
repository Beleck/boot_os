;FAT32 Header
;https://en.wikipedia.org/wiki/Design_of_the_FAT_file_system
%include 'header.asm'

jmp short start
nop

oem_name              db 		"BOOT--OS"
bytes_per_sector      dw 		BYTES_PER_SECTOR
sectors_per_cluster   db 		0x08
reserved_sectors      dw 		RESERVED_SECTORS
total_FAT             db 		0x02
max_root_dir          dw 		0x0000
logical_sectors       dw 		0x0000
media_descriptor      db 		0xF8
sectors_per_FAT       dw 		0x0000
sectors_per_track     dw 		0x003D
sectors_per_head      dw 		0x0002
hidden_sectors        dd 		0x00000000
total_sectors    	  dd 		0x00FE3B1F		
sectors_per_FAT32     dd 		0x00000778
flags                 dw 		0x0000
FS_version            dw 		0x0000
root_directory_start  dd 		0x00000002
FS_info_sector        dw 		0x0001
copy_boot_sector      dw 		0x0006

TIMES 12 DB 0 

drive_number          db 		0x00
reserved_byte         db   	    0x00
signature             db 		0x29
volume_ID             dd 		0xFFFFFFFF
volume_label          db 		"BOOT OS    "
system_ID             db 		"FAT32   "
