.model small
.code
org 100h
start:
      jmp mulai
nama db 13,10,'Nama Pembeli : $'
tampung_nama    db 30,?,30 dup(?)



a db 01
b db 02
c db 03
d db 04
e db 05
f db 06
g db 07
h db 08
i db 09
j dw 15

daftar db 13,10,'|-----------------------------------------------------------|'
       db 13,10,'|                         TOKO SAYUR                        |'
       db 13,10,'|-----------------------------------------------------------|' 
       db 13,10,'+----+---------------+------------------+-------------------|'
       db 13,10,'| No |  Jenis Sayur  |  Harga Per-Ikat  |  Harga Per 2 Ikat |'
       db 13,10,'+----+---------------+------------------+-------------------|'
       db 13,10,'| 01 |   Kangkung    |    Rp. 3.000     |    Rp. 6.000      |'
       db 13,10,'+----+---------------+------------------+-------------------|'
       db 13,10,'| 02 |  Bayam Hijau  |    Rp. 2.500     |    Rp. 5.000      |'
       db 13,10,'+----+---------------+------------------+-------------------|'
       db 13,10,'| 03 |  Sawi Pahit   |    Rp. 4.000     |    Rp. 8.000      |'
       db 13,10,'+----+---------------+------------------+-------------------|'
       db 13,10,'| 04 |Kacang Panjang |    Rp. 8.000     |    Rp. 16.000     |'
       db 13,10,'+----+---------------+------------------+-------------------|'
       db 13,10,'| 05 |     Katu      |    Rp. 5.000     |    Rp. 10.000     |'
       db 13,10,'+----+---------------+------------------+-------------------|'
       db 13,10,'| 06 |  Sawi Manis   |    Rp. 4.000     |    Rp. 8.000      |'
       db 13,10,'+----+---------------+------------------+-------------------|'
       db 13,10,'| 07 |     Pakcoy    |    Rp. 3.500     |    Rp. 7.000      |'
       db 13,10,'+----+---------------+------------------+-------------------|'
       db 13,10,'| 08 |  Bayar merah  |    Rp. 2.500     |    Rp. 5.000      |'
       db 13,10,'+----+---------------+------------------+-------------------|'
       db 13,10,'| 09 |    Brokoli    |    Rp. 10.000    |    Rp. 20.000     |'
       db 13,10,'+----+---------------+------------------+-------------------|'
       db 13,10,'| 10 |     Kubis     |    Rp. 12.000    |    Rp. 24.000     |'
       db 13,10,'+----+---------------+------------------+-------------------|','$'

error           db 13,10,'KODE YANG ANDA MASUKAN SALAH $ '
pilih_ntr       db 13,10,'Silahkan Memilih Nomor Sayuran : $'
ikat            db 13,10,'Berapa Ikat : $'
selesai         db 13,10,'Terimakasih Sudah Berbelanja di Toko Sayur Kami $'
ulang           db 13,10,'Apakah Masih ada Sayuran yang Ingin Anda Beli : (Y/T)$'
awal            db 13,10,'Selamat Datang di Toko Sayur Kami $'
enter           db 13,10,'$'
tampung_ulang   db 13,?,13 dup(?)
tampung_ikat    db 13,?,13 dup(?)

error_nsg:        
     mov ah,09h
     mov dx,offset error
     int 21h
     int 20h

mulai:
    
    mov ah,09h
    lea dx,awal
    int 21h
    mov ah,09h
    lea dx,enter
    int 21h
    
    
    mov ah,09h
    lea dx,nama
    int 21h
    mov ah,0ah
    lea dx,tampung_nama
    int 21h
    push dx

    mov ah,09h
    mov dx,offset daftar
    int 21h
    mov ah,09h
    jmp ikat1
    
exit_program:
    mov ah,09h
    lea dx,enter
    int 21h
    
    mov ah,09h
    lea dx,selesai
    int 21h
    int 20h
                   
ikat1:
    mov ah, 09h
    lea dx, ikat
    int 21h

    mov ah, 0ah
    lea dx, tampung_ikat
    int 21h
    cmp byte ptr [tampung_ikat+2], '1' ; 
    je  proses_1
    cmp byte ptr [tampung_ikat+2], '2'
    je  proses_2
    jne error_nsg

main_loop:     
    mov ah,09h
    lea dx,ulang
    int 21h
        
    mov ah, 0ah
    lea dx, tampung_ulang
    int 21h
    cmp byte ptr [tampung_ulang+2], 'Y'
    je  ikat1
    cmp byte ptr [tampung_ulang+2], 'T'
    je  exit_program
    jne error_nsg
                 
