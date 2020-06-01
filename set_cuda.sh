#!/bin/bash

set -e

if ! grep 'cuda/bin' ${HOME}/.bashrc > /dev/null ; then
  echo "** Add CUDA path into ~/.bashrc"
  echo >> ${HOME}/.bashrc
  echo "export PATH=/usr/local/cuda/bin:\${PATH}" >> ${HOME}/.bashrc
  echo "export LD_LIBRARY_PATH=/usr/local/cuda/lib64:\${LD_LIBRARY_PATH}" >> ${HOME}/.bashrc
  echo "export PATH=$PATH:/usr/local/cuda/bin" >> ${HOME}/.bashrc
  source ~/.bashrc
fi
