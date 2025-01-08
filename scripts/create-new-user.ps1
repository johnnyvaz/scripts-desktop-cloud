# Caminho para o arquivo CSV
$csvPath = "C:\caminho\para\usuarios.csv"

# Importar o CSV
$usuarios = Import-Csv -Path $csvPath

# Loop para criar os usuários
foreach ($usuario in $usuarios) {
    try {
        # Criar o usuário local
        New-LocalUser -Name $usuario.Name `
                      -FullName $usuario.FullName `
                      -Description $usuario.Description `
                      -Password (ConvertTo-SecureString $usuario.Password -AsPlainText -Force) `
                      -PasswordNeverExpires $true

        Write-Host "Usuário '$($usuario.Name)' criado com sucesso."
    } catch {
        Write-Host "Erro ao criar o usuário '$($usuario.Name)': $_"
    }
}
