
# colocar aqui uma função para deixar o HOME (do sistema de diretórios e arquivos) mais limpo
# ou usar o próprio .config ou criar um .system_stuff (ver o que deixa mais clean)

func(){
  # se tiver essas coisas instaladas ou forem instaladas em algum momento adicionar esses comandos em ~/.bash_config/aliases/exports.sh
  # e mover as pastas ou arquivos para a pasta .system_stuff ou .config


  # --- Configurações de Limpeza da Home (XDG) ---
  
  # --- RUST ---
  export RUSTUP_HOME="$HOME/.local/share/rustup"
  # Adiciona os binários do Cargo ao PATH (para os comandos funcionarem)
  export PATH="$CARGO_HOME/bin:$PATH"
  
  

}

