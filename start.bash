#! /bin/bash -xeu

# Piping Server(Rust) version
VERSION=v0.12.0
# binary directory
BIN_DIR_PATH=$PWD/bin/$VERSION
BIN_PATH=$BIN_DIR_PATH/piping-server

# Make directory for bin
mkdir -p $BIN_DIR_PATH

# If bin is not found
if [ ! -f $BIN_PATH ]; then
  (
    # Go to the bin directory
    cd $BIN_DIR_PATH
    # Donwload and extract
    curl -L https://github.com/nwtgck/piping-server-rust/releases/download/${VERSION}/piping-server-x86-64-linux.tar.gz | tar xzvf -
    # Move
    mv ./piping-server-x86-64-linux/piping-server $BIN_PATH
    rm -rf piping-server-x86-64-linux/
  )
fi

# Save PID
echo $$ > piping-server.pid
# Run a server
exec $BIN_PATH --http-port=3000
