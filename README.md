# UbuntuAnywhere
## Deutsch/German:

**Bring Ubuntu auf dein Android-Gerät – selbst auf alte Geräte!**  

Mit **UbuntuAnywhere** kannst du Ubuntu 22.04 direkt in Termux/Proot installieren und sogar eine Desktop-Umgebung deiner Wahl starten: KDE, Cinnamon, Budgie, XFCE, LXQt oder nur CLI. Selbst alte Fire-Tablets oder Android-Geräte ab Version 5.1.1 sind kein Problem.  

---
### Mindestanforderungen
- ARM64 prozessor
- 1 GB Ram (CLI Only)
- 4 GB RAM (GUI)
- min. 20 GB Speicher oder 32 GB SD-Karte
### Features

- Interaktive Benutzername & Passwort-Auswahl  
- Minimalistische Desktop-Umgebungen für Termux:X11  
- Läuft auf internen Speicher oder SD-Karte (wenn verfügbar)  
- Perfekt für Retro-Android-Geräte und Low-RAM-Tablets  
- Unterstützt Termux:X11 für grafische Desktops  
- CLI-Option für minimalistische Systeme  

---

### Installation

1. Installiere [Termux](https://f-droid.org/packages/com.termux/) auf deinem Gerät.  
2. Optional: Installiere [Termux:X11](https://f-droid.org/packages/com.termux.x11/) für grafische Desktops.  
3. Lade das Skript herunter und mache es ausführbar:

```bash
wget https://github.com/Ben-bit-code208/UbuntuAnywhere/raw/main/ubuntu-installer.sh
chmod +x ubuntu-installer.sh
```

4. Starte die Installation:

```bash
./ubuntu-installer.sh
```
5. dann insterliere IN ubuntu das skript
```bash
wget https://github.com/Ben-bit-code208/UbuntuAnywhere/raw/main/ubuntu-setup.sh
chmod +x ubuntu-installer.sh
./ubuntu-installer.sh
```

Folge den Anweisungen: Benutzername, Passwort, Desktop-Auswahl.

Starte Ubuntu:

```bash
./start-ubuntu.sh
```
Starte den grafischen Desktop (je nach Auswahl):

```bash
# KDE
startplasma-x11
# Cinnamon
cinnamon-session
# Budgie
budgie-desktop
# XFCE
startxfce4
# LXQt
lxqt-session
```

### Feedback & Mitwirken
Pull Requests, Issues und Vorschläge sind willkommen!
Mach UbuntuAnywhere noch besser – zusammen mit der Community

### Hinweise
Die Desktop-Umgebungen sind minimalistische Versionen, speziell angepasst für Termux/Proot.

Nutze Termux:X11, um grafische Oberflächen korrekt anzuzeigen.

CLI-only Option ist für Geräte mit sehr wenig RAM oder ohne X11 gedacht.


Für die meisten DEs (KDE, Cinnamon, Budgie, XFCE, LXQt) gilt: Startbefehl im Terminal nach ```bash ./start-ubuntu.sh ``` ausführen um die Desktop-Sitzung zu starten.

## Englisch/English:
**Bring Ubuntu to your Android device – even on old devices!**

With **UbuntuAnywhere** you can install Ubuntu 22.04 directly in Termux/Proot and even launch a desktop environment of your choice: KDE, Cinnamon, Budgie, XFCE, LXQt, or just CLI. Even old Fire tablets or Android devices from version 5.1.1 onwards are no problem.

---
### Minimum requirements
- ARM64 processor
- 1 GB RAM (CLI only)
- 4 GB RAM (GUI)
- at least 20 GB storage or 32 GB SD card

### Features

- Interactive username & password selection
- Minimalist desktop environments for Termux:X11
- Runs on internal storage or SD card (if available)
- Perfect for retro Android devices and low-RAM tablets
- Supports Termux:X11 for graphical desktops
- CLI option for minimalist systems

---

### Installation

1. Install [Termux](https://f-droid.org/packages/com.termux/) on your device.
2. Optional: Install [Termux:X11](https://f-droid.org/packages/com.termux.x11/) for graphical desktops.
3. Download the script and make it executable:

```bash
wget https://github.com/Ben-bit-code208/UbuntuAnywhere/raw/main/ubuntu-installer.sh
chmod +x ubuntu-installer.sh
```

Start the installation:

```bash
./ubuntu-installer.sh
```

5. then install the script IN Ubuntu
```bash
wget https://github.com/Ben-bit-code208/UbuntuAnywhere/raw/main/ubuntu-setup.sh
chmod +x ubuntu-installer.sh
./ubuntu-installer.sh
```
Follow the instructions: username, password, desktop selection.

Start Ubuntu:

Start the graphical desktop (depending on your selection):

```bash
# KDE
startplasma-x11
# Cinnamon
cinnamon-session
# Budgie
budgie-desktop
# XFCE
startxfce4
# LXQt
lxqt-session
```

### Feedback & Contribution
Pull requests, issues, and suggestions are welcome!
Make UbuntuAnywhere even better – together with the community

### Notes
The desktop environments are minimalist versions, specially adapted for Termux/Proot.

Use Termux:X11 to display graphical interfaces correctly.

The CLI-only option is intended for devices with very little RAM or without X11.

For most DEs (KDE, Cinnamon, Budgie, XFCE, LXQt): Run the start command in the terminal after ```bash ./start-ubuntu.sh ``` to start the desktop session


