@echo off
echo.Verificando se j� existe par de chaves para uso...
echo.

if exist not 'keypair' (
    mkdir keypair
)


if exist "keypair\ubuntu_ed25519*" (
    echo Os seguintes pares de chaves foram localizadas no diret�rio ./keypair
    echo.
    cd keypair & echo %cd% & tree /F | find /I "ubuntu" & echo.
    echo Os pares de chaves acima ser�o usados.
    echo Caso quera usar um novo par de chaves, renomeie ou remova as chaves acima.
) else (
    echo N�o foi encontrado nenhum par de chaves, um novo par ser� criado.
    echo.
    ssh-keygen -t ed25519 -f keypair/ubuntu_ed25519 -N "" -C ubuntu
    echo.
    echo.Par de chaves criado em keypair com sucesso!
    echo.
    cd keypair & echo %cd% & tree /F | find /I "ubuntu"
)
echo.
timeout 5