# Базовый образ с SDK для сборки
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build

# Устанавливаем рабочую директорию
WORKDIR /src

# Копируем весь проект
COPY . .

# Переходим в папку проекта
WORKDIR /src/BlazerAcademy

# Восстанавливаем зависимости и публикуем
RUN dotnet restore
RUN dotnet publish -c Release -o /app/publish

# Финальный образ с runtime
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS runtime
WORKDIR /app

# Копируем опубликованные файлы
COPY --from=build /app/publish .

# Открываем порт
EXPOSE 8080

ENV ASPNETCORE_URLS=http://0.0.0.0:8080

# Запускаем приложение
ENTRYPOINT ["dotnet", "BlazerAcademy.dll"]