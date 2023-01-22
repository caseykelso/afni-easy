FROM ubuntu:18.04
# Instructions taken from:
# https://afni.nimh.nih.gov/pub/dist/doc/htmldoc/background_install/install_instructs/steps_linux_ubuntu18.html

#######################################################################################
## THIS PART INSTALLS AFNI BINARIES
#######################################################################################

# Setup linux dependencies
RUN apt-get update && apt-get install -y software-properties-common && add-apt-repository universe && apt-get update
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get install -y tcsh xfonts-base python-qt4        \
                        gsl-bin netpbm gnome-tweak-tool   \
                        libjpeg62 xvfb xterm vim curl     \
                        gedit evince eog                  \
                        libglu1-mesa-dev libglw1-mesa     \
                        libxm4 build-essential            \
                        libcurl4-openssl-dev libxml2-dev  \
                        libssl-dev libgfortran3           \
                        gnome-terminal nautilus           \
                        gnome-icon-theme-symbolic         \
                        firefox xfonts-100dpi git         \
                        python-pip cmake                && \
                        rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Setup python libraries
RUN pip install scipy numpy==1.8.0 mdp scikit-learn matplotlib
# Install AFNI binaries
RUN ln -s /usr/lib/x86_64-linux-gnu/libgsl.so.23 /usr/lib/x86_64-linux-gnu/libgsl.so.19
RUN cd && curl -O https://afni.nimh.nih.gov/pub/dist/bin/misc/@update.afni.binaries && \
          tcsh @update.afni.binaries -package linux_ubuntu_16_64 -do_extras

ENV HOME="/root"
ENV PATH="${PATH}:${HOME}/abin"
RUN cp $HOME/abin/AFNI.afnirc $HOME/.afnirc && suma -update_env
RUN apsearch -update_all_afni_help

RUN afni_system_check.py -check_all

#######################################################################################
## THIS PART INSTALLS R
#######################################################################################

## Install R 
# - NOTE THIS PART DOESN'T SEEM NECESSARY but I'm leaving it in incase soemone needs it.
# Could be considered bloat, possibly could be ommitted for slimming down.
## Need to set this or else R wants input from you
RUN export R_LIBS=$HOME/R && \
    mkdir  $R_LIBS && \
    echo  'setenv R_LIBS ~/R'     >> ~/.cshrc && \
    echo  'export R_LIBS=$HOME/R' >> ~/.bashrc && \
    curl -O https://afni.nimh.nih.gov/pub/dist/src/scripts_src/@add_rcran_ubuntu_18.04.tcsh
RUN tcsh @add_rcran_ubuntu_18.04.tcsh
RUN rPkgsInstall -pkgs ALL

    

