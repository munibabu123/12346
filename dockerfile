FROM microsoft/dotnet:2.2-sdk AS build-env

WORKDIR /app
COPY . ./

RUN ls
RUN dotnet publish ./Service/DPS.Service.csproj -c Release -o ../out



FROM microsoft/dotnet:3.0.0-preview2-runtime-deps-bionic

WORKDIR /app
COPY --from=build-env /app/out .
RUN ls

ENTRYPOINT ["dotnet", "DPS.Service.dll"]
