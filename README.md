# LETTA: Let's Talk About… #

## Una red social de micro-quedadas ##

LETTA es una aplicación que se basa en dos ideas centrales: los clubes de lectura y el aprovechamiento de pequeños espacios de tiempo disponibles a lo largo del día (descanso del trabajo, hora de la comida, viajes en metro, etc.). De los clubes de lectura se toma la idea de juntar un grupo de personas para poner en común sus opiniones sobre un libro seleccionado previamente. LETTA actualiza este concepto para extender el ámbito cultural de estos clubes más allá de la literatura y, especialmente, para flexibilizar la organización de los mismos.

 La idea principal de LETTA es permitir a los usuarios crear grupos de discusión en vivo sobre cualquier elemento cultural más allá de los libros, como puede ser una serie, una película, una obra de teatro, un partido de fútbol, etc. Frente al modelo tradicional de clubes privados y con una periodicidad concreta, LETTA permitirá crear grupos de discusión en ubicaciones públicas y en cualquier momento, de modo que los usuarios puedan aprovechar momentos “vacíos” de su día a día (p.ej. el viaje en metro hasta su trabajo, un descanso para café, la hora de la comida, etc.) para quedar con otra gente que comparta sus mismos intereses y con la que pueda charlar sobre ellos. 

La aplicación está desarrollada como una SPA utilizando java como lenguaje de programación de la lógica de negocio.


## Dependencias
Este proyecto está diseñado para ser desarrollado en un entorno con:

* Maven 3
* Java 8
* MySQL 5.7.6+ o 8+

Además, se recomienda emplear la última versión de Eclipse IDE for Enterprise
Java Developers.

## Ejecución con Maven
La configuración de Maven ha sido preparada para permitir varios tipos de
ejecución.

### Ejecución de la aplicación con Tomcat y MySQL

El proyecto está configurado para poder ejecutar la aplicación sin tener que
realizar ninguna configuración adicional salvo tener disponible un servidor
MySQL en local.

Los ficheros del proyecto `db/mysql.sql` y 'db/mysql-with-inserts.sql' contienen
todas las consultas necesarias para crear la base de datos y el usuario
requeridos, con o sin datos de ejemplo, respectivamente. Por lo tanto, podemos
configurar inicialmente la base de datos con cualquiera de los siguientes
comandos (desde la raíz el proyecto):

* Sin datos: `mysql -u root -p < db/mysql.sql`
* Con datos: `mysql -u root -p < db/mysql-with-inserts.sql`

Una vez configurada la base de datos podemos lanzar la ejecución con el comando:

`mvn -Prun -DskipTests=true package cargo:run`

La aplicación se servirá en la URL local: http://localhost:9080/Letta

Para detener la ejecución podemos utilizar `Ctrl+C`.

### Ejecución de la aplicación con Tomcat y MySQL con redespliegue automático

Durante el desarrollo es interesante que la apliación se redespliegue de forma
automática cada vez que se hace un cambio. Para ello podemos utilizar el
siguiente comand:

`mvn -Prun -DskipTests=true package cargo:start fizzed-watcher:run`

La aplicación se servirá en la URL local: http://localhost:9080/Letta

Para detener la ejecución podemos utilizar `Ctrl+C`.

### Construcción con tests de unidad e integración

En esta construcción se ejecutarán todos los tests relacionados con el backend:

* **Unidad**: se utilizan para testear las entidades y las capas DAO y REST de
forma aislada.
* **Integración**: se utilizan para testear las capas REST y DAO de forma
integrada. Para este tipo de pruebas se utiliza una base de datos HSQL en
memoria.

El comando para lanzar esta construcción es:

`mvn install`
