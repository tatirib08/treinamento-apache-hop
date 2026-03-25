# Use a imagem oficial do pgvector
FROM pgvector/pgvector:pg17

# Instala o suporte a locales e gera o pt_BR -> para ubuntu
RUN apt-get update && apt-get install -y locales \
    && sed -i -e 's/# pt_BR.UTF-8 UTF-8/pt_BR.UTF-8 UTF-8/' /etc/locale.gen \
    && locale-gen

# Configura o sistema para usar pt_BR por padrão (opcional, mas recomendado)
ENV LANG pt_BR.UTF-8  
ENV LANGUAGE pt_BR:pt  
ENV LC_ALL pt_BR.UTF-8

# Variáveis de ambiente para o PostgreSQL
ENV POSTGRES_USER=postgres
ENV POSTGRES_PASSWORD=qualquer_uma # substitua por sua senha
ENV POSTGRES_DB=BD_PESQUISADOR
ENV POSTGRES_HOST_AUTH_METHOD=trust
# Copie o arquivo script de inicialização para o container
COPY init_db.sh /docker-entrypoint-initdb.d/init_db.sh
# Concede permissão de execução ao script de
RUN chmod +x /docker-entrypoint-initdb.d/init_db.sh
# Expõe a porta 5437
EXPOSE 5437
