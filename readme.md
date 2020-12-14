Dlib
    http://dlib.net/files/dlib-19.19.tar.bz2

To build the image:

    docker build --squash -t tf-gunicorn .
    
To run it:

    docker run -d -it -p 5000:5000 --name tf-gunicorn -v /opt/docker_share/apps:/opt/apps tf-gunicorn

If container can't find customized file apps.py in /opt/apps folder, it uses its own simple apps.py
