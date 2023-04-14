FROM microsoft/dotnet:6.0-sdk AS build-env

WORKDIR /app
COPY . ./

RUN ls
RUN dotnet publish ./Service/DPS.Service.csproj -c Release -o ./out



FROM mcr.microsoft.com/dotnet/aspnet:6.0

WORKDIR /app
COPY --from=build-env /app/out .
RUN ls

ENTRYPOINT ["dotnet", "DPS.Service.dll"]
