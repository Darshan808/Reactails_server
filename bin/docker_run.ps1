if (Get-Command -Name "docker" -ErrorAction SilentlyContinue) {
    # Run docker-compose up
    docker compose up -d --build
    # Run docker-compose exec to boot the image
    docker compose exec server bin/entrypoint.sh
    # Run docker-compose down
    docker compose down
}
else {
    Write-Output "Docker is not available. Follow this documentation to install docker: https://docs.docker.com/desktop/install/windows-install/"
}