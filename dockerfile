# Указывает Docker использовать официальный образ python 3 с dockerhub в качестве базового образа
FROM python:3.9
# Устанавливает переменную окружения, которая гарантирует, что вывод из python будет отправлен прямо в терминал без предварительной буферизации
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN apt install -y netcat
# Устанавливает рабочий каталог контейнера — "app"
WORKDIR /app
# Запускает команду pip install для всех библиотек, перечисленных в requirements.txt
COPY ./requirements.txt .
RUN pip install -r requirements.txt

COPY ./entrypoint.sh .
RUN sed -i 's/\r$//g' /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

# Копирует все файлы из нашего локального проекта в контейнер
COPY . .

# run entrypoint.sh
ENTRYPOINT ["/app/entrypoint.sh"]