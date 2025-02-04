# Install mafft
sudo apt-get install mafft

# Install python 3.6 and make a virtual environment for it
pyenv install 3.6

virtualenv -p ~/.pyenv/versions/3.6.12/bin/python3.6 .venv3.6
source .venv3.6/bin/activate

curl -O https://bootstrap.pypa.io/pip/3.6/get-pip.py
python get-pip.py
rm -rf get-pip.py

# Install python packages
pip install --upgrade --force-reinstall setuptools
pip install numpy==1.19.5
pip install cython
pip install impacket
pip install -r requirements.txt

# Patching NetZob
patch -p1 < netzob.patch

# Run test command
# python netplier/main.py -i data/dhcp_100.pcap -o tmp/dhcp -t dhcp 