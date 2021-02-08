# KantoDex

EN:

I chose to implement Kanto’s region Pokédex, which contains 151 Pokémon.
In the main screen we have the Pokémon’s list, with their name, number and image.
The screen has pagination. When making an unsuccessful call to the API, an error page is shown.
While waiting for the server response, a loading page is displayed.
Clicking an entry, redirects to the detail page for the selected Pokémon.
The detail page contains the Pokémon’s image (distinct from the main page’s), and a set of relevant details.
The app supports screen rotation events, and is available for iOS 12 or higher.
Being a small project, I chose a modified VIPER architecture, without the Interactor, though in my current project the Interactor is used.
About the JsonParser() class, in this case I chose to use SwiftyJSON, but another possible solution would have been to use the Codable protocol.
In a real project I would’ve implement String localization, as well as persistence and testing.

PT:

Decidi implementar a Pokédex da região de Kanto, que conta com 151 Pokémon.
A página principal contém a lista de Pokémon, com o seu nome, número e imagem.
A lista está implementada com paginação. Está preparada uma página de erro, para quando não se obtém uma resposta bem sucedida, por parte da API.
Também estão implementados loadings, que são mostrados enquanto se aguarda pelas respostas das chamadas.
Quando se clica numa entrada da lista, acede-se à página de detalhe do respectivo Pokémon, que contém a sua imagem (diferente da que está na lista), e um conjunto de detalhes relevantes, acerca do Pokémon.
A app está preparada para adaptar a sua UI às rotações do ecrã, e está disponível para iPhones com iOS 12 ou superior.
Tratando-se de um projecto pequeno, decidi implementar a arquitectura VIPER modificada, abdicando do Interactor, que é um componente que estou habituado a utilizar na arquitectura VIPER, do projecto em que estou inserido actualmente.
Em relação à classe JsonParser(), optei neste caso por utilizar SwiftyJSON, mas outra possível solução seria ter utilizado o protocolo Codable.
Num projecto real, teria implementado também “localização” de Strings, para disponibilizar a app em vários idiomas, assim como persistência e testes.
