# Указывает Docker использовать официальный образ python 3 с dockerhub в качестве базового образа
FROM python:3.9
# Устанавливает переменную окружения, которая гарантирует, что вывод из python будет отправлен прямо в терминал без предварительной буферизации
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
# Устанавливает рабочий каталог контейнера — "app"
WORKDIR /app
# Копирует все файлы из нашего локального проекта в контейнер
COPY . /app
# Запускает обновление pip
RUN apt-get update -y \
    && apt-get upgrade -y pip \
    && pip install --upgrade pip \
# Запускает команду pip install для всех библиотек, перечисленных в requirements.txt
RUN pip install -r requirements.txt
