
FS_info_signature      dd       "RRaA"

times 480 db 0

FS_info_signature2     dd       "rrAa"
free_data_clusters     dd       0xffffffff
allocated_data_cluster dd       0xffffffff

times 12 db 0

FS_info_signature3     dd       0xaa550000

