# Setup

(re)Install Ubuntu 24.04 from USB
Enter BIOS and disable NumLock on boot
Enable Chipset -> State after G3 -> S0 (boot on power on)

sudo apt-get update
# install
gparted (if partitioning/dual-booting)
curl (basic tool)
git (basic tool)
awscli
htop
unrar
```
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
```

create new aws keys and add to configuration

https://gitlab.com/es-de/emulationstation-de/-/packages/
Download and unzip
ln -s arcade/ES-DE ~/ES-DE
git clone git@github.com:kornypoet/artflix-revisited-es-de.git themes

https://clonehero.net/releases/v1.0.0.4080/

mame deps
sudo apt-get install git build-essential python3 libsdl2-dev libsdl2-ttf-dev libfontconfig-dev libpulse-dev qtbase5-dev qtbase5-dev-tools qtchooser qt5-qmake

git clone https://github.com/mamedev/mame
cd mame
make -j5 # for parallelism

create new ssh key and add to github

git clone git@github.com:kornypoet/arcade.git

aws s3 sync s3://travis.laptop.backup/games/mame-roms/

disable sleep on ubuntu


lightgun
sudo apt install ca-certificates gnupg
sudo gpg --homedir /tmp --no-default-keyring --keyring gnupg-ring:/usr/share/keyrings/mono-official-archive-keyring.gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
sudo chmod +r /usr/share/keyrings/mono-official-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/mono-official-archive-keyring.gpg] https://download.mono-project.com/repo/ubuntu stable-focal main" | sudo tee /etc/apt/sources.list.d/mono-official-stable.list
sudo apt install dotnet-runtime-10.0
sudo apt=get install mono=complete
sudo apt install v4l-utils libjpeg-dev
not libsdl2-image-2.0-0
not libsdl2-2.0-0

libsdl1.2 (yes)
https://www.sindenlightgun.com/software/SindenLightgunSoftwareReleaseV2.08b.zip

sinden as a service
mono lightgun.exe joystick sometimes fails the first couple tries

turn off monodoc

flycast
https://github.com/flyinghead/flycast

builds


# Play!
pac man battle royale
sudo apt install libfuse2

## outfox
download and unzip
clone https://github.com/MidflightDigital/XX--STARLiGHT--twopointzero.git Appearance/Themes

## Links

