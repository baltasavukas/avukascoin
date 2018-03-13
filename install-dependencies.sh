sudo apt update
sudo apt -y upgrade

sudo apt -y install build-essential pkg-config libssl-dev libzmq3-dev libunbound-dev libsodium-dev
sudo apt -y install libminiupnpc-dev libunwind8-dev liblzma-dev libreadline6-dev libldns-dev libexpat1-dev doxygen graphviz
sudo apt -y install libboost-all-dev 

cd ~ && git clone https://github.com/baltasavukas/avukascoin.git avukas
cd avukas
make -j



mkdir ~/temp && cd ~/temp
wget https://cmake.org/files/v3.10/cmake-3.10.2.tar.gz
tar -xf cmake-3.10.2.tar.gz
cd cmake-3.10.2 && ./bootstrap
sudo make -j
sudo make install
cd ~/temp
wget http://sourceforge.net/projects/boost/files/boost/1.58.0/boost_1_58_0.tar.gz
tar -xf boost_1_58_0.tar.gz
cd boost_1_58_0 && ./bootstrap.sh
./b2
sudo ./bjam install
cd ~ && rm -rf temp

sudo apt-get -y install libgtest-dev 
cd /usr/src/gtest && sudo cmake . 
sudo make && sudo mv libg* /usr/lib/



cd ~
ln -s ./avukas/build/release/src/avukascoind start.avukascoind
chmod +x start.avukascoind
mkdir ~/wallet-avukas
echo cd ~/wallet-avukas > acli
echo ./avukas/build/release/src/avukaswallet >> acli
chmod +x acli

