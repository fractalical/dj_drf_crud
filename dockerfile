# Указывает Docker использовать официальный образ python 3 с dockerhub в качестве базового образа
FROM python:3.9
# Устанавливает переменную окружения, которая гарантирует, что вывод из python будет отправлен прямо в терминал без предварительной буферизации
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Устанавливает рабочий каталог контейнера — "app"
WORKDIR /app

ENV HOME=/app
ENV APP_HOME=/app/python_app
RUN mkdir $APP_HOME
RUN mkdir $APP_HOME/staticfiles
WORKDIR $APP_HOME

# Копирует все файлы из нашего локального проекта в контейнер
COPY . .

# Запускает команду pip install для всех библиотек, перечисленных в requirements.txt
RUN pip install -r requirements.txt

RUN sed -i 's/\r$//g' entrypoint.sh
RUN chmod +x entrypoint.sh

# run entrypoint.sh
ENTRYPOINT ["/app/python_app/entrypoint.sh"]