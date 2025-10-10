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
echo "Start Termux:X11 or app, then run ./start-ubuntu.sh"
echo "Inside Ubuntu, start your DE with:"
echo "  KDE: startplasma-x11"
echo "  Cinnamon: cinnamon-session"
echo "  Budgie: budgie-desktop"
echo "  XFCE: startxfce4"
echo "  LXQt: lxqt-session"

INSIDE

echo "[*] Installation complete! Use ./start-ubuntu.sh to enter Ubuntu."
