# mariadb를 설치하는 user-data
data "template_file" "mariadb_userdata" {
  template = <<-EOF
    apt-get install -y apt-transport-https curl
    mkdir -p /etc/apt/keyrings
    curl -o /etc/apt/keyrings/mariadb-keyring.pgp 'https://mariadb.org/mariadb_release_signing_key.pgp'

    cat << EOL > /etc/apt/sources.list.d/mariadb.sources
    # MariaDB 10.11 repository list - created 2024-09-10 01:08 UTC
    # https://mariadb.org/download/
    X-Repolib-Name: MariaDB
    Types: deb
    # deb.mariadb.org is a dynamic mirror if your preferred mirror goes offline. See https://mariadb.org/mirrorbits/ for details.
    # URIs: https://deb.mariadb.org/10.11/ubuntu
    URIs: https://mirrors.xtom.jp/mariadb/repo/10.11/ubuntu
    Suites: jammy
    Components: main main/debug
    Signed-By: /etc/apt/keyrings/mariadb-keyring.pgp
    EOL

    apt-get update
    apt-get install -y mariadb-server

    sudo mariadb-secure-installation << EOF

    Y
    Y
    ubuntu
    ubuntu
    Y
    n
    Y
    Y
    EOF
}
