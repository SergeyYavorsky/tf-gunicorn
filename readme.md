To build the image:

    docker build --squash -t docker-registry.masterdm.ru:5000/md/tf-gunicorn .
    docker push docker-registry.masterdm.ru:5000/md/tf-gunicorn

To run it:

    docker pull docker-registry.masterdm.ru:5000/md/tf-gunicorn
    docker run -d -it -p 5000:5000 --name tf-gunicorn -v /opt/docker_share/apps:/opt/apps docker-registry.masterdm.ru:5000/md/tf-gunicorn

