FROM tensorflow/tensorflow:latest-jupyter

COPY dlib-19.19.tar.bz2 .
COPY *.py /opt/
COPY startup.sh /opt/
RUN apt-get update && \
  apt-get -y install cmake pkg-config vim && \
  rm -rf /var/lib/apt/lists/* && \
  tar xvf dlib-19.19.tar.bz2 && \
  rm -f dlib-19.19.tar.bz2 && \
  cd dlib-19.19 && \
  mkdir build && \
  cd build && \
  cmake .. && \
  cmake --build . --config Release && \
  make install && \
  ldconfig && \
  cd .. && \
  pkg-config --libs --cflags dlib-1 && \
  python setup.py install && \
  /usr/local/bin/python -m pip install --upgrade pip && \
  python -m pip install -U scikit-image && \ 
  mkdir -p /opt/apps && \
  pip install wheel gunicorn flask && \
  chmod +x /opt/startup.sh 

EXPOSE 5000
CMD /opt/startup.sh
