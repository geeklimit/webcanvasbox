#! /bin/bash
# This setup file assumes the following:
#  Hardware: Libre AML-S905X-CC (Le Potato)
#  Distro: Libre Raspbian Bookworm (https://distro.libre.computer/ci/raspbian/12/2023-10-10-raspbian-bookworm-arm64%2Baml-s905x-cc.img.xz)

# Install distro, connect wired eth0 (and HDMI for testing) and power adapter
# Power on, wait for Raspbian first-run background
# Power cycle to clear first-run
# Wait for boot, SSH into machine, run and clean this file with:

# git clone https://github.com/geeklimit/webcanvasbox.git && sudo bash webcanvasbox/setup.sh && sudo rm webcanvasbox/setup.sh && sudo reboot

# Time to run: 6 minutes

sudo apt purge piwiz -y
sudo apt install wtype libglibmm-2.4-dev libglm-dev libxml2-dev libpango1.0-dev libcairo2-dev wayfire-dev \
libwlroots-dev libwf-config-dev meson ninja-build libvulkan-dev interception-tools interception-tools-compat cmake -y

cd /home/webcanvas
git clone https://github.com/WayfireWM/wayfire-plugins-extra && cd /home/webcanvas/wayfire-plugins-extra && git checkout b698f61
meson setup build --prefix=/usr --buildtype=release
ninja -C build && sudo ninja -C build install
sudo mv /home/webcanvas/.config/wayfire.ini /home/webcanvas/.config/wayfire.ini.bak
cp /home/webcanvas/webcanvasbox/wayfire.ini /home/webcanvas/.config/wayfire.ini

cd /home/webcanvas
git clone https://gitlab.com/interception/linux/plugins/hideaway.git && cd /home/webcanvas/hideaway
cmake -B build -DCMAKE_BUILD_TYPE=Release && cmake --build build && cd build
sudo cp /home/webcanvas/hideaway/build/hideaway /usr/bin && sudo chmod +x /usr/bin/hideaway
sudo cp /home/webcanvas/webcanvasbox/config.yaml /etc/interception/udevmon.d/config.yaml
sudo systemctl restart udevmon
