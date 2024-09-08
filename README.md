=======

  DOCUMENTACIÓN DEL PROYECTO
=========================

Nombre del proyecto: Menú de Restaurante FoodPlease - App desarrollada en Flutter


  INTRODUCCIÓN
=========================

Esta es una aplicación móvil simple desarrollada en Flutter utilizando Dart, cuyo objetivo es gestionar productos del menu por parte de los restaurantes.
Los usuarios pueden agregar, editar y modificar productos en el menú. Los datos se almacenan en una base de datos local que puede
ser consultada y manipulada mediante una API interna.


  FUNCIONALIDADES
=========================

- Ver productos en el menú.
- Agregar productos con los campos: nombre, valor y disponibilidad.
- Editar el nombre y valor de los productos desde la pantalla principal.
- Cambiar la disponibilidad de un producto utilizando un interruptor (switch).
- Almacenar y recuperar productos en una base de datos local (simulada).


  ESTRUCTURA DE LA APP
=========================

La aplicación consta de los siguientes elementos principales:

1. **Pantalla principal (MenuPage)**:
   - Aquí se muestra una lista de productos del menú en un `ListView`.
   - Cada producto se puede seleccionar para editar su nombre y valor.
   - Cada producto tiene un interruptor para cambiar su disponibilidad.

2. **Pantalla para agregar productos (AddProductoPage)**:
   - Pantalla accesible desde el botón flotante en la pantalla principal.
   - Permite agregar un nuevo producto al menú introduciendo un nombre, valor y estableciendo su disponibilidad.

3. **API local (MenuApi)**:
   - `MenuApi` simula la interacción con una base de datos, almacenando los productos.
   - Métodos principales:
     - `fetchMenu`: Devuelve la lista de productos.
     - `addProducto`: Agrega un producto al menú.
     - `editProducto`: Modifica un producto existente.

4. **Diálogo de edición de productos**:
   - Cuando se hace clic en un producto en la pantalla principal, se abre un diálogo que permite editar el nombre y el valor del producto.
   - Al guardar los cambios, estos se reflejan inmediatamente en la lista.


  INSTRUCCIONES PARA USO
=========================

1. **Iniciar sesión**:
   Los siguientes usuarios se encuentran cargados para pruebas con sus respectivos roles:
   - usuario: admin, password: admin, rol: restaurant
   - usuario: cliente, password: cliente, rol: cliente
   - usuario: repartidor, password: repartidor, rol: repartidor
   
   Una vez autenticado, se podra observar las opciones disponibles y cuales estan deshabilitadas para cada rol.
2. **Agregar Producto**:
   - Pulsa el botón flotante en la esquina inferior derecha de la pantalla principal.
   - Completa los campos de nombre, valor, y selecciona la disponibilidad.
   - Presiona "Agregar Producto" para añadirlo a la lista.

3. **Editar Producto**:
   - En la lista de productos, pulsa sobre el producto que deseas editar.
   - Aparecerá un diálogo que permite modificar el nombre y el valor del producto.
   - Presiona "Guardar" para aplicar los cambios.

4. **Cambiar Disponibilidad**:
   - Utiliza el interruptor (switch) al lado de cada producto para cambiar su disponibilidad.


  REQUISITOS
=========================

- Dart SDK
- Flutter SDK
- Editor de código compatible (se utilizó Visual Studio Code en el desarrollo)


CÓMO EJECUTAR EL PROYECTO
=========================

1. Clona el proyecto o descarga el código fuente.
2. Abre el proyecto en Visual Studio Code.
3. Asegúrate de que Flutter y Dart estén correctamente instalados.
4. Ejecuta `flutter pub get` para instalar las dependencias.
5. Conecta un emulador o un dispositivo físico.
6. Ejecuta `flutter run` para compilar y ejecutar la aplicación.


  ARCHIVOS CLAVE
=========================

- **main.dart**: Contiene la lógica de la pantalla principal y la interacción con la API local.
- **login_page.dart**: Permite la autenticacion de usuarios por rol a la aplicacion.
- **main_page.dart**: Administra el despliegue de pantallas durante la navegacion.
- **add_producto_page.dart**: Pantalla para agregar productos al menú.
- **menu_api.dart**: API local que maneja la manipulación de datos en la base de datos (simulada).
- **producto.dart**: Modelo de datos que representa un producto del menú.
- **users.dart**: Modelo de datos que representan la autenticacion de usuarios.
- **app_icons.dart**: Organiza todos los assets de tipo imagen por formato.
- **app_routes.dart**: Define las rutas de navegación para la aplicación.
- **app_routes.dart**: Define constantes estáticas que contienen textos específicos que aparecen en diferentes partes de la interfaz.


CONCLUSIÓN
=========================

Este proyecto es un ejemplo básico pero completo de cómo gestionar un menú de restaurante usando Flutter. Incluye la funcionalidad 
de agregar, modificar y cambiar la disponibilidad de productos de manera intuitiva y funcional.
