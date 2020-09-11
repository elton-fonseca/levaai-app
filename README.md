# levaai1

processo para update do flutter

flutter pub upgrade --force

Depois baixei a versão nova do dart https://dart.dev/tools/sdk/archive  e troquei onde o path apontava

Ai tive que subir na variável path o dart para o slidy funcionar

então limpei tudo no projeto com comando:

slidy run mobx_build

para pegar novo pacote basta executar:

flutter pub get


//ubuntu

sudo chown elton /dev/kvm


colocar valor local_storage:

LocalStorage.setValue<String>('chave','valor',);

pegar:

LocalStorage.getValue<String>('token').then(print);

return await LocalStorage.getValue<String>(chave).then((value) {
      
});