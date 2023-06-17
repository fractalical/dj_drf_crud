# Указывает Docker использовать официальный образ python 3 с dockerhub в качестве базового образа
FROM python:3.9
# Устанавливает переменную окружения, которая гарантирует, что вывод из python будет отправлен прямо в терминал без предварительной буферизации
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Устанавливает рабочий каталог контейнера — "app"
WORKDIR /app

# Копирует все файлы из нашего локального проекта в контейнер
COPY . .

RUN mkdir /app/staticfiles

# Запускает команду pip install для всех библиотек, перечисленных в requirements.txt
RUN pip install -r requirements.txt

RUN sed -i 's/\r$//g' entrypoint.sh
RUN chmod +x entrypoint.sh

# run entrypoint.sh
ENTRYPOINT ["/app/entrypoint.sh"]