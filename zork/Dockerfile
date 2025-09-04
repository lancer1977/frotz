FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
RUN apt-get update && apt-get install -y frotz
WORKDIR /app
COPY . .
RUN dotnet build
ENTRYPOINT ["dotnet", "YourApp.dll"]
