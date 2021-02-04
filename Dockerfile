FROM debian
RUN apt-get update; 
RUN apt-get install --no-install-recommends -y python-smbus i2c-tools python3
# Install Grove Pi dependencies
RUN apt-get install --no-install-recommends -y git gcc libi2c-dev i2c-tools \
    python-setuptools python-pip python-smbus python-dev python3-venv python3-wheel python-serial python-rpi.gpio python-numpy python-scipy \
    python3-setuptools python3-pip python3-smbus python3-dev python3-serial python3-rpi.gpio python3-numpy python3-scipy \
    libncurses5 libffi-dev
RUN pip3 install wheel
# Install Grove Pi Python library
# https://github.com/DexterInd/GrovePi/tree/master/Software/Python
RUN git clone https://github.com/DexterInd/GrovePi.git
RUN git clone https://github.com/DexterInd/RFR_Tools.git
# First install di_i2c module from https://github.com/DexterInd/RFR_Tools on which the Grove Pi library relies.
RUN cd RFR_Tools/miscellaneous/ && python3 setup.py install
# Then install GrovePi Python library
RUN cd GrovePi/Software/Python/ && pip install -r requirements.txt && python3 setup.py install