proses_1:
      
      mov ah,09h
      lea dx,enter
      int 21h
    
      mov ah,09h
      mov dx,offset pilih_ntr
      int 21h
      
      mov ah,1
      int 21h
      mov bh,al
      mov ah,1
      int 21h
      mov bl,al
      cmp bh,'0'
      cmp bl,'1'
      je hasil1
      
      cmp bh,'0'
      cmp bl,'2'
      je hasil2
      
      cmp bh,'0'
      cmp bl,'3'
      je hasil3
      
      cmp bh,'0'
      cmp bl,'4'
      je hasil4
      
      cmp bh,'0'
      cmp bl,'5'
      je hasil5
      
      cmp bh,'0'
      cmp bl,'6'
      je hasil6
      
      cmp bh,'0'
      cmp bl,'7'
      je hasil7
      
      cmp bh,'0'
      cmp bl,'8'
      je hasil8
      
      cmp bh,'0'
      cmp bl,'9'
      je hasil9
           
      cmp bh,'1'
      cmp bl,'0'
      je hasil10
      
      
      jne error_nsg
;---------------------------------------------------'

hasil1:
      mov ah,09h
      lea dx,teks1
      int 21h
      jmp main_loop 
hasil2:
      mov ah,09h
      lea dx,teks2
      int 21h     
      jmp main_loop 
hasil3:
      mov ah,09h
      lea dx,teks3
      int 21h
      jmp main_loop 
hasil4:
      mov ah,09h
      lea dx,teks4
      int 21h
      jmp main_loop 
hasil5:
      mov ah,09h
      lea dx,teks5
      int 21h
      jmp main_loop
hasil6:
      mov ah,09h
      lea dx,teks6
      int 21h
      jmp main_loop 
hasil7:
      mov ah,09h
      lea dx,teks7 
      int 21h
      jmp main_loop 
hasil8:
      mov ah,09h
      lea dx,teks8 
      int 21h
      jmp main_loop 
hasil9:
      mov ah,09h
      lea dx,teks9 
      int 21h
      jmp main_loop
hasil10:
      mov ah,09h
      lea dx,teks10  
      int 21h
      jmp main_loop 
      
;---------------------------------------------'

teks1 db 13,10,'Anda memilih Sayur Kangkung'
      db 13,10,'Jika anda membeli 1 Ikat maka total yang harus anda bayar Rp. 3.000'
      db 13,10,'$'      
       
teks2 db 13,10,'Anda memilih Sayur Bayam Hijau'
      db 13,10,'Jika anda membeli 1 Ikat maka total yang harus anda bayar Rp. 2.500'
      db 13,10,'$'
           
teks3 db 13,10,'Anda memilih Sayur Sawi Pahit'
      db 13,10,'Jika anda membeli 1 Ikat maka total yang harus anda bayar Rp. 4.000'
      db 13,10,'$'
            
teks4 db 13,10,'Anda memilih Kacang Panjang'
      db 13,10,'Jika anda membeli 1 Ikat maka total yang harus anda bayar Rp. 8.000'
      db 13,10,'$' 
           
teks5 db 13,10,'Anda memilih Katu'
      db 13,10,'Jika anda membeli 1 Ikat maka total yang harus anda bayar Rp. 5.000'
      db 13,10,'$' 
           
teks6 db 13,10,'Anda memilih Sayur Sawi Manis'
      db 13,10,'Jika anda membeli 1 Ikat maka total yang harus anda bayar Rp. 4.000'
      db 13,10,'$'
            
teks7 db 13,10,'Anda memilih Sayur Pakcoy'
      db 13,10,'Jika anda membeli 1 Ikat maka total yang harus anda bayar Rp. 3.500'
      db 13,10,'$'      
teks8 db 13,10,'Anda memilih Sayur Bayam Merah'
      db 13,10,'Jika anda membeli 1 Ikat maka total yang harus anda bayar Rp. 2.500'
      db 13,10,'$'  
          
teks9 db 13,10,'Anda memilih Sayur Brokoli'
      db 13,10,'Jika anda membeli 1 Ikat maka total yang harus anda bayar Rp. 10.000'
      db 13,10,'$' 
           
teks10 db 13,10,'Anda memilih Sayur Kubis'
      db 13,10,'Jika anda membeli 1 Ikat maka total yang harus anda bayar Rp. 12.000'
      db 13,10,'$'  
      
