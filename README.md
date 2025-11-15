# AnimeGuide

Aplicación móvil desarrollada en Flutter, dirigida a aficionados y a quien quiera informarse antes de comenzar un anime o un manga. Proporciona fichas completas por anime/manga y permitiendo marcar favoritos para seguimiento personal. AnimeGuide no reproduce capítulos; solo ofrece información y enlaces externos para consulta.

## Pantallas y Funcionalidades principales
- **Home** 
    - Sucesion de títulos de anime/manga por categorias, tales como: populares, emision y generos de anime.
    - Listas horizontales de los animes/mangas por cada categorias, junto a la imagen y titulo
    - Preferencias de mostrar anime por genero
- **Search** 
    - Búsqueda en especifico de anime/manga a traves del nombre o mas general a traves del genero.
    - Resultado con miniatura del anime/manga junto al nombre  
- **Favorites** 
    - Lista de animes/mangas agregados a favoritos. 
    - Posibilidad de eliminar de favoritos
- **Perfil**
    -  Configuracion de foto de perfil
    -  Configuracion de nombre de usuario
- **Anime Detail** 
    - Ficha del anime/manga en donde se mostrara una portada grande, título, chips (género · episodios · estado), sinopsis (colapsable), ficha técnica (año, creador, estudio), personajes principales, enlaces externos y botón **Agregar a favoritos**.
- **Configuration**
    - Pantalla de configuracion en la cual se podra configurar el tema con el cual se querra ver la aplicacion, y tamabien se podra configurar el tipo de fuente con el cual se utilizara la aplicacion
- **Acerca de..**
    - Se muestra informacion del desarrollador, como comunicarse con el y cual era la idea general de la aplicacion. A la vez encontrara una seccion en la cual puede valorar en general la aplicacion, junto con          dar unas recomendaciones 
- **SplashScreen** 
    - Pantalla de inicio en donde se muestra el logo de la aplicacion con el nombre de esta, mientras se aparece y desvanece 

## Estructura de ficha de anime
- Portada: imagen principal horizontal.

- Título: nombre del anime/manga.

- Sinopsis: resumen de la serie.

- Datos: genero principal, temporadas, estado, episodios.

- Ficha tecnica: creador, estudio, año de lanzamiento.

- Personajes principales: lista con nombre e imagen del personaje.

- Enlaces: trailer y enlaces para ver/leer.

- Acciones: boton para agregar/remover de favoritos.

## Pila de Tecnología

Cliente: Flutter, Android

## Capturas de pantalla

**Pantalla de Home**

<img width="226" height="716" alt="image" src="https://github.com/user-attachments/assets/5c939b29-1f7f-4014-b82f-0d6fe781afa8" />

**Pantalla de Search**

<img width="224" height="723" alt="image" src="https://github.com/user-attachments/assets/ffaec790-638f-4886-8899-dc77ede7761f" />

**Pantalla de favoritos**

<img width="227" height="707" alt="image" src="https://github.com/user-attachments/assets/c02c4874-2f02-4411-929a-ad644d9810d7" />

**Pantalla de Perfil**

<img width="223" height="721" alt="image" src="https://github.com/user-attachments/assets/f6e6d3a4-465b-4a89-9226-f92b780a2096" />

**Pantalla de Acerca de..**

<img width="219" height="696" alt="image" src="https://github.com/user-attachments/assets/e3f70d01-247f-42ca-85ea-27095b76cf6b" />

**Pnatalla de Configuracion**

<img width="235" height="699" alt="image" src="https://github.com/user-attachments/assets/d6e30f4e-55b7-4f4e-97b7-6eb73d645b2d" />


**Barra de navegacion**
- Home: Pantalla donde se muestran animes
- Search: Pantalla para buscar animes
- Favoritos: Pantalla para mostrar animes favoritos
- Pefil: Pantalla donde se ve el perfil del usuario

<img width="391" height="168" alt="image" src="https://github.com/user-attachments/assets/7ad1b2e5-e9b3-47a5-8930-1970807cbe65" />

**Acceso a pantalla "Acerca de" y "Configuracion"**
- A traves del primer boton se puede acceder a la pantalla "Acerca de" y con el segundo a pantalla de "Configuracion"
<img width="420" height="71" alt="image" src="https://github.com/user-attachments/assets/2b219508-62e4-40ff-84e9-c11018e6c2c9" />

## Diagrama de flujo - Caso de uso

Buscar un anime y agregarlo a favoritos

```mermaid
flowchart TD
  Start([Start]) --> A[Abrir la aplicación]
  A --> B[Buscar anime]
  B --> D{¿Está en pantalla home a primera vista?}
  D -- Sí --> E[Seleccionar anime buscado]
  D -- No --> F[Seleccionar filtro por género]
  F --> G{¿Se ve el anime?}
  G -- Sí --> E
  G -- No --> H[Entrar en pantalla de búsqueda]
  H --> I[Ingresar nombre de anime]
  I --> E
  E --> J[Presionar botón de favoritos]
  J --> End([End])
```


## Diagrama de flujo 
```mermaid
stateDiagram-v2
    [*] --> SplashScreen

    SplashScreen --> Home

    Home --> AnimeDetails
    Home --> Search
    Home --> Favorite
    Home --> Perfil
    Home --> Acerca
    Home --> Configuracion

    Search --> Home
    Search --> Favorite
    Search --> AnimeDetails
    Search --> Perfil
    Search --> Acerca
    Search --> Configuracion

    Favorite --> Home
    Favorite --> Search
    Favorite --> AnimeDetails
    Favorite --> Perfil
    Favorite --> Acerca
    Favorite --> Configuracion

    Perfil --> Home
    Perfil --> Search
    Perfil --> Favorite
    Perfil --> Acerca
    Perfil --> Configuracion

    Configuracion --> Home
    Configuracion --> Search
    Configuracion --> Favorite
    Configuracion --> Perfil

    Acerca --> Home
    Acerca --> Search
    Acerca --> Favorite
    Acerca --> Perfil
    Acerca --> Valorizacion

    Valorizacion --> Acerca

    AnimeDetails --> Home
    AnimeDetails --> Search
    AnimeDetails --> Favorite
```

## Link video explicatorio
https://youtu.be/Cts8jx8JwIk
