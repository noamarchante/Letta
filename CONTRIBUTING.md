# ¿Cómo contribuir a este proyecto?

## **Tabla de contenido**

1. Empezando
2. Desarrollo de un tarea
3. Estructura del proyecto
4. Entorno de desarrollo
5. Configuración de un entorno de desarrollo
  	1. MySQL
    	1. Instalación con apt
  	2. Maven
   		1. Instalación con apt
6. Control de versiones
7. Test
8. Guia de estilo



1. **Empezando**

El proyecto Letta se desarrolla en un entorno Java para la creación de una aplicación web. Las dependencias del proyecto, así como, la construcción y ejecución del mismo y de las pruebas se llevan a cabo con Maven. Maven automatiza estos procesos mediante el POM del proyecto.

En este documento encontrarás una descripción del entorno y las instrucciones para saber cómo contribuir correctamente a este proyecto.

2. **Desarrollo de una tarea**

El proceso habitual para realizar una tarea será, normalmente, el siguiente:

1. Selecciona la tarea de la que seas responsable y que deseas desarrollar en **Kunagi** y lee con atención la descripción de esta misma.
2. Abre el entorno de desarrollo
3. Verifica que te encuentras en la rama develop, si no es así, cambiate a esta.
4. Realiza un pull de los últimos cambios (ver sección 6).
5. Implementa la solución, incluyendo los tests (ver sección 7).
6. Haz un commit con cada parte estable (completa y testeada) que desarrolles.
7. Cada vez que hagas un commit envíalo al repositorio central **Gitlab** para compartirlo con el resto del equipo (ver sección 6).
8. Cuando acabes la tarea recuerda añadir las horas en la tarea de **Kunagi** y mover esta misma a **Completed Tasks**.


3. **Estructura del proyecto**

Este proyecto está estructurado en 2 grandes directorios con sub-directorios internos:

- main: Directorio que contiene el código desarrollado para el proyecto.

- test: Directorio que contiene los test desarrollados para el proyecto y las utilidades utilizadas en estos.

Dentro de **main** es importante notar la división entre dos subdirectorios, **java** y **webapp**.

- java:  Directorio que contiene el código desarrollado para el backend del sistema (Java).
- webapp: Directorio que contiene el código desarrollado referente al frontend (javascript, HTML y CSS) organizado en diversos sub-directorios.

Dentro de **java** se encuentran las siguientes subdivisiones referentes a cada una de las partes del backend.

- dao: Directorio donde se contiene las clases del dao (data access object).
- entities: Directorio que contiene las clases de dominio (entidades).
- rest: Directorio que contiene la capa de servicios REST desarrollados.

Dentro de **webapp** se encuentran las siguientes subdivisiones referentes a cada una de las partes del frontend.

- icons: Directorio que contiene los iconos utilizados en la vista de la aplicación
- images: Directorio que contiene las imágenes de los eventos
- js: Directorio que contiene  la interfaz de la aplicación y los dao. Se subdivide en dos directorios, dao y view.
- WEB-INF: Directorio que contiene todos los recursos relacionados con la aplicación web.

Dentro del directorio js existen dos subdirectorios:

-dao: Directorio que contiene los dao que relacionan el backend con el frontend
- view: directorio que contiene las interfaces de la aplicación.

 **4. Entorno de desarrollo**

Las herramientas que componen el entorno de desarrollo del proyecto son las siguientes:

- Maven 3: Es un entorno de construcción de proyectos para Java. Esta será una herramienta clave, ya que es quien dirigirá todo el proyecto. Es necesario que tengas instalado Maven 3 en tu equipo de desarrollo para poder construir el proyecto.
- Kunagi: Es una herramienta de gestión de proyectos Scrum. En ella encontrarás toda la información sobre las funcionalidades desarrolladas y por desarrollar, el alcance de las publicaciones, el estado de desarrollo, etc. Puedes acceder a través del siguiente [enlace](http://www.sing-group.org/dt/kunagi/login.html)
- Git y Gitlab: Git es el sistema de control de versiones que se utiliza en el proyecto. Es un sistema de control de versiones distribuido que facilita la colaboración entre desarrolladores. Es necesario que tengas instalado Git en tu sistema para poder realizar cambios en el proyecto y colaborar con el resto del equipo. Por otro lado, Gitlab es un front-end del repositorio Git común. Esta herramienta facilita la visualización de los commits y ficheros del proyecto, además de proporcionar alguna otra funcionalidad que mejora la colaboración. Puedes acceder a través del siguiente [enlace](http://www.sing-group.org/dt/gitlab/users/sign_in).
- MySQL 5.7.6+ o 8+: es el sistema gestor de base de datos (SGDB) que utilizará el sistema definitivo. En la explicación de cómo ejecutar el sistema en local utilizaremos este SGBD, por lo que deberás tenerlo instalado en tu equipo.



 **5. Configuración de un entorno de desarrollo**

Empezar a trabajar en el proyecto es tan sencillo como seguir los siguientes pasos:

1. Instala Git y Maven. Si estás en un entorno Ubuntu es tan sencillo como ejecutar `sudo apt-get install git maven` También es recomendable que instales algún visor de Git como _gitk_ o _qgit_. En Windows tienes que instalar Maven descargándolo de este [enlace](http://maven.apache.org/download.cgi#Installation) y editar las variables de entorno para poder acceder a él desde cualquier directorio. Para instalar Git en Windows debes acceder a este [enlace](https://git-scm.com/) y seguir los pasos de instalación.
2. Clona el repositorio Git utilizando el comando: `git clone http://sing-group.org/dt/gitlab/daa2021-teamC/letta.git`
3. Descarga el IDE desde [https://www.eclipse.org/downloads/eclipse-packages/](https://www.eclipse.org/downloads/eclipse-packages/)
4. Importa el proyecto en eclipse utilizando _Import … → Existing Maven projects_, selecciona el directorio del proyecto en _Root directory_ y marca todos los proyectos que aparezcan.

En la sección 7.3.1 aparece detallada la configuración necesaria para ejecutar los tests desde Eclipse.

La configuración del proyecto ha sido preparada para permitir varios tipos de ejecución:

 **5.1 Ejecución de la aplicación con Tomcat y MySQL**

El proyecto está configurado para poder ejecutar la aplicación sin tener que realizar ninguna configuración adicional salvo tener disponible un servidor MySQL en local.

Los ficheros del proyecto _db/mysql.sql_ y _&#39;db/mysql-with-inserts.sql&#39;_ contienen todas las consultas necesarias para crear la base de datos y el usuario requeridos, con o sin datos de ejemplo, respectivamente. Por lo tanto, podemos configurar inicialmente la base de datos con cualquiera de los siguientes comandos (desde la raíz el proyecto):

  - Sin datos: `mysql -u root -p \&lt; db/mysql.sql`
  - Con datos: `mysql -u root -p \&lt; db/mysql-with-inserts.sql`

Una vez configurada la base de datos podemos lanzar la ejecución con el comando: _mvn -Prun -DskipTests=true package cargo:run_

La aplicación se servirá en la URL local: _http://localhost:9080/Letta

Para detener la ejecución podemos utilizar _Ctrl+C_.

  **5.2  Ejecución de la aplicación con Tomcat y MySQL con redespliegue automático**

Durante el desarrollo es interesante que la aplicación se redespliegue de forma automática cada vez que se hace un cambio. Para ello podemos utilizar el siguiente comando: `mvn -Prun -DskipTests=true package cargo:start fizzed-watcher:run`

La aplicación se servirá en la URL local: _http://localhost:9080/Letta

Para detener la ejecución podemos utilizar _Ctrl+C_.

6. **Control de versiones (Git)**

El modelo de control de versiones será sencillo, aunque inicialmente ya contamos con que utilizaremos al menos tres ramas:

- master: a esta rama solo se enviarán los commits cuando se llegue a una versión estable y publicable (una release). Estas versiones deberán estar etiquetadas con el número de versión correspondiente.

- develop: esta será la rama principal de trabajo. Los commits que se envíen deben ser estables, lo que supone que el código debe incluir tests y todos deben superarse exitosamente al construir la aplicación en local.

- tmp-: las ramas con el prefijo tmp- son ramas temporales. Cada pareja sólo podrá tener una única rama temporal, que deberá eliminar de los repositorios local y remoto en el momento que ya no sean necesarias. Las ramas temporales siempre deben crearse desde la rama develop. La pareja propietaria de la rama podrá hacer push y pull, mientras que el resto solo podrán hacer pull. Este tipo de ramas admite cualquier tipo de commit (p.ej. código incompleto, código que no compila, código sin tests, etc.) y, por tanto, no serán controladas por el servidor de integración continua. Por último, el nombre de la rama debe ser:
  - tmp-\&lt;pareja\&gt;: dónde \&lt;pareja\&gt; son las iniciales de la pareja propietaria en mayúsculas.

**6.1. Commits con errores de construcción**

Antes de realizar un commit se deberá controlar que al menos alguno de los desarrolladores haya ejecutado los test y estos hayan concluido satisfactoriamente.

En el caso de que, por un error, se acabe haciendo un commit con fallos es muy importante deshacer el último commit para volver a un estado estable.

Aunque existen varias formas de hacer esto, la forma más directa es: `git push origin +HEAD^:develop`

Este comando fuerza a que la rama develop remota se sitúe en el commit anterior a HEAD, ya que HEAD es el commit conflictivo. El commit seguirá existiendo en local y se espera que tras corregir los errores se realice un `git commit --amend`

Si se desea descartar el commit local pero mantener el estado de los ficheros,puede utilizarse un `git reset --mixed HEAD^`

**6.2. Push con commits nuevos en el servidor remoto**

Si se desea hacer un push a un servidor remoto en el cual hay commits que nuevos que no tenemos en local, entonces Git muestra un error en el que nos indica que debemos hacer un pull antes de poder hacer push.

Dado que no nos interesa tener que añadir un commit de merge adicional,el pull debe hacerse aplicando un rebase. Para ello debe usarse el comando: `git pull --rebase`

Este comando iniciará un proceso de rebase desde la rama local hacia la rama remota. Es decir, los commit locales no pusheados pasarán a tener como padre el último commit remoto.

**Nota** : es muy recomendable configurar el proyecto para que siempre que se haga un pull que traiga nuevos commits se haga un rebase en lugar de merge. Es decir, para que se comporte como se ha descrito más arriba. Para esto podemos modificar la configuración del proyecto de la siguiente manera: `git config pull.rebase true `

Con esta configuración ya no tendríamos que añadir el modificador --rebase al hacer pull.


**6.3. Pull con cambios locales no commiteados**

En caso de que nos encontremos en medio de un commit (no se ha completado los cambios necesarios para realizar un commit) y deseemos descargar nuevos commits del servidor central, podemos hacerlo utilizando los comandos:

`git stash`

`git pull --rebase`

`git stash pop`

 **7. Tests**

Lo primero que se debe tener en cuenta a la hora de realizar tests es la existencia del módulo tests. Este proyecto está pensado para recoger las clases de utilidad que puedan ser compartidas por los tests de los distintos módulos que forman el proyecto.

En segundo lugar, es importante ser consciente de que, dependiendo del módulo en el que nos encontremos, deberemos hacer diferentes tipos de test.

Por último, como norma general, los métodos de prueba deben ser lo más sencillos posible, de modo que sea sencillo comprender qué es lo que se está evaluando. En base a esta regla, no se realiza documentación Javadoc a los métodos de prueba (esto no se aplica a las clases de utilidad del módulo tests, que sí que deben estar documentadas con Javadoc).

A continuación se detalla el proceso de realización de tests.

**7.1 Tests por módulo**

Los tests que se deben hacer varían según el módulo en el que nos encontremos. En concreto, los tests que habrá que hacer serán los siguientes:

- entities: tests de unidad para probar las entidades. Solo se testearán los constructores y los métodos con una cierta lógica, como pueden ser los métodos de las relaciones.

- dao: Se realizarán test de unidad para comprobar el correcto funcionamiento del SGBD, así como, test de integración con la capa REST. Para este tipo de pruebas se utiliza una base de datos HSQL en memoria.

- rest: tests de unidad e integración sobre las funcionalidades REST creadas. Se realizarán test para cada una de las casuísticas que puedan ocurrir, por ejemplo, en caso de una modificación será necesario comprobar que se acepta una modificación correcta, pero también que en caso de campos vacíos o no válidos se deniegue esta misma.

**7.2 El módulo tests**

En el módulo tests se añadirán varias utilidades para realizar los tests,entre las que encontraremos, principalmente, tres tipos distintos:

Clases Datasets: estas clases representan un conjunto de datos de pruebas. Contienen métodos para obtener a entidades que resultan de utilidad los tests. Estas clases deben ubicarse en el mismo paquete que las entidades que contienen. El contenido de estas clases debe ser equivalente al contenido de los datasets de DBUnit que se describe a continuación.

Datasets DBUnit: los _datasets_ DBUnit son representaciones en forma de XML de conjuntos de datos usados en los tests y pueden ser utilizados directamente por con las anotaciones _@UsingDataSet_ y _@ShouldMatchDataSet_. El contenido de estos ficheros debe ser el equivalente de las clases dataset. Estos ficheros deben almacenarse en el directorio_src/main/resources/datasets._

Matchers Hamcrest para entidades: cada entidad debería tener un matcher de Hamcrest que permita compararla con otras entidades. Para facilitar el desarrollo de estos matchers se incluye la clase _IsEqualsToEntity_, que actúa como clase base para comparar dos entidades por sus propiedades.

**7.3 Ejecución de los test en Maven**

Este proyecto está configurado para ejecutar, únicamente, los tests de aquellas clases cuyo nombre acabe en _TestSuite_. La intención es que estas clases sean suites de tests que agrupen los casos de prueba del proyecto. Por lo tanto, **es importante que todos los casos de prueba que se deseen ejecutar en el proyecto estén asociados a una suite de pruebas.**

Todos los tests del proyecto están configurados para ser ejecutados como tests normales y no como tests de integración. Esto significa que se pueden lanzar todos simplemente ejecutando el comando:

`mvn install`

_o_

`mvn -Prun -DskipTests=false package cargo:start fizzed-watcher:run`

 **8. Guía de estilo**

Un elemento importante para poder colaborar es que exista una uniformidad en el código y otros elementos que forman parte del desarrollo. Esta sección sirve como una pequeña guía de estilo que debe respetarse al trabajar en el proyecto.

**8.1.Código Fuente**

Para uniformizar el código fuente deben respetarse las siguientes normas:

Idioma: todo el código (incluyendo la documentación) debe desarrollarse en inglés.

Formato de código: el código debe estar formateado, preferiblemente,siguiendo la [Guía de Estilo para Java de Google](https://google.github.io/styleguide/javaguide.html) o, al menos, utilizando el formato de código de Eclipse (_Ctrl+Mayus+F_).

Comentarios: debe evitarse **completamente** el código comentado y, en la medida de lo posible, los comentarios en el código.

Documentación: todas las clases deben incluir documentación Javadoc que describa las responsabilidades de la misma. No es obligatorio documentar los métodos. Se recomienda que se verifique que la documentación es correcta utilizando el comando _mvn javadoc:javadoc_. Este comando generará documentación en formato HTML y fallará si encuentra algún error en la documentación.

**8.2.Control De Versiones** 

Una de las bases de desarrollo que utilizaremos en este proyecto es el **integrar tan pronto como se pueda**. Para ello, deben seguirse las siguientes normas:

Contenido de los commits: los commits deben ser completos en el sentido de que no deben romper la construcción. Además, el código debe estar probado, incluyendo los tests descritos en la sección 7, para que el resto de desarrolladores puedan confiar en el código. Es muy recomendable revisar los informes de tests y de cobertura antes de hacer un commit.

Formato:

El formato de los commits deberá respetar las siguientes normas:

- Escritos en inglés.
- Limitar el tamaño de línea a 80 columnas. Si se utiliza Eclipse, esto se hace de forma automática.

El título del commit debe identificar la tarea realziada:

- Si está relacionado con alguna tarea concreta de las descritas en Kunagi, debe comenzar con el identificador de la tarea (p.ej. &quot;tsk1 Adds...&quot;) y a continuación el nombre de esta.
- Si está relacionado con varias tareas, su número se separará con un guión(p.ej. &quot;tsk1-2-13 Fixes...&quot;).
- Debe estar redactada en tercera persona del presente (p.ej. _Adds...,Improves..., Modifies..., etc._).
- No debe llevar punto al final.

Cuerpo del commit descriptivo:

-Nombres de los participantes separados por un guión
- A continuación en otra línea, debe escribirse un texto que explique claramente el trabajo hecho en el

commit.

Frecuencia de commit: los commits deben hacerse en pequeños pasos para que la frecuencia sea alta. Para ello es recomendable desarrollar de una forma ordenada, atacando partes concretas Además, deberán estar distribuidos a lo largo de toda la semana, evitando, especialmente, realizar todos justo antes de la daily meeting ya que esto afectaría a la revisión del código por parte de los compañeros.

Frecuencia de push: siempre que se haga un commit debe hacerse un push. La única excepción a esta regla es que estemos haciendo pruebas locales para evaluar una posible solución. En tal caso, es recomendable que esto se haga en una rama independiente para evitar enviar commits accidentalmente a la rama develop remota.