[How to prepare a windows USB)[https://nixaid.com/archive/article/bootable-usb-windows-linux?era=ghost]

retroarch
https://docs.libretro.com/development/retroarch/compilation/ubuntu/
install dependencies by hand (build-dep doesn't work)

online updater > update assets
online update > cores info

travis@travis:~/.config/retroarch$ ln -s ~/arcade/retroarch/autoconfig/ .
travis@travis:~/.config/retroarch$ ln -s ~/arcade/retroarch/cheats/ .
travis@travis:~/.config/retroarch$ ln -s ~/arcade/retroarch/config .
travis@travis:~/.config/retroarch$ ln -s ~/arcade/retroarch/database/ .
travis@travis:~/.config/retroarch$ ln -s ~/arcade/retroarch/downloads/ .
travis@travis:~/.config/retroarch$ ln -s ~/arcade/retroarch/filters .
travis@travis:~/.config/retroarch$ ln -s ~/arcade/retroarch/overlays/ .
travis@travis:~/.config/retroarch$ ln -s ~/arcade/retroarch/playlists/ .
travis@travis:~/.config/retroarch$ ln -s ~/arcade/retroarch/records .
travis@travis:~/.config/retroarch$ ln -s ~/arcade/retroarch/records_config/ .
travis@travis:~/.config/retroarch$ ln -s ~/arcade/retroarch/retroarch.cfg .
travis@travis:~/.config/retroarch$ ln -s ~/arcade/retroarch/saves/ .
travis@travis:~/.config/retroarch$ ln -s ~/arcade/retroarch/screenshots/ .
travis@travis:~/.config/retroarch$ ln -s ~/arcade/retroarch/shaders/ .
travis@travis:~/.config/retroarch$ ln -s ~/arcade/retroarch/states/ .
travis@travis:~/.config/retroarch$ ln -s ~/arcade/retroarch/system/ .
travis@travis:~/.config/retroarch$ ln -s ~/arcade/retroarch/thumbnails/ .

## Performance tuning
mame -bench 60 tekken3
Average speed: 253.38% (59 seconds)
mame -bench 60 timecris
Average speed: 224.14% (59 seconds)
mame -bench 60 galaga
Average speed: 2881.14% (59 seconds)

cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
want performance, not powersave (but this may not change)

powerprofilesctl set performance

cat /sys/devices/system/cpu/cpu0/cpufreq/energy_performance_preference
want performance

apt-get install mesa-utils vulkan-tools
glxgears (60 fps)
glxinfo | grep "OpenGL renderer"
want no llvmpipe


## Wine
sudo mkdir -pm755 /etc/apt/keyrings
wget -O - https://dl.winehq.org/wine-builds/winehq.key | sudo gpg --dearmor -o /etc/apt/keyrings/winehq-archive.key -
sudo dpkg --add-architecture i386
sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/noble/winehq-noble.sources
apt-get update
sudo apt install --install-recommends winehq-stable

sudo apt-get install libvulkan1:i386
sudo apt-get install libegl1:i386

wine regedit


## Missing

Games that could not be included for various reasons

Tempest - requires spinner
Assault - requires twin flight sticks with triggers
Outrun - requires steering wheel
Spy Hunter - requires steering wheel
Monkey Ball - requires analog joystick
Food Fight - requires analog joystick
Primal Rage 2 - MAME support low
Wonder Boy - is really NES adventure time, not a great arcade fit
Puzz Loop 2 - not any better than puzz loop 1
Puyo Puyo 2 - needs translation
Puyo Puyo fev - replaced with puyo puyo and translated w/ 4 players
Only select versions of Street Fighter
MK4 - just sucks
Quarth - replaced by block hole, english translation
Solar Assault - requires flight stick
Death Smiles - not well known or supported by mame
Illvelo - not well supported by mame or well known
Excitebike - is only single player
Dragon Spirit - screen issues
Magical Drop - replaced by chain reaction, english translation
Ikari Warriors - requires special joystick
Super Smash Bros Melee - More buttons and joysticks than I have
Tron - requires spinner or flightstick
Timesplitters (or any first person shooter) - requires analog joysticks
Super Mario Strikers - requires analog joystick + more buttons
Mario Golf Toadstool Tour - ""
Twisted Metal - ""
Hot Shots Tennis - confused with the ps2 series Hot shots; not as good
Cyberball - multiplayer is meant to be split screens not shared
9 Ball Shootout - Just kinda sucks
Pebble Beach - out in favor of neo turf masters
Carket Ball - too obscure?
Virtual Pool - too hard to control
Nfl Blitz 2000 - coin issues
Scramble
Afterburner
Crush Roller
Ladybug
Tank Battalion
Hustler
Space Panic
Town and Country

# Lightgun Links
(https://www.sindenwiki.org/wiki/Mesen#:~:text=In%20the%20left%20task%20pane,pointer%20when%20using%20light%20guns.%22)
(https://www.reddit.com/r/SindenLightgun/comments/1gidmu3/comment/lv75pwf/)
(https://www.reddit.com/r/SindenLightgun/comments/1gxlrkt/need_to_disable_mouse_cursor/)
(https://www.youtube.com/watch?v=j02mdPb-SjM)
(https://www.youtube.com/watch?v=_iBClzb-C9E)
(https://www.reddit.com/r/SindenLightgun/comments/1cuhdd6/sinden_light_gun_guide_for_retroarch_nes_ps1/)
(https://www.sindenwiki.org/wiki/Retroarch#:~:text=In%20RetroArch's%20main%20menu%2C%20go,the%20time%20limit%20is%20over.)
(https://www.reddit.com/r/emulation/comments/ylb6me/looks_like_nebula_model_2_emulator_page_is_dead/)
(https://www.reddit.com/r/RetroArch/comments/grbenx/retroarch_and_model_2_games/)
(https://www.reddit.com/r/cade/comments/azyx1h/the_house_of_the_dead_1234_emulation_showcase/)
(https://en.wikipedia.org/wiki/List_of_light-gun_games)
(https://forums.launchbox-app.com/topic/72128-sinden-lightgun-issues-in-mame/)
(https://www.sindenwiki.org/wiki/MAME)
(https://www.sindenwiki.org/wiki/Sinden_Bezel_Packs#MAME_Bezel_Pack)
(https://www.sindenwiki.org/wiki/MAME)
(https://www.amazon.com/2-PACK-Guitar-Hanger-Display-Hardware/dp/B00LTDOIXW/ref=asc_df_B00LTDOIXW?mcid=7b43fc378a4232eeaa583b122c3a08d0&hvocijid=4139653669259181117-B00LTDOIXW-&hvexpln=73&tag=hyprod-20&linkCode=df0&hvadid=721245378154&hvpos=&hvnetw=g&hvrand=4139653669259181117&hvpone=&hvptwo=&hvqmt=&hvdev=c&hvdvcmdl=&hvlocint=&hvlocphy=9028293&hvtargid=pla-2281435178378&psc=1)
(https://www.google.com/search?q=keyboard+sustain+pedal+metal&sca_esv=865d6c36e0c51f09&sxsrf=ADLYWIJKNznrsGg8Xk2ohfAJpcQ_nLMCfQ%3A1737059586708&ei=Am2JZ5X5KsuikPIPxo7QwQg&ved=0ahUKEwiVgvqci_uKAxVLEUQIHUYHNIgQ4dUDCBA&uact=5&oq=keyboard+sustain+pedal+metal&gs_lp=Egxnd3Mtd2l6LXNlcnAiHGtleWJvYXJkIHN1c3RhaW4gcGVkYWwgbWV0YWwyChAAGLADGNYEGEcyChAAGLADGNYEGEcyChAAGLADGNYEGEcyChAAGLADGNYEGEcyChAAGLADGNYEGEcyChAAGLADGNYEGEcyChAAGLADGNYEGEcyChAAGLADGNYEGEdI1gRQ8QNY8QNwAXgBkAEAmAEAoAEAqgEAuAEDyAEA-AEBmAIBoAIEmAMAiAYBkAYIkgcBMaAHAA&sclient=gws-wiz-serp)
(https://forum.arcadecontrols.com/index.php?topic=108297.0)
