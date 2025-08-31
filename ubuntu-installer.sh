#!/data/data/com.termux/files/usr/bin/bash
# Ubuntu 22.04 + Desktop Installer for Termux:X11
# Interactive Username & Password
# Author: Ben + ChatGPT
# License: MIT

set -e

UBUNTU_VERSION="22.04.3"
ARCH="armhf"
ROOTFS_URL="https://cdimage.ubuntu.com/ubuntu-base/releases/${UBUNTU_VERSION}/release/ubuntu-base-${UBUNTU_VERSION}-base-${ARCH}.tar.gz"
INSTALL_DIR="$HOME/ubuntu-fs"

# --- INSTALL DEPENDENCIES ---
echo "[*] Updating Termux..."
pkg update -y && pkg upgrade -y
pkg install proot wget tar -y

# --- CREATE ROOTFS DIR ---
echo "[*] Creating install dir: $INSTALL_DIR"
mkdir -p "$INSTALL_DIR"
cd "$INSTALL_DIR"

# --- DOWNLOAD UBUNTU BASE ---
echo "[*] Downloading Ubuntu Base $UBUNTU_VERSION..."
wget -O ubuntu-rootfs.tar.gz "$ROOTFS_URL"

# --- EXTRACT ---
echo "[*] Extracting..."
proot --link2symlink tar -xzf ubuntu-rootfs.tar.gz --strip-components=1
rm ubuntu-rootfs.tar.gz

# --- CREATE START SCRIPT ---
echo "[*] Creating start-ubuntu.sh..."
cd "$HOME"
cat > start-ubuntu.sh <<'EOF'
#!/data/data/com.termux/files/usr/bin/bash
cd ~/ubuntu-fs
exec proot \
  -0 \
  -r ~/ubuntu-fs \
  -b /dev \
  -b /proc \
  -b /sys \
  -b /sdcard \
  -b /storage/sdcard1 \
  /usr/bin/env -i \
    HOME=/root \
    PATH=/usr/bin:/usr/sbin:/bin:/sbin \
    TERM=$TERM \
    LANG=C.UTF-8 \
    DISPLAY=:0 \
    /bin/bash --login
EOF
chmod +x start-ubuntu.sh

# --- FIRST TIME SETUP INSIDE UBUNTU ---
./start-ubuntu.sh <<'INSIDE'
apt update && apt upgrade -y

# --- INTERACTIVE USER SETUP ---
read -p "Enter desired username: " USERNAME
while [ -z "$USERNAME" ]; do
  echo "Username cannot be empty."
  read -p "Enter desired username: " USERNAME
done

read -sp "Enter desired password: " PASSWORD
echo
while [ -z "$PASSWORD" ]; do
  echo "Password cannot be empty."
  read -sp "Enter desired password: " PASSWORD
  echo
done

useradd -m -s /bin/bash "$USERNAME"
echo "$USERNAME:$PASSWORD" | chpasswd
usermod -aG sudo "$USERNAME"

# --- DESKTOP SELECTION ---
echo "Choose your Desktop Environment:"
echo "1) KDE Plasma"
echo "2) Cinnamon"
echo "3) Budgie"
echo "4) XFCE"
echo "5) LXQt"
echo "6) CLI only"
read -p "Selection: " choice

case $choice in
  1) apt install -y xorg plasma-desktop sddm ;;
  2) apt install -y xorg cinnamon-core ;;
  3) apt install -y xorg budgie-desktop-environment ;;
  4) apt install -y xorg xfce4 xfce4-goodies ;;
  5) apt install -y xorg lxqt ;;
  6) echo "Installing only CLI." ;;
  *) echo "Invalid choice, installing CLI only." ;;
esac

echo "[*] Setup finished!"
echo "Start Termux:X11 app, then run ./start-ubuntu.sh"
echo "Inside Ubuntu, start your DE with:"
echo "  KDE: startplasma-x11"
echo "  Cinnamon: cinnamon-session"
echo "  Budgie: budgie-desktop"
echo "  XFCE: startxfce4"
echo "  LXQt: lxqt-session"

INSIDE

echo "[*] Installation complete! Use ./start-ubuntu.sh to enter Ubuntu."