proses_2:
      mov ah,09h
      lea dx,enter
      int 21h    
     
      mov ah,09h
      mov dx,offset pilih_ntr
      int 21h
      
      mov ah,1
      int 21h
      mov bh,al
      mov ah,1
      int 21h
      mov bl,al
      cmp bh,'0'
      cmp bl,'1'
      je hasil11
      
      cmp bh,'0'
      cmp bl,'2'
      je hasil12
      
      cmp bh,'0'
      cmp bl,'3'
      je hasil13
      
      cmp bh,'0'
      cmp bl,'4'
      je hasil14
      
      cmp bh,'0'
      cmp bl,'5'
      je hasil15
      
      cmp bh,'0'
      cmp bl,'6'
      je hasil16
      
      cmp bh,'0'
      cmp bl,'7'
      je hasil17
      
      cmp bh,'0'
      cmp bl,'8'
      je hasil18
      
      cmp bh,'0'
      cmp bl,'9'
      je hasil19
           
      cmp bh,'1'
      cmp bl,'0'
      je hasil20  
      
      
      jne error_nsg
 ;---------------------------------------------------'

hasil11:
      mov ah,09h
      lea dx,teks11
      int 21h
      jmp main_loop 
hasil12:
      mov ah,09h
      lea dx,teks12
      int 21h
      jmp main_loop 
hasil13:
      mov ah,09h
      lea dx,teks13
      int 21h
      jmp main_loop 
hasil14:
      mov ah,09h
      lea dx,teks14
      int 21h
      jmp main_loop 
hasil15:
      mov ah,09h
      lea dx,teks15
      int 21h
      jmp main_loop 
hasil16:
      mov ah,09h
      lea dx,teks16
      int 21h
      jmp main_loop    
hasil17:
      mov ah,09h
      lea dx,teks17 
      int 21h
      jmp main_loop
hasil18:
      mov ah,09h
      lea dx,teks18 
      int 21h
      jmp main_loop 
hasil19:
      mov ah,09h
      lea dx,teks19 
      int 21h
      jmp main_loop
hasil20:
      mov ah,09h
      lea dx,teks20  
      int 21h
      jmp main_loop 
    
;---------------------------------------------'

teks11 db 13,10,'Anda memilih Sayur Kangkung'
       db 13,10,'Jika anda membeli 2 ikat maka total yang harus anda bayar Rp. 6.000'
       db 13,10,'$'
             
teks12 db 13,10,'Anda memilih Sayur Bayam Hijau'
       db 13,10,'Jika anda membeli 2 ikat maka total yang harus anda bayar Rp. 5.000'
       db 13,10,'$'
           
teks13 db 13,10,'Anda memilih Sayur Sawi Pahit'
       db 13,10,'Jika anda membeli 2 ikat maka total yang harus anda bayar Rp. 8.000'
       db 13,10,'$' 
           
teks14 db 13,10,'Anda memilih Kacang Panjang'
       db 13,10,'Jika anda membeli 2 ikat maka total yang harus anda bayar Rp. 16.000'
       db 13,10,'$' 
           
teks15 db 13,10,'Anda memilih Katu'
       db 13,10,'Jika anda membeli 2 ikat maka total yang harus anda bayar Rp. 10.000'
       db 13,10,'$' 
           
teks16 db 13,10,'Anda memilih Sayur Sawi Manis'
       db 13,10,'Jika anda membeli 2 ikat maka total yang harus anda bayar Rp. 8.000'
       db 13,10,'$' 
            
teks17 db 13,10,'Anda memilih Sayur Pakcoy'
       db 13,10,'Jika anda membeli 2 ikat maka total yang harus anda bayar Rp. 7.000'
       db 13,10,'$' 
           
teks18 db 13,10,'Anda memilih Sayur Bayam Merah'
       db 13,10,'Jika anda membeli 2 ikat maka total yang harus anda bayar Rp. 5.000'
       db 13,10,'$'
            
teks19 db 13,10,'Anda memilih Sayur Brokoli'
       db 13,10,'Jika anda membeli 2 ikat maka total yang harus anda bayar Rp. 20.000'
       db 13,10,'$'
            
teks20 db 13,10,'Anda memilih Sayur Kubis'
       db 13,10,'Jika anda membeli 2 ikat maka total yang harus anda bayar Rp. 24.000'
       db 13,10,'$'       
                  
end start       