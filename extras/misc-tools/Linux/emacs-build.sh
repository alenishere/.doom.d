
# git clone --depth=1 https://github.com/emacs-mirror/emacs.git
git clone --single-branch --branch emacs-27 --depth 1 https://github.com/emacs-mirror/emacs.git
cd emacs/
# sudo apt-get install build-essential
# sudo apt-get build-dep 

sudo apt install -y autoconf make gcc texinfo libgtk-3-dev libxpm-dev \
     libjpeg-dev libgif-dev libtiff5-dev libgnutls28-dev libncurses5-dev \
     libjansson-dev libharfbuzz-dev libharfbuzz-bin libmagick++-dev libx11-dev \
     wget libsystemd-dev libgtk3-dev libwebkit2gtk-4.0-dev libxml2-dev
./autogen.sh
./configure --with-json --with-modules --with-harfbuzz --with-compress-install \
            --with-threads --with-included-regex --with-zlib --with-sound \
            --with-xpm --with-jpeg --with-tiff --with-gif --with-png \
            --with-rsvg --with-imagemagick  --with-toolkit-scroll-bars \
            --without-gpm --without-dbus --with-makeinfo --with-xwidgets \
            --with-mailutils --with-gsettings --with-pop --with-libxml2
make
sudo make install
