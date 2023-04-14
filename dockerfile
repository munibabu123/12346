FROM microsoft/dotnet:2.2-sdk AS build-env

WORKDIR /app
COPY . ./

RUN ls
RUN dotnet publish ./Service/DPS.Service.csproj -c Release -o ../out



FROM microsoft/dotnet:2.2-aspnetcore-runtime

WORKDIR /app
COPY --from=build-env /app/out .
RUN ls

ENTRYPOINT ["dotnet", "DPS.Service.dll"]
