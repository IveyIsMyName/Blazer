FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build

WORKDIR /app

# Копируем файл проекта и восстанавливаем зависимости
COPY ./BlazerAcademy/BlazerAcademy.csproj ./BlazerAcademy/
RUN dotnet restore ./BlazerAcademy/BlazerAcademy.csproj

# Копируем весь исходный код
COPY . .

# Публикуем приложение
WORKDIR /app/BlazerAcademy
RUN dotnet publish -c Release -o out

# Финальный образ
FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /app
COPY --from=build /app/BlazerAcademy/out .

EXPOSE 8080
ENV ASPNETCORE_URLS=http://0.0.0.0:8080

ENTRYPOINT ["dotnet", "BlazerAcademy.dll"]