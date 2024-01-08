# Home Assistant Add-on: Neolink

Please reference the [release notes](https://github.com/thirtythreeforty/neolink) for breaking changes.

![Supports aarch64 Architecture][aarch64-shield] ![Supports amd64 Architecture][amd64-shield] ![Supports armv7 Architecture][armv7-shield]

An RTSP bridge to Reolink E1 IP camera.

INSTALLATION

Install Gstreamer from the most recent MSI installer on Windows, or your package manager on Linux.

On Ubuntu/Debian machines gstreamer can be installed with:

sudo apt install \
  libgstrtspserver-1.0-0 \
  libgstreamer1.0-0 \
  libgstreamer-plugins-bad1.0-0 \
  gstreamer1.0-plugins-good \
  gstreamer1.0-plugins-bad
If you are using Windows, add the following to your PATH environment variable:

%GSTREAMER_1_0_ROOT_X86_64%\bin
Note: If you use Chocolatey to install Gstreamer, it does this automatically.

work in progress
