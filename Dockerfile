FROM python:3.11
# https://github.com/sdispater/pendulum/issues/753

ARG VERSION
ENV VERSION ${VERSION:-master}

RUN python -m pip --no-cache-dir install git+https://github.com/eggplants/heartbeat-status@${VERSION}

EXPOSE 8080
ENTRYPOINT ["python", "-m", "uvicorn", "heartbeat-status.main:app", "--host", "0.0.0.0", "--port", "8080"]
